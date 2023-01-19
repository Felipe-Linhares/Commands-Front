// Flutter imports:
// Project imports:
import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/components/form_components/validate_forms.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/modules/user/service/user_service.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';

class UserRegistrationPage extends StatefulWidget {
  const UserRegistrationPage({
    super.key,
  });

  @override
  State<UserRegistrationPage> createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  final _key = GlobalKey<FormState>();

  final _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: _key,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/notes.png",
                  width: 200,
                  height: 200,
                ),
                FormFieldCustom(
                    labelText: 'E-mail*',
                    controller: _userController.emailRegister.value,
                    osbcured: false,
                    prefixIcon: Icons.email,
                    textInputType: TextInputType.emailAddress,
                    validator: (String? value) {
                      return ValidateForms.validarEmail(value!);
                    }),
                FormFieldCustom(
                    labelText: 'Senha*',
                    controller: _userController.passwordRegister.value,
                    osbcured: true,
                    prefixIcon: Icons.lock,
                    textInputType: TextInputType.visiblePassword,
                    validator: (String? value) {
                      return ValidateForms.validarSenha(value!);
                    }),
                FormFieldCustom(
                    labelText: 'Nome*',
                    controller: _userController.nameRegister.value,
                    osbcured: false,
                    prefixIcon: Icons.people,
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      return ValidateForms.validarNome(value!, title: 'Nome');
                    }),
                FormFieldCustom(
                    labelText: 'Sobrenome*',
                    controller: _userController.lastNameRegister.value,
                    osbcured: false,
                    prefixIcon: Icons.people,
                    textInputType: TextInputType.text,
                    validator: (String? value) {
                      return ValidateForms.validarNome(value!,
                          title: 'Sobrenome');
                    }),
                ElevateButtonCustom(
                  width: 2,
                  onPressed: () => _userController.selecionarImagem(),
                  title: 'Adicionar Foto',
                ),
                ElevateButtonCustom(
                  width: 2,
                  title: 'Cadastrar Usuário',
                  onPressed: () {
                    _key.currentState!.validate();

                    UserService.userCreate(
                            email: _userController.emailRegister.value.text,
                            password:
                                _userController.passwordRegister.value.text,
                            name: _userController.nameRegister.value.text,
                            lastname:
                                _userController.lastNameRegister.value.text,
                            image: _userController.imageRegister.value.text)
                        .then((value) => Get.offAllNamed('/UserListPage'));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
