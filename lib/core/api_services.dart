import 'package:dio/dio.dart';
import 'sensitive_data.dart';

class ApiServices {
  final Dio _dio = Dio(
    BaseOptions(
        baseUrl: 'https://fkjveyulwgvqmkuqllmi.supabase.co/rest/v1/',
        headers: {
          "apikey": anonkey,
        }),
  );
  Future<Response> getData(String path) async {
    return await _dio.get(path);
  }

  Future<Response> postData(String path, Map<String, dynamic> data) async {
    return await _dio.post(path, data: data);
  }

  Future<Response> patchData(String path, Map<String, dynamic> data) async {
    return await _dio.patch(path, data: data);
  }

  Future<Response> deleteData(String path) async {
    return await _dio.delete(path);
  }
}
