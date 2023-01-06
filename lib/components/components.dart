// Flutter imports:
import 'package:commands/controllers/geral_controller.dart';
import 'package:commands/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Components {
  // * responsiveness
  static height(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static width(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static SnackbarController errorSnackBarCustom({
    required String title,
    required String menssage,
  }) {
    return Get.snackbar(title, menssage,
        duration: const Duration(seconds: 15),
        backgroundColor: Colors.orange,
        dismissDirection: DismissDirection.horizontal);
  }

  static AppBar profileAppBarCustom() {
    final loginController = Get.find<LoginController>();
    final geralController = Get.find<GeralController>();
    return AppBar(
      title: const Text('Perfil'),
      actions: [
        IconButton(
          onPressed: () {
            loginController.clearFieldsLogin();
            geralController.defaultIndexMenu();

            Get.offAllNamed('/LoginPage');
          },
          icon: const Icon(Icons.logout),
        )
      ],
    );
  }
}
