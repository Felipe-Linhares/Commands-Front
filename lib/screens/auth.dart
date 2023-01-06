// import 'package:comandas/services/local_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:local_auth/local_auth.dart';

// class Auth extends StatefulWidget {
//   const Auth({super.key});

//   @override
//   State<Auth> createState() => _AuthState();
// }

// class _AuthState extends State<Auth> {
//   final ValueNotifier<bool> isLocalAuthFailed = ValueNotifier(false);

//   @override
//   void initState() {
//     checkLocalAuth();
//     super.initState();
//   }

//   checkLocalAuth() async {
//     final auth = LocalAuthServices(auth: LocalAuthentication());
//     final isLocalAuthAvailable = await auth.isBiometricEnabled();
//     isLocalAuthFailed.value = false;

//     if (isLocalAuthAvailable) {
//       final authenticated = await auth.authenticate();
//       if (!authenticated) {
//         isLocalAuthFailed.value = true;
//       } else {
//         if (!mounted) return;
//         Get.offAllNamed('/');
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // backgroundColor: Theme.of(context).primaryColor,
//       body: ValueListenableBuilder<bool>(
//         valueListenable: isLocalAuthFailed,
//         builder: (context, failed, _) {
//           if (failed) {
//             return Center(
//                 child: ElevatedButton(
//               onPressed: checkLocalAuth,
//               child: const Text('Tente Autenticar Novamente'),
//             ));
//           }
//           return const Center(
//             child: SizedBox(
//               width: 80,
//               height: 80,
//               child: CircularProgressIndicator(),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
