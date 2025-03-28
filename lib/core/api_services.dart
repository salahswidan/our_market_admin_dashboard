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
  Future<Response> getData(String path, String? token) async {
    return await _dio.get(path,
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
          },
        ));
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

  final Dio dioAuth = Dio(
    BaseOptions(
      baseUrl: 'https://fkjveyulwgvqmkuqllmi.supabase.co/auth/v1/',
      headers: {
        "apikey": anonkey,
      },
      validateStatus: (status) {
        return true;
      },
    ),
  );

  Future<Response> createAnAccount(
      String endpoint, Map<String, dynamic> data) async {
    return await dioAuth.post(endpoint, data: data);
  }

  Future<Response> login(String endpoint, Map<String, dynamic> data) async {
    return await dioAuth.post(
      endpoint,
      data: data,
      queryParameters: {
        "grant_type": "password",
      },
    );
  }
}
