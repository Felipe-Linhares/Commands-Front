// Dart imports:
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

// Project imports:
import 'package:commands/modules/user/model/user_model.dart';
// Flutter imports:
import 'package:flutter/material.dart';
// Package imports:
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class UserController extends GetxController {
  RxList allUsers = <UserModel>[].obs;
  Rx getUser = UserModel().obs;

  Rx emailRegister = TextEditingController().obs;
  Rx passwordRegister = TextEditingController().obs;
  Rx nameRegister = TextEditingController().obs;
  Rx lastNameRegister = TextEditingController().obs;
  Rx imageRegister = TextEditingController().obs;

  RxInt idUserLogged = 0.obs;

  userShowList(List data) {
    allUsers.clear();

    var snapshotEncode = jsonEncode(data);
    var snapshotDecode = jsonDecode(snapshotEncode);

    for (var snap in snapshotDecode) {
      allUsers.add(UserModel.fromJson(snap));
    }
  }

  getUserShow(dynamic data) {
    var snapshotEncode = jsonEncode(data);
    var snapshotDecode = jsonDecode(snapshotEncode);
    getUser.value = UserModel.fromJson(snapshotDecode);
  }

  clearRegistrationFields() {
    emailRegister.value.text = '';
    passwordRegister.value.text = '';
    nameRegister.value.text = '';
    lastNameRegister.value.text = '';
  }

  selecionarImagem() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 10,
      );
      if (file != null) {
        imageRegister.value.text = (base64Encode(
          File(file.path).readAsBytesSync(),
        ));
        log(imageRegister.value.text);
      }
    } catch (e) {
      debugPrint('$e');
    }
  }
}
