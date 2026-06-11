import 'package:dio/dio.dart';

abstract class Failure {
  final String errmessage;

  Failure({required this.errmessage});
}

class ServerEror extends Failure {
  ServerEror({required super.errmessage});

  factory ServerEror.fromDioException(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerEror(errmessage: 'Connection timeOut with Api server');
      case DioExceptionType.sendTimeout:
        return ServerEror(errmessage: 'Send timeOut with Api server');
      case DioExceptionType.receiveTimeout:
        return ServerEror(errmessage: 'Receive timeOut with Api server');
      case DioExceptionType.badCertificate:
        return ServerEror(errmessage: 'Bad certificate');
      case DioExceptionType.badResponse:
        return ServerEror.fromResponse(
          dioError.response?.statusCode ?? 0,
          dioError.response?.data,
        );
      case DioExceptionType.cancel:
        return ServerEror(errmessage: 'Request was cancelled');
      case DioExceptionType.connectionError:
        return ServerEror(errmessage: 'No internet connection');
      case DioExceptionType.unknown:
        return ServerEror(errmessage: 'un expected error, please try again');
    }
  }

  factory ServerEror.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerEror(errmessage: response['error']['message']);
    } else if (statusCode == 404) {
      return ServerEror(errmessage: 'Your request not found, try later!');
    } else if (statusCode == 500) {
      return ServerEror(errmessage: 'Internal server error, try later');
    } else {
      return ServerEror(errmessage: 'opps there was an error');
    }
  }
}
