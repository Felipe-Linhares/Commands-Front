import 'package:commands/components/components.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardCustom extends StatelessWidget {
  const CardCustom({
    Key? key,
    required this.title,
    required this.fontSize,
    required this.data,
  }) : super(key: key);
  final String title;
  final int fontSize;
  final int data;

  @override
  Widget build(BuildContext context) {
    final userController = Get.find<UserController>();

    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        height: Components.height(context) / 9,
        width: Components.width(context) / 3,
        child: Card(
          child: Column(
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: Components.width(context) / fontSize,
                ),
              ),
              Obx(
                () => Text(
                  data == 0
                      ? '${userController.allUsers.length}'
                      : data == 1
                          ? 'opa'
                          : 'error',
                  style: TextStyle(
                    fontSize: Components.width(context) / fontSize,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
