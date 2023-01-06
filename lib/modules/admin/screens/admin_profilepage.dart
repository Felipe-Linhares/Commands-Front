import 'dart:convert';

import 'package:commands/components/components.dart';
import 'package:commands/components/divider_custom.dart';
import 'package:commands/components/textview_custom.dart';
import 'package:commands/modules/admin/components/admin_bottombar.dart';
import 'package:commands/modules/admin/components/admin_floating_action_button.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdminProfilePage extends StatefulWidget {
  const AdminProfilePage({super.key});

  @override
  State<AdminProfilePage> createState() => _AdminProfilePageState();
}

class _AdminProfilePageState extends State<AdminProfilePage> {
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
                // backgroundColor: Colors.orange.shade100,
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
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AdminFloatingActionButtom(),
      bottomNavigationBar: const AdminBottomBar(),
    );
  }
}
