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
      print("Uploading to: $uploadUrl");
      print("Headers: apikey=$apiKey, Authorization=Bearer $token");
      print("FormData: ${formData.fields}, ${formData.files}");

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

      print("Response: ${response.statusCode}, ${response.data}");
      if (response.statusCode == 200 || response.statusCode == 201) {
        imageUrl = "https://fkjveyulwgvqmkuqllmi.supabase.co/storage/v1/object/public/${response.data["Key"]}";
        print("Upload successful: ${response.data["Key"]}");
        emit(UploadImageSuccess());
      } else {
        print("Upload failed: ${response.data}");
        emit(UploadImageError());
      }
    } catch (e) {
      print("Upload Image Error: $e");
      emit(UploadImageError());
    }
  }
}
