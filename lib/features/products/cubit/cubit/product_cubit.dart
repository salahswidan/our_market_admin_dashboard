import 'dart:math';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:our_market_admin_dashboard/core/sensitive_data.dart';
import 'package:our_market_admin_dashboard/core/shared_pref.dart';
import 'package:our_market_admin_dashboard/features/products/models/product_model.dart';

import '../../../../core/api_services.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  final ApiServices _apiServices = ApiServices();
  List<ProductModel> products = [];

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    try {
      String? token = await SharedPref.getToken();
      Response response = await _apiServices.getData("product_table", token);
      for (Map<String, dynamic> product in response.data) {
        products.add(ProductModel.fromJson(product));
      }
      emit(GetProductsSuccess());
    } catch (e) {
      print(e.toString());
      emit(GetProductsError());
    }
  }

  String imageUrl = "";

  Future<void> uploadImage(
      {required Uint8List image,
      required String imageName,
      required String bucketName}) async {
    emit(UploadImageLoading());
    const String _storageBaseUrl =
        "https://fkjveyulwgvqmkuqllmi.supabase.co/storage/v1/object";
    const String apiKey = anonkey;
    final String? token = await SharedPref.getToken();

    // Encode the filename to handle special characters
    final String encodedImageName = Uri.encodeComponent(imageName);
    final String uploadUrl = "$_storageBaseUrl/$bucketName/$encodedImageName";

    final Dio _dio = Dio();
    FormData formData = FormData.fromMap({
      "file": MultipartFile.fromBytes(
        image,
        filename: imageName, // Original filename for the server
      ),
    });

    try {
     

      Response response = await _dio.post(
        uploadUrl,
        data: formData,
        options: Options(
          headers: {
            "apikey": apiKey,
            "Authorization": "Bearer $token",
            // Removed "Content-Type" to let Dio handle it
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        imageUrl =
            "https://fkjveyulwgvqmkuqllmi.supabase.co/storage/v1/object/public/${response.data["Key"]}";
        emit(UploadImageSuccess());
      } else {
        emit(UploadImageError());
      }
    } catch (e) {
      emit(UploadImageError());
    }
  }

  Future<void> editProduct({required Map<String, dynamic> data,required String productId}) async {
    emit(EditProductLoading());
    try {
      String? token = await SharedPref.getToken();
   Response response =   await _apiServices.patchData("product_table?product_id=eq.$productId", data,token);
      if(response.statusCode == 204){
              emit(EditProductSuccess());

      }
    } catch (e) {
      emit(EditProductError());
    }
  }

  Future<void> deleteProduct({required String productId}) async {
    emit(DeleteProductLoading());
    try {
      String? token = await SharedPref.getToken();
      await _apiServices.deleteData("comments_table?for_product=eq.$productId",token );
      await _apiServices.deleteData("favorite_products?for_product=eq.$productId",token );
      await _apiServices.deleteData("purchase_table?for_product=eq.$productId",token );
      await _apiServices.deleteData("rates_table?for_product=eq.$productId",token );
      await _apiServices.deleteData("product_table?product_id=eq.$productId",token );
      emit(DeleteProductSuccess());
    } catch (e) {
      emit(DeleteProductError());
    }
  }}

