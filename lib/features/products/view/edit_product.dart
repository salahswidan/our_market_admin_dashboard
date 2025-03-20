import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/components/cache_image.dart';
import 'package:our_market_admin_dashboard/core/components/custom_elevated_button.dart';
import 'package:our_market_admin_dashboard/core/components/custom_text_field.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';

class EditProductView extends StatelessWidget {
  const EditProductView({super.key});

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
                const Column(
                  children: [
                    Text("sale"),
                    SizedBox(
                      height: 10,
                    ),
                    Text("10 %"),
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
            const SizedBox(height: 60,),
            const CustomTextField(lableText: "Product Name"),
                        const SizedBox(height: 10,),
                            const CustomTextField(lableText: "New Price"),
                        const SizedBox(height: 10,),
                            const CustomTextField(lableText: "Old Price"),
                        const SizedBox(height: 10,),
           
         const CustomTextField(lableText: "Product Description"),
                        const SizedBox(height: 20,), 
                        CustomElevatedButton(child: const Text("Update"), onPressed: (){})
          ],
        ),
      ),
    );
  }
}
