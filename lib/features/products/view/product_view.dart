import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';
import '../../../core/components/custom_product_card.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Products"),
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: ListView.builder(
          itemBuilder: (index, context) => const CustomProductCard(),
          itemCount: 10,
        ),
      ),
    );
  }
}
