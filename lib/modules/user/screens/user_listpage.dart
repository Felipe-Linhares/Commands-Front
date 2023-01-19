// Dart imports:
import 'dart:convert';
import 'dart:developer';

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

// Project imports:
import 'package:commands/components/buttons_components/elevated_button_custom.dart';
import 'package:commands/components/buttons_components/floating_action_button_custom.dart';
import 'package:commands/components/buttons_components/iconbutton_custom.dart';
import 'package:commands/components/buttons_components/lists_action_button.dart';
import 'package:commands/components/components.dart';
import 'package:commands/components/divider_custom.dart';
import 'package:commands/components/form_components/formfield_custom.dart';
import 'package:commands/components/form_components/validate_forms.dart';
import 'package:commands/components/textview_custom.dart';
import 'package:commands/modules/admin/components/admin_bottombar.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:commands/modules/user/service/user_service.dart';

class UserListPage extends StatefulWidget {
  const UserListPage({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  // final _key = GlobalKey<FormState>();
  static final _userController = Get.find<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Components.appbar('Lista de Usuário'),
      body: FutureBuilder(
        future: UserService.userIndex(),
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
                    ElevateButtonCustom(
                      width: 2,
                      title: 'Novo Usuário',
                      onPressed: () => Get.toNamed('/UserRegistrationPage'),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: ListView.builder(
                            itemCount: _userController.allUsers.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 1,
                                child: ExpansionTile(
                                  title: Text(
                                      '${_userController.allUsers[index].name} '
                                      '${_userController.allUsers[index].lastname}'),
                                  leading: circleAvatarListUser(index),
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              TextViewCustom(
                                                fontSize: 22,
                                                title: 'E-mail: '
                                                    ' ${_userController.allUsers[index].email}',
                                              ),
                                            ],
                                          ),
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
                                            icon: Icons.edit,
                                            color: Colors.green,
                                            onPressed: () {
                                              onPressedEditingButton(
                                                  context, index);
                                            },
                                          ),
                                          ButtonActionLists(
                                            icon: Icons.delete,
                                            color: Colors.red,
                                            onPressed: () {
                                              log(_userController
                                                  .allUsers[index].id
                                                  .toString());
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

  CircleAvatar circleAvatarListUser(int index) {
    return CircleAvatar(
      radius: 25,
      child: _userController.allUsers[index].image == ''
          ? const Icon(Icons.person_outline)
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.orange, width: 0),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: MemoryImage(
                    base64Decode((_userController.allUsers[index].image)),
                  ),
                ),
              ),
            ),
    );
  }

  Future<dynamic> onPressedDeleteButton(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Deletar este usuário?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButtomCustom(
                  onPressed: () {
                    UserService.userDelete(
                            id: _userController.allUsers[index].id)
                        .then(
                      (value) => UserService.userIndex().then(
                        (value) => Get.offAllNamed('/UserListPage'),
                      ),
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
    TextEditingController email =
        TextEditingController(text: (_userController.allUsers[index].email));
    TextEditingController password =
        TextEditingController(text: (_userController.allUsers[index].password));
    TextEditingController name =
        TextEditingController(text: (_userController.allUsers[index].name));
    TextEditingController lastname =
        TextEditingController(text: (_userController.allUsers[index].lastname));

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: Column(children: [
                FormFieldCustom(
                    osbcured: false,
                    validator: (value) {
                      return ValidateForms.validarEmail(value!);
                    },
                    controller: email,
                    textInputType: TextInputType.emailAddress,
                    labelText: 'E-mail',
                    prefixIcon: Icons.email),
                FormFieldCustom(
                    osbcured: false,
                    controller: password,
                    validator: (value) {
                      return '';
                    },
                    textInputType: TextInputType.none,
                    labelText: 'Senha',
                    prefixIcon: Icons.password),
                FormFieldCustom(
                    osbcured: false,
                    validator: (value) {
                      return ValidateForms.validarNome(value!, title: 'Nome');
                    },
                    controller: name,
                    textInputType: TextInputType.text,
                    labelText: 'Nome',
                    prefixIcon: Icons.person),
                FormFieldCustom(
                    osbcured: false,
                    validator: (value) {
                      return ValidateForms.validarNome(value!,
                          title: 'Sobrenome');
                    },
                    controller: lastname,
                    textInputType: TextInputType.text,
                    labelText: 'Sobrenome',
                    prefixIcon: Icons.person),
                ElevateButtonCustom(
                  width: 2,
                  onPressed: () => _userController.selecionarImagem(),
                  title: 'Adicionar Foto',
                ),
              ]),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButtomCustom(
                      onPressed: () {
                        // _key.currentState?.validate();
                        UserService.userUpdate(
                          id: _userController.allUsers[index].id,
                          email: email.text,
                          password: password.text,
                          name: name.text,
                          lastname: lastname.text,
                          image: _userController.imageRegister.value.text,
                        ).then(
                          (value) => UserService.userIndex().then(
                            (value) => Get.offAllNamed('/UserListPage'),
                          ),
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
            ),
          );
        });
  }
}
