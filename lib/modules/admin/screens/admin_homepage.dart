import 'package:commands/components/components.dart';
import 'package:commands/components/divider_custom.dart';
import 'package:commands/modules/admin/components/admin_bottombar.dart';
import 'package:commands/modules/admin/components/admin_compoenents.dart';
import 'package:commands/modules/admin/components/admin_floating_action_button.dart';
import 'package:commands/modules/admin/components/card_custom.dart';
import 'package:commands/modules/user/service/user_service.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AdminComponents.appbar('HomePage'),
      body: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            CardCustom(
              data: 0,
              fontSize: 20,
              title: 'Usuários',
            ),
            CardCustom(
              data: 0,
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
                style: TextStyle(fontSize: Components.width(context) / 12),
              ),
            ),
          ],
        ),
        const DividerCustom(),
      ]),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const AdminFloatingActionButtom(),
      bottomNavigationBar: const AdminBottomBar(),
    );
  }
}
