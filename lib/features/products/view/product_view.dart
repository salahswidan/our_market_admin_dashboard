import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin_dashboard/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';
import 'package:our_market_admin_dashboard/core/functions/navigate_without_back.dart';
import 'package:our_market_admin_dashboard/core/functions/show_msg.dart';
import 'package:our_market_admin_dashboard/features/home/views/home_view.dart';
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
          if (state is DeleteProductSuccess){
            showMsg(context, "Product deleted successfully",   );
            naviagteWithoutBack(context, const HomeView());
          }
        },
        builder: (context, state) {
          ProductCubit cubit = context.read<ProductCubit>();
          return Scaffold(
            appBar: buildCustomAppBar(context, "Products"),
            body:state is GetProductsLoading || state is DeleteProductLoading ? const Center(
              child: CustomCircleIndicator()) : Padding(
              padding: const EdgeInsets.all(1.0),
              child: ListView.builder(
                itemBuilder: (contexxt, index) =>  
                CustomProductCard(
                  deleteProduct: (){
                    cubit.deleteProduct(productId: 
                     cubit.products[index].productId!);
                  },
                  product: cubit.products[index],
                ),
                itemCount: cubit.products.length,
              ),
            ),
          
          );
        },
      ),
    );
  }
}

//admin33@gmail.com
//12345678FF