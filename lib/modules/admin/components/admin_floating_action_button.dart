// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class AdminFloatingActionButtom extends StatelessWidget {
  const AdminFloatingActionButtom({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.0),
          topRight: Radius.circular(15.0),
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      onPressed: () {
        Get.offAllNamed('/UserListPage');
      },
      child: const Icon(Icons.add),
    );
  }
}
