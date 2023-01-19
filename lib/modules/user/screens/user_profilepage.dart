// Dart imports:
import 'dart:convert';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/buttons_components/floating_action_button_custom.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/divider_custom.dart';
import 'package:commands/components/textview_custom.dart';
import 'package:commands/modules/comandas/components/commands_bottombar_custom.dart';
import 'package:commands/modules/comandas/controllers/commands_controller.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/modules/user/service/user_service.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});

  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  static final _commandsController = Get.find<CommandsController>();
  static final _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.profileAppBarCustom(),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: CircleAvatar(
                radius: Components.width(context) / 4,
                child: _userController.getUser.value.image == ''
                    ? Icon(
                        Icons.person_outline,
                        size: Components.width(context) / 4,
                      )
                    : Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.orange,
                          ),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: MemoryImage(
                              base64Decode(
                                _userController.getUser.value.image.toString(),
                              ),
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
              ),
            )
          ],
        ),
        TextViewCustom(title: _userController.getUser.value.name, fontSize: 10),
        const DividerCustom(),
        TextViewCustom(
            title: _userController.getUser.value.email, fontSize: 16),
        const DividerCustom(),
        Padding(
          padding: const EdgeInsets.only(top: 16),
          child: ElevateButtonCustom(
            width: 2,
            title: 'Atualizar Perfil',
            onPressed: () =>
                UserService.userShow(id: _userController.idUserLogged.value)
                    .then((value) => Get.offAllNamed('/UserUpdateProfilePage')),
          ),
        )
      ]),
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
}
