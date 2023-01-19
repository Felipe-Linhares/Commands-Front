// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/buttons_components/floating_action_button_custom.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/modules/comandas/components/commands_bottombar_custom.dart';
import 'package:commands/modules/comandas/controllers/commands_controller.dart';
import 'package:commands/modules/comandas/service/commands_service.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';

class CommandsRegistrationPage extends StatefulWidget {
  const CommandsRegistrationPage({super.key});

  @override
  State<CommandsRegistrationPage> createState() =>
      _CommandsRegistrationPageState();
}

class _CommandsRegistrationPageState extends State<CommandsRegistrationPage> {
  static final _commandsController = Get.find<CommandsController>();
  static final _userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appbar('Registro de Comandas'),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: FormFieldCustom(
                maxLines: 1,
                labelText: 'Nome',
                controller: _commandsController.nameCommands.value,
                osbcured: false,
                prefixIcon: Icons.table_bar,
                textInputType: TextInputType.text,
                validator: (p0) => '',
              ),
            ),
            FormFieldCustom(
              labelText: 'Pedido',
              controller: _commandsController.requestCommands.value,
              osbcured: false,
              prefixIcon: Icons.bookmark,
              textInputType: TextInputType.text,
              maxLines: 5,
              validator: (p0) => '',
            ),
            FormFieldCustom(
              labelText: 'Obervação',
              controller: _commandsController.noteCommands.value,
              osbcured: false,
              prefixIcon: Icons.note,
              textInputType: TextInputType.text,
              maxLines: 3,
              validator: (p0) => '',
            ),
            ElevateButtonCustom(
              width: 3,
              title: 'Cadastrar',
              onPressed: () {
                CommandsService.commandsCreate(
                        userId: _userController.idUserLogged.value,
                        name: _commandsController.nameCommands.value.text,
                        note: _commandsController.noteCommands.value.text,
                        request: _commandsController.requestCommands.value.text)
                    .then((value) => Get.offAllNamed('/CommandsHomePage'));
              },
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
}
