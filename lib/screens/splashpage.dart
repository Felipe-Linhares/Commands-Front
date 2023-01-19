// Flutter imports:
// Project imports:
import 'package:commands/components/components.dart';
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Get.offAllNamed('/LoginPage');
    });
    super.initState();
  }

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
      ),
    );
  }
}
