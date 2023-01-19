// Dart imports:
import 'dart:developer';

// Project imports:
import 'package:commands/components/components.dart';
import 'package:commands/controllers/login_controller.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/modules/user/model/user_model.dart';
import 'package:commands/services/dio/dio_client.dart';
// Package imports:
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class UserService {
  static final _loginController = Get.find<LoginController>();
  static final _userController = Get.find<UserController>();

// * GET
  static Future userIndex() async {
    log('opaaa');
    log(_loginController.key.value);

    try {
      final response = await DioClient.dioBase
          .get('/users/index', options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          _userController.userShowList(response.data);
          return response.data;
        // case 201:

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
  }

// * SHOW
  static Future userShow({
    int? id,
  }) async {
    try {
      final response = await DioClient.dioBase
          .get('/users/show/$id', options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          _userController.getUserShow(response.data);
          return UserModel.fromJson(response.data);

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
  }

// * CREATE
  static Future userCreate({
    String? email,
    String? password,
    String? name,
    String? lastname,
    String? image,
  }) async {
    try {
      final response = await DioClient.dioBase.post('/users/create',
          data: {
            'email': email!.toLowerCase(),
            'password': password,
            'name': name,
            'lastname': lastname,
            'image': image
          },
          options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          return UserModel.fromJson(response.data);
        case 201:
          return UserModel.fromJson(response.data);

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
  }

  // * UPDATE
  static Future userUpdate({
    int? id,
    String? email,
    String? password,
    String? name,
    String? lastname,
    String? image,
  }) async {
    try {
      final response = await DioClient.dioBase.put('/users/update/$id',
          data: {
            'id': id,
            'email': email!.toLowerCase(),
            'password': password,
            'name': name,
            'lastname': lastname,
            'image': image
          },
          options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          return UserModel.fromJson(response.data);
        case 201:
          return UserModel.fromJson(response.data);

        default:
      }
    } on DioError catch (err) {
      switch (err.response!.statusCode) {
        case 413:
          return Components.errorSnackBarCustom(
              title: 'Erro ao Enviar',
              menssage: 'A imagem é muito grande, selecione outra.');

        default:
      }
      log(err.toString());

      rethrow;
    }
  }

// * Delete
  static Future userDelete({
    int? id,
  }) async {
    try {
      final response = await DioClient.dioBase
          .delete('/users/delete/$id', options: DioClient.options);

      switch (response.statusCode) {
        case 204:
          return log('User deleted');

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
  }
}
