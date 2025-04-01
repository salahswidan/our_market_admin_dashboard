import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin_dashboard/core/components/cache_image.dart';
import 'package:our_market_admin_dashboard/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market_admin_dashboard/core/components/custom_elevated_button.dart';
import 'package:our_market_admin_dashboard/core/components/custom_text_field.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';
import 'package:our_market_admin_dashboard/features/products/cubit/cubit/product_cubit.dart';

import '../../../core/functions/navigate_without_back.dart';
import '../../../core/functions/pick_image.dart';
import '../../../core/functions/show_msg.dart';
import '../../home/views/home_view.dart';

class AddProductView extends StatefulWidget {
  const AddProductView({super.key});

  @override
  State<AddProductView> createState() => _AddProductViewState();
}

class _AddProductViewState extends State<AddProductView> {

  String selectedValue = "Collections";
  String Discount = "10";
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();
          Uint8List? _selectedImage;
  String _imageName = "imageName";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          if (state is AddProductSuccess){
            showMsg(context, "Product added successfully",   );
            naviagteWithoutBack(context, const HomeView());
          }
        },
        builder: (context, state) {
          ProductCubit cubit = context.read<ProductCubit>();
          return Scaffold(
                appBar: buildCustomAppBar(context, "Add Product"),
                body:state is AddProductLoading? const CustomCircleIndicator(): Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          DropdownMenu(
                              onSelected: (String? value) {
                                setState(() {
                                  selectedValue = value ?? "Collections";
                                });
                              },
                              initialSelection: selectedValue,
                              dropdownMenuEntries: [
                            const DropdownMenuEntry(
                              label: "Sports",
                              value: "sports",
                            ),
                            const DropdownMenuEntry(
                              label: "Electronics",
                              value: "electronics",
                            ),
                            const DropdownMenuEntry(
                              label: "Collections",
                              value: "collections",
                            ),
                            const DropdownMenuEntry(
                              label: "Books",
                              value: "books",
                            ),
                            const DropdownMenuEntry(
                              label: "Bikes",
                              value: "bikes",
                            ),
                          ]),
                          const SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              Text("sale"),
                              Text("$Discount %"),
                            ],
                          ),
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child:_selectedImage != null
                                ? Image.memory(
                                    _selectedImage!,
                                    height: 300,
                                    width: 200,
                                  )
                                : const CacheImage(
                                    url:
                                        'https://img.freepik.com/premium-psd/3d-rendering-minimalist-interior-background-podium-product-display_285867-425.jpg?w=740',
                                    width: 200,
                                    height: 200),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  CustomElevatedButton(
                                      child: const Icon(Icons.image), onPressed: () async{
                                           await pickImage().then((value)async {
                                                if (value != null) {
                                                  setState(() {
                                                    _imageName = value.files.first.name;
                                                    Uint8List? bytes =
                                                        value.files.first.bytes;
                                                    _selectedImage = bytes;
                                                  });
                                                }
                                              });
                                      }),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  CustomElevatedButton(
                                      child: const Icon(Icons.upload_file_rounded),
                                      onPressed: state is UploadImageLoading
                                      ? null
                                      : () async {
                                          if (_selectedImage != null) {
                                            await cubit.uploadImage(
                                              image: _selectedImage!,
                                              imageName: _imageName,
                                              bucketName: "images",
                                            );
                                          }
                                        }),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      CustomTextField(
                        lableText: "Product Name",
                        controller: _productNameController,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                         CustomTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    lableText: "Old Price (Before Discount)",
                    controller: _oldPriceController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomTextField(
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    lableText: "New Price (After Discount)",
                    controller: _newPriceController,
                    onChanged: (String val) {
                      double x = (double.parse(_oldPriceController.text) -
                              double.parse(val)) /
                          double.parse(_oldPriceController.text) *
                          100;
                      setState(() {
                        Discount = x.round().toString();
                      });
                    },
                  ),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomTextField(
                        lableText: "Product Description",
                        controller: _productDescriptionController,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: CustomElevatedButton(
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text("Add"),
                            ),
                            onPressed: state is UploadImageLoading ? null : () async {
                          cubit.addProduct(
                              data: {
                                "product_name": _productNameController.text,
                                "price": _newPriceController.text,
                                "old_price": _oldPriceController.text,
                                "sale": Discount,
                                "description":
                                    _productDescriptionController.text,
                                "category": selectedValue,
                                "image_url": 
                                     cubit.imageUrl
                              });
                        }),
                      )
                    ],
                  ),
                ),
              );
        },
      ),
    );
  }

  @override
  void dispose() {
    _productNameController.dispose();
    _newPriceController.dispose();
    _oldPriceController.dispose();
    _productDescriptionController.dispose();
    super.dispose();
  }
}
