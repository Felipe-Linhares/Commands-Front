import 'package:commands/components/buttons_components/floating_action_button_custom.dart';
import 'package:commands/components/buttons_components/iconbutton_custom.dart';
import 'package:commands/components/buttons_components/lists_action_button.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/divider_custom.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/components/textview_custom.dart';
import 'package:commands/modules/comandas/components/commands_bottombar_custom.dart';
import 'package:commands/modules/comandas/controllers/commands_controller.dart';
import 'package:commands/modules/comandas/service/commands_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandsHomePage extends StatefulWidget {
  const CommandsHomePage({super.key});

  @override
  State<CommandsHomePage> createState() => _CommandsHomePageState();
}

class _CommandsHomePageState extends State<CommandsHomePage> {
  static final _commandsController = Get.find<CommandsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appbar('HomePage'),
      body: FutureBuilder(
        future: CommandsService.commandsIndex(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return const Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasData) {
                return Column(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: _commandsController.allCommands.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 1,
                                child: ExpansionTile(
                                  title: TextViewCustom(
                                    fontSize: 20,
                                    title: _commandsController
                                        .allCommands[index].name,
                                  ),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              TextViewCustom(
                                                fontSize: 22,
                                                title: 'Pedido: '
                                                    ' ${_commandsController.allCommands[index].request}',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextViewCustom(
                                                fontSize: 22,
                                                title: 'Observação: '
                                                    ' ${_commandsController.allCommands[index].note}',
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              TextViewCustom(
                                                fontSize: 22,
                                                title: 'Pedido Feito em: '
                                                    ' ${_commandsController.allCommands[index].created}',
                                              ),
                                            ],
                                          ),
                                          const DividerCustom()
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ButtonActionLists(
                                            color: Colors.green,
                                            icon: Icons.edit,
                                            onPressed: () =>
                                                onPressedEditingButton(
                                                    context, index),
                                          ),
                                          ButtonActionLists(
                                            color: Colors.red,
                                            icon: Icons.delete,
                                            onPressed: () =>
                                                onPressedDeleteButton(
                                                    context, index),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            }),
                      ),
                    ),
                  ],
                );
              } else {
                return const Center(
                  child: Text('Sem dados'),
                );
              }
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: Text('Erro ao carregar dados..'),
                );
              } else {
                return const Center(
                  child: Text(
                    "Carregando...",
                    style: TextStyle(color: Colors.red, fontSize: 25),
                  ),
                );
              }
          }
        },
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

  Future<dynamic> onPressedDeleteButton(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deletar este pedido?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtomCustom(
                  onPressed: () {
                    CommandsService.commandsDelete(
                            id: _commandsController.allCommands[index].id)
                        .then(
                      (value) => Get.offAllNamed('/CommandsHomePage'),
                    );
                  },
                  color: Colors.green,
                  icon: Icons.check,
                ),
                IconButtomCustom(
                  onPressed: () => Get.back(),
                  color: Colors.red,
                  icon: Icons.cancel,
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  Future<dynamic> onPressedEditingButton(BuildContext context, int index) {
    TextEditingController name = TextEditingController(
        text: (_commandsController.allCommands[index].name));
    TextEditingController request = TextEditingController(
        text: (_commandsController.allCommands[index].request));
    TextEditingController note = TextEditingController(
        text: (_commandsController.allCommands[index].note));

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: Column(children: [
                FormFieldCustom(
                    maxLines: 2,
                    osbcured: false,
                    validator: (value) {
                      return '';
                    },
                    controller: name,
                    textInputType: TextInputType.text,
                    labelText: 'Nome',
                    prefixIcon: Icons.table_bar),
                FormFieldCustom(
                    maxLines: 2,
                    osbcured: false,
                    controller: request,
                    validator: (value) {
                      return '';
                    },
                    textInputType: TextInputType.text,
                    labelText: 'Pedido',
                    prefixIcon: Icons.bookmark),
                FormFieldCustom(
                    maxLines: 2,
                    osbcured: false,
                    validator: (value) {
                      return '';
                    },
                    controller: note,
                    textInputType: TextInputType.text,
                    labelText: 'Observação',
                    prefixIcon: Icons.note),
              ]),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtomCustom(
                      onPressed: () {
                        CommandsService.commandsUpdate(
                                id: _commandsController.allCommands[index].id,
                                name: name.text,
                                note: note.text,
                                request: request.text)
                            .then((value) =>
                                Get.offAllNamed('/CommandsHomePage'));
                      },
                      color: Colors.green,
                      icon: Icons.check,
                    ),
                    IconButtomCustom(
                      onPressed: () => Get.back(),
                      color: Colors.red,
                      icon: Icons.cancel,
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }
}
