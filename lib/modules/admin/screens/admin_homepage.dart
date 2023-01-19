// Flutter imports:
// Project imports:
import 'package:commands/components/buttons_components/floating_action_button_custom.dart';
import 'package:commands/components/buttons_components/iconbutton_custom.dart';
import 'package:commands/components/buttons_components/lists_action_button.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/divider_custom.dart';
import 'package:commands/components/textview_custom.dart';
import 'package:commands/modules/admin/components/admin_bottombar.dart';
import 'package:commands/modules/admin/components/card_custom.dart';
import 'package:commands/modules/comandas/controllers/commands_controller.dart';
import 'package:commands/modules/comandas/service/commands_service.dart';
import 'package:commands/modules/user/service/user_service.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({
    super.key,
  });

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  void initState() {
    UserService.userIndex();
    super.initState();
  }

  static final _commmandsController = Get.find<CommandsController>();

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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        CardCustom(
                          data: 0,
                          fontSize: 20,
                          title: 'Usuários',
                        ),
                        CardCustom(
                          data: 1,
                          fontSize: 20,
                          title: 'Comandas',
                        )
                      ],
                    ),
                    const DividerCustom(),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(
                            'Comandas',
                            style: TextStyle(
                                fontSize: Components.width(context) / 12),
                          ),
                        ),
                      ],
                    ),
                    const DividerCustom(),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: _commmandsController.allCommands.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 1,
                                child: ExpansionTile(
                                  title: Text(
                                      '${_commmandsController.allCommands[index].name} '
                                      '${_commmandsController.allCommands[index].created}'),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextViewCustom(
                                                fontSize: 22,
                                                title: 'Pedido: '
                                                    ' ${_commmandsController.allCommands[index].request}',
                                              ),
                                            ],
                                          ),
                                          const DividerCustom(),
                                          Column(
                                            children: [
                                              TextViewCustom(
                                                fontSize: 22,
                                                title: 'Observação: '
                                                    ' ${_commmandsController.allCommands[index].note}',
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    const DividerCustom(),
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          ButtonActionLists(
                                            icon: Icons.delete,
                                            color: Colors.red,
                                            onPressed: () {
                                              onPressedDeleteButton(
                                                  context, index);
                                            },
                                          ),
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
                  child: TextViewCustom(
                    fontSize: 22,
                    title: 'Sem Dados ',
                  ),
                );
              }
            default:
              if (snapshot.hasError) {
                return const Center(
                  child: TextViewCustom(
                    fontSize: 22,
                    title: 'Erro ao Carregar Dados ',
                  ),
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
        onPressed: () => Get.offAllNamed('/UserListPage'),
      ),
      bottomNavigationBar: const AdminBottomBarCustom(),
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
                            id: _commmandsController.allCommands[index].id)
                        .then(
                      (value) => Get.offAllNamed('/AdminHomePage'),
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
}
