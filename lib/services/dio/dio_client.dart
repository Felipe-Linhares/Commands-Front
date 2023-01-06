// Package imports:

import 'package:commands/controllers/login_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class DioClient {
  static final _loginController = Get.find<LoginController>();

  DioClient._();
// TODO: CONSTRUTOR PRIVADO
  //static final DioClient dioClient = DioClient._();
  static Dio? dio;

  static get dioBase {
    if (dio == null) {
      dio = Dio(
        BaseOptions(
          connectTimeout: 5000,
          receiveTimeout: 5000,
          baseUrl: dotenv.env['baseURL'].toString(),
        ),
      );
      // // dio!.interceptors.add(CustomInterceptors());
      // dio!.options.headers[HttpHeaders.authorizationHeader] =
      //     _loginController.key.value;

      return dio;
    } else {
      return dio;
    }
  }

  static get options {
    return Options(
      headers: {
        'Authorization': _loginController.key.value,
        'Content-Type': 'application/json',
      },
    );
  }
}
