import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';
import 'package:our_market_admin_dashboard/features/products/cubit/cubit/product_cubit.dart';
import '../../../core/components/custom_product_card.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit()..getProducts(),
      child: BlocConsumer<ProductCubit, ProductState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
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
        },
      ),
    );
  }
}
