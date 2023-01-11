import 'package:commands/controllers/geral_controller.dart';
import 'package:commands/modules/user/controllers/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandsBottomBarCustom extends StatelessWidget {
  const CommandsBottomBarCustom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final geralController = Get.find<GeralController>();
    final userController = Get.find<UserController>();

    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10,
      clipBehavior: Clip.antiAlias,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.orange,
              width: 0.6,
            ),
          ),
        ),
        child: Obx(
          () => BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            enableFeedback: true,
            currentIndex: geralController.valueFiltro.value,
            onTap: (index) {
              geralController.valueFiltro.value = index;
              if (index == 0) {
                Get.offAllNamed('/CommandsHomePage');
              }
              if (index == 1) {
                // UserService.userShow(id: userController.idUserLogged.value)
                //     .then((value) => Get.offAllNamed('/AdminProfilePage'));
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Inicio',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Perfil',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
