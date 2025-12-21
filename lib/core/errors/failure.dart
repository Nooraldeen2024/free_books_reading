import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioException(DioException e) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('انتهت مهلة الاتصال بالسيرفر');
      case DioExceptionType.sendTimeout:
        return ServerFailure('انتهت مهلة إرسال الطلب');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('انتهت مهلة استقبال البيانات');

      case DioExceptionType.badResponse:
        final statusCode = e.response?.statusCode;
        final data = e.response?.data;
        return ServerFailure.fromResponse(statusCode!, data);
      // تقدر تخصص الرسالة حسب statusCode لو تبغى
      // return ServerFailure('خطأ من السيرفر: $statusCode');

      case DioExceptionType.cancel:
        return ServerFailure('تم إلغاء الطلب');

      case DioExceptionType.connectionError:
        return ServerFailure('لا يوجد اتصال بالإنترنت');

      case DioExceptionType.badCertificate:
        return ServerFailure('مشكلة في شهادة الأمان');

      case DioExceptionType.unknown:
      default:
        return ServerFailure('حدث خطأ غير متوقع');
    }
  }
  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Yuor request not found ,please try later! ');
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server error,please try late');
    } else {
      return ServerFailure('oops There was an Error, please try again');
    }
  }
}
