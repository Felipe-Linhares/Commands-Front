// Dart imports:
import 'dart:developer';

// Project imports:
import 'package:commands/components/components.dart';
import 'package:commands/controllers/login_controller.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/services/dio/dio_client.dart';
// Package imports:
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class LoginService {
  static final _loginController = Get.find<LoginController>();
  static final _userController = Get.find<UserController>();

  static Future login() async {
    try {
      final response = await DioClient.dioBase.post('login/', data: {
        'email':
            _loginController.emailLogin.value.text.toString().toLowerCase(),
        'password': _loginController.senhaLogin.value.text,
      });

      switch (response.statusCode) {
        case 200:
          _loginController.key.value = response.data['token'].toString();
          _userController.idUserLogged.value = response.data['id'];

          switch (response.data['role'] == 'USER') {
            case true:
              return Get.offAllNamed('/CommandsHomePage');
            case false:
              return Get.offAllNamed('/AdminHomePage');
          }

          return response.data;
      }
    } on DioError catch (err) {
      log(err.toString());

      switch (err.response!.statusCode) {
        case 400:
          return Components.errorSnackBarCustom(
              title: 'Erro ao Enviar',
              menssage: 'Entre em contato com o suporte.');
        case 401:
          return Components.errorSnackBarCustom(
              title: 'Erro ao Enviar',
              menssage:
                  'Você não tem autorização, entre em contato com o suporte.');

        default:
      }
      log(err.toString());

      rethrow;
    }
  }
}
