// Dart imports:
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// Project imports:
import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/buttons_components/floating_action_button_custom.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/modules/comandas/components/commands_bottombar_custom.dart';
import 'package:commands/modules/comandas/controllers/commands_controller.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/modules/user/service/user_service.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserUpdateProfilePage extends StatefulWidget {
  const UserUpdateProfilePage({super.key});

  @override
  State<UserUpdateProfilePage> createState() => _UserUpdateProfilePageState();
}

class _UserUpdateProfilePageState extends State<UserUpdateProfilePage> {
  static final _commandsController = Get.find<CommandsController>();
  static final _userController = Get.find<UserController>();

  final TextEditingController _email =
      TextEditingController(text: (_userController.getUser.value.email));
  final TextEditingController _password =
      TextEditingController(text: (_userController.getUser.value.password));
  final TextEditingController _name =
      TextEditingController(text: (_userController.getUser.value.name));
  final TextEditingController _lastname =
      TextEditingController(text: (_userController.getUser.value.lastname));
  final TextEditingController _image =
      TextEditingController(text: (_userController.getUser.value.image));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.profileAppBarCustom(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            FormFieldCustom(
                labelText: 'E-mail*',
                controller: _email,
                osbcured: false,
                prefixIcon: Icons.email,
                textInputType: TextInputType.emailAddress,
                validator: (String? value) {
                  return '';
                }),
            FormFieldCustom(
                labelText: 'Senha*',
                controller: _password,
                osbcured: true,
                prefixIcon: Icons.lock,
                textInputType: TextInputType.visiblePassword,
                validator: (String? value) {
                  return '';
                }),
            FormFieldCustom(
                labelText: 'Nome*',
                controller: _name,
                osbcured: false,
                prefixIcon: Icons.people,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  return '';
                }),
            FormFieldCustom(
                labelText: 'Sobrenome*',
                controller: _lastname,
                osbcured: false,
                prefixIcon: Icons.people,
                textInputType: TextInputType.text,
                validator: (String? value) {
                  return '';
                }),
            ElevateButtonCustom(
              width: 2,
              onPressed: () => _selecionarImagem(),
              title: 'Atualizar Foto',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: ElevateButtonCustom(
                width: 2,
                onPressed: () {
                  UserService.userUpdate(
                          id: _userController.idUserLogged.value,
                          email: _email.text,
                          password: _password.text,
                          name: _name.text,
                          lastname: _lastname.text,
                          image: _image.text)
                      .then((value) => UserService.userShow(
                              id: _userController.idUserLogged.value)
                          .then(
                              (value) => Get.offAllNamed('/UserProfilePage')));
                },
                title: 'Atualizar Perfil',
              ),
            ),
          ]),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButtomCustom(
        onPressed: () {
          _commandsController.clearCommandsFields();
          Get.offAllNamed('/CommandsRegistrationPage');
        },
      ),
      bottomNavigationBar: const CommandsBottomBarCustom(),
    );
  }

  _selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(
        source: ImageSource.gallery,
        // maxWidth: 500,
        // maxHeight: 500,
        imageQuality: 10,
      );
      if (file != null) {
        _image.text = (base64Encode(
          File(file.path).readAsBytesSync(),
        ));
        log(_image.text);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
