import 'dart:developer';

import 'package:commands/modules/comandas/controllers/commands_controller.dart';
import 'package:commands/modules/comandas/model/commands_model.dart';
import 'package:commands/services/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CommandsService {
  static final _commandsController = Get.find<CommandsController>();
// * GET
  static Future commandsIndex() async {
    try {
      final response = await DioClient.dioBase
          .get('/commands/index', options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          log('todas as comands ${response.data}');
          _commandsController.commandsShowList(response.data);
          return response.data;

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
    return null;
  }

  // * SHOW
  static Future commandsShow({
    int? id,
  }) async {
    try {
      final response = await DioClient.dioBase
          .get('/commands/show/$id', options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          _commandsController.getCommandsShow(response.data);
          return CommandsModel.fromJson(response.data);

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
    return null;
  }

  // * CREATE
  static Future commandsCreate({
    int? userId,
    String? name,
    String? request,
    String? note,
  }) async {
    try {
      final response = await DioClient.dioBase.post('/commands/create',
          data: {
            'userId': userId,
            'name': name,
            'request': request,
            'note': note,
          },
          options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          return response.data;
        case 201:
          return response.data;

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
    return null;
  }

  // * UPDATE
  static Future commandsUpdate({
    int? id,
    // int? userId,
    String? name,
    String? request,
    String? note,
  }) async {
    try {
      final response = await DioClient.dioBase.put('/commands/update/$id',
          data: {
            'id': id,
            // 'userId': userId!,
            'name': name,
            'request': request,
            'note': note,
          },
          options: DioClient.options);

      switch (response.statusCode) {
        case 200:
          return CommandsModel.fromJson(response.data);
        case 201:
          return CommandsModel.fromJson(response.data);

        default:
      }
    } on DioError catch (err) {
      // switch (err.response!.statusCode) {
      //   case 413:
      //     return Components.errorSnackBarCustom(
      //         title: 'Erro ao Enviar',
      //         menssage: 'A imagem é muito grande, selecione outra.');

      //   default:
      // }
      log(err.toString());

      rethrow;
    }
    return null;
  }

  // * Delete
  static Future commandsDelete({
    int? id,
  }) async {
    try {
      final response = await DioClient.dioBase
          .delete('/commands/delete/$id', options: DioClient.options);

      switch (response.statusCode) {
        case 204:
          return log('User deleted');

        default:
      }
    } on DioError catch (err) {
      log(err.toString());
      rethrow;
    }
    return null;
  }
}
