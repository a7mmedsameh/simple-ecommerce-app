import 'package:dio/dio.dart';

class ApiService {
  final String baseUrl = 'https://api.escuelajs.co/api/v1';
  final Dio dio = Dio()..options.headers = {'Content-Type': 'application/json'};

  Future<dynamic> get({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    var response = await dio.get(
      '$baseUrl$endPoint',
      queryParameters: queryParameters,
      options: Options(headers: headers ?? {}),
    );
    return response.data;
  }

  Future<dynamic> post({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    var response = await dio.post(
      '$baseUrl$endPoint',
      data: data ?? {},
      options: Options(headers: headers ?? {}),
    );
    return response.data;
  }

  Future<dynamic> put({
    required String endPoint,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? data,
  }) async {
    var response = await dio.put(
      '$baseUrl$endPoint',
      data: data ?? {},
      options: Options(headers: headers ?? {}),
    );
    return response.data;
  }

  Future<void> delete({
    required String endPoint,
    Map<String, dynamic>? headers,
  }) async {
    await dio.delete(
      '$baseUrl$endPoint',
      options: Options(headers: headers ?? {}),
    );
  }
}
