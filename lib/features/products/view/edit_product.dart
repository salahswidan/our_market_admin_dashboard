import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/components/cache_image.dart';
import 'package:our_market_admin_dashboard/core/components/custom_elevated_button.dart';
import 'package:our_market_admin_dashboard/core/components/custom_text_field.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';

import '../../../core/shared_pref.dart';

class EditProductView extends StatefulWidget {
  const EditProductView({super.key});

  @override
  State<EditProductView> createState() => _EditProductViewState();
}

class _EditProductViewState extends State<EditProductView> {
  String selectedValue = "Collections";
  String sale = "10";
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _newPriceController = TextEditingController();
  final TextEditingController _oldPriceController = TextEditingController();
  final TextEditingController _productDescriptionController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Edit Product"),
      body: Padding(
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
                        value: "Sports",
                      ),
                      const DropdownMenuEntry(
                        label: "Electronics",
                        value: "Electronics",
                      ),
                      const DropdownMenuEntry(
                        label: "Collections",
                        value: "Collections",
                      ),
                      const DropdownMenuEntry(
                        label: "Books",
                        value: "Books",
                      ),
                      const DropdownMenuEntry(
                        label: "Bikes",
                        value: "Bikes",
                      ),
                    ]),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Text("sale"),
                    Text("$sale %"),
                  ],
                ),
                Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const CacheImage(
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
                            child: const Icon(Icons.image), onPressed: () {}),
                        const SizedBox(
                          width: 10,
                        ),
                        CustomElevatedButton(
                            child: const Icon(Icons.upload_file_rounded),
                            onPressed: () {}),
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
              lableText: "New Price",
              controller: _newPriceController,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomTextField(
              lableText: "Old Price",
              controller: _oldPriceController,
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
                    child: Text("Update"),
                  ),
                  onPressed: () async {
                    String? token = await SharedPref.getToken();
                    print("Token ===> $token");
                  }),
            )
          ],
        ),
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
