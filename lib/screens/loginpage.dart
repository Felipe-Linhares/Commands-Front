// Flutter imports:

// Project imports:

import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/controllers/login_controller.dart';
import 'package:commands/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _loginController = Get.find<LoginController>();

  // final _comandasController = Get.find<ComandasController>();
  @override
  void dispose() {
    // _comandasController.saved.value != _comandasController.saved.value;
    // const LoginPage(title: 'LoginPage');

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
              // ElevatedButton(
              //     onPressed: () {
              //       UserService.usuarioShow();
              //       // LoginService.login();
              //     },
              // child: const Text('acessar')),
              ElevateButtonCustom(
                width: 3,

                title: 'Acessar',
                // isLoader: _loginController.isLoader.value,
                onPressed: () {
                  LoginService.login();
                  // _loginController.isLoader.value = true;
                  // _loginController.auth().then((value) {
                  //   if (value) {
                  //     Get.offAllNamed('/HomePage');
                  //   } else {
                  //     print('failed');
                  //   }
                  // });
                },
              ),
              // GestureButtonCustom(
              //   title: 'Ainda não possui conta? ',
              //   textColor: 'Cadastre-se!!',
              //   onTap: () => Get.offNamed("/RegistrationPage"),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
