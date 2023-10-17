// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';

class DioException implements Exception {
  DioException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.unknown:
        message = "Connection failed due to internet connection";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String? message;

  String _handleError(int statuscode, dynamic error) {
    switch (statuscode) {
      case 400:
        return error["message"] ?? error["data"]["error"] ?? "errors";
      case 401:
        return error["message"];
      case 404:
        return error["message"] ?? "Not found";
      case 422:
        return error["message"] ??
            error["data"]["message"] ??
            error["data"]["error"] ??
            "Something went wrong";
      case 500:
        return "Internal server error";
      default:
        return "Something went wrong";
    }
  }
}
