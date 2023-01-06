// Flutter imports:
// Project imports:
import 'package:commands/components/components.dart';
import 'package:commands/controllers/comandas_controller.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key, this.title});
  final String? title;

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  var comandasController = Get.find<ComandasController>();
  // var loginController = Get.find<LoginController>();

  // final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

  @override
  void initState() {
    super.initState();
    // checkLocalAuth();
  }

  // checkSignedIn() async {
  //   bool isLoggedIn = false;
  //   // ! quando o isLoggedIn for true o usuario está logado
  //   if (isLoggedIn) {
  //     Get.offAllNamed('/LoginPage');
  //   }
  //   Get.offAllNamed('/LoginPage');
  // }

  // checkLocalAuth() async {
  //   final auth = LocalAuthServices(auth: LocalAuthentication());
  //   final isLocalAuthAvailable = await auth.isBiometricEnabled();
  //   loginController.isLocalAuthFailed.value = false;

  //   if (isLocalAuthAvailable) {
  //     final authenticated = await auth.authenticate();
  //     if (!authenticated) {
  //       loginController.isLocalAuthFailed.value = true;
  //       // Get.offAllNamed('/get');
  //     } else {
  //       if (!mounted) return;
  //       Get.offAllNamed('/LoginPage');
  //       // Future.wait(
  //       //   [PreferencesService.isAuth()],
  //       // ).then((value) => value[0]
  //       //     ? Get.offAllNamed('/HomePage')
  //       //     : Get.offAllNamed('/LoginPage'));
  //     }
  //   }
  // }

// ! Consertar quando o usúario volta, a authenticate
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "Bem-vindo",
            style: TextStyle(fontSize: Components.width(context) / 10),
          ),
          Image.asset(
            "assets/notes.gif",
            height: 200,
            width: 200,
          ),
          Text(
            'Carregando...',
            style: TextStyle(fontSize: Components.width(context) / 15),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: CircularProgressIndicator(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image.asset(
                "assets/ifce.png",
                width: 200,
                height: 200,
              ),
              Image.asset(
                "assets/iart.png",
                width: 200,
                height: 200,
              )
            ],
          )
        ],
      ),
    ));
  }
}
