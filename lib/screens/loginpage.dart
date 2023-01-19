// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/controllers/login_controller.dart';
import 'package:commands/services/login_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.find<LoginController>();

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Components.width(context),
        height: Components.height(context),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/notes.png',
                scale: 3,
              ),
              Obx(
                () => FormFieldCustom(
                    labelText: 'E-mail',
                    osbcured: false,
                    controller: _loginController.emailLogin.value,
                    prefixIcon: Icons.email,
                    textInputType: TextInputType.emailAddress),
              ),
              Obx(
                () => FormFieldCustom(
                    labelText: 'Senha',
                    osbcured: true,
                    controller: _loginController.senhaLogin.value,
                    prefixIcon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    maxLines: 1),
              ),
              ElevateButtonCustom(
                width: 3,
                title: 'Acessar',
                onPressed: () {
                  LoginService.login();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
