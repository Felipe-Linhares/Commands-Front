import 'dart:convert';

import 'package:commands/modules/comandas/model/commands_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommandsController extends GetxController {
  RxList allCommands = <CommandsModel>[].obs;
  Rx getCommands = CommandsModel().obs;

  Rx nameCommands = TextEditingController().obs;
  Rx requestCommands = TextEditingController().obs;
  Rx noteCommands = TextEditingController().obs;

  clearCommandsFields() {
    nameCommands.value.text = '';
    requestCommands.value.text = '';
    noteCommands.value.text = '';
  }

  commandsShowList(List data) {
    allCommands.clear();

    var snapshotEncode = jsonEncode(data);
    var snapshotDecode = jsonDecode(snapshotEncode);

    for (var snap in snapshotDecode) {
      allCommands.add(CommandsModel.fromJson(snap));
    }
  }

  getCommandsShow(dynamic data) {
    var snapshotEncode = jsonEncode(data);
    var snapshotDecode = jsonDecode(snapshotEncode);
    getCommands.value = CommandsModel.fromJson(snapshotDecode);
  }
}
