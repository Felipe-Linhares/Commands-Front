// Flutter imports:
// Project imports:
import 'package:commands/controllers/comandas_controller.dart';
import 'package:commands/controllers/geral_controller.dart';
import 'package:commands/controllers/login_controller.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/routes/routes.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  Get.put(LoginController());
  Get.put(UserController());

  Get.put(ComandasController());
  Get.put(GeralController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'Comandas',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromRGBO(255, 152, 0, 1),
              primary: Colors.orange,
              secondary: Colors.orange.shade300),
        ),
        initialRoute: '/LoginPage',
        getPages: routes);
  }
}
