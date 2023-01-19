// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx emailLogin = TextEditingController().obs;
  Rx senhaLogin = TextEditingController().obs;
  RxString key = ''.obs;

  clearFieldsLogin() {
    emailLogin.value.clear();
    senhaLogin.value.clear();
  }
}
