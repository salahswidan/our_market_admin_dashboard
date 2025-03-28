import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/functions/navigate_to.dart';
import 'package:our_market_admin_dashboard/features/products/models/product_model.dart';
import 'package:our_market_admin_dashboard/features/products/view/comments_view.dart';
import 'package:our_market_admin_dashboard/features/products/view/edit_product.dart';

import 'cache_image.dart';
import 'custom_elevated_button.dart';

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key, required this.product,
  });
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             CacheImage(
                height: 150,
                width: 200,
                url:
                   product.imageUrl ?? "https://img.freepik.com/premium-psd/3d-rendering-minimalist-interior-background-podium-product-display_285867-425.jpg?w=740"),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                 Text(
                product.productName ??   "Product Name",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                product.description ??  "Product Description",
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                    child: const Icon(Icons.edit),
                    onPressed: () => naviagteTo(context, EditProductView()))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Column(
              children: [
                 Text(
                 product.price ?? "Product Price",
                  style: TextStyle(fontSize: 22),
                ),
                const SizedBox(
                  height: 10,
                ),
                 Text(
                "${product.sale}%" ,
                  style: TextStyle(fontSize: 18),
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomElevatedButton(
                    child: const Icon(Icons.comment),
                    onPressed: () => naviagteTo(context, CommentsView()))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CustomElevatedButton(
                  child: Row(
                    children: const [Icon(Icons.delete), Text("Delete")],
                  ),
                  onPressed: () {}),
            )
          ],
        ),
      ),
    );
  }
}
