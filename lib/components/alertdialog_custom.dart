// import 'package:comandas/components/buttons_components/elevated_button_custom.dart';
// import 'package:comandas/controllers/comandas_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class AlertDialogCustom extends StatefulWidget {
//   const AlertDialogCustom({super.key});

//   @override
//   State<AlertDialogCustom> createState() => _AlertDialogCustomState();
// }

// class _AlertDialogCustomState extends State<AlertDialogCustom> {
//   final _comandasController = Get.find<ComandasController>();

//   @override
//   Widget build(BuildContext context) {
//     Future _showMyDialog() async {
//       return showDialog(
//           context: context,
//           builder: (context) {
//             AlertDialog(
//               title: const Text("Deseja sair?"),
//               actions: [
//                 ElevateButtonCustom(
//                   title: 'Cancelar',
//                   onPressed: () {
//                     Get.back();
//                     _comandasController.saved.value;
//                   },
//                 ),
//                 ElevateButtonCustom(
//                   title: 'Sair',
//                   onPressed: () {
//                     _comandasController.saved.value !=
//                         _comandasController.saved.value;
//                     Get.close(1);
//                   },
//                 ),
//               ],
//             );
            
//           });
//     }

   
//   }
// }
