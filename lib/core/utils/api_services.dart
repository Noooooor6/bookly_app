import 'package:dio/dio.dart';

class ApiServices {
  final Dio dio;
  final _baseUrl = 'https://www.googleapis.com/books/v1/';
  ApiServices({required this.dio});

  Future<Map<String, dynamic>> get({required String endPoints}) async {
    var response = await dio.get('$_baseUrl$endPoints');

    return response.data;
  }
}
