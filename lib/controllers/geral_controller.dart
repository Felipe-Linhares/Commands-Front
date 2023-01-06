// Package imports:
import 'package:get/get.dart';

class GeralController extends GetxController {
  RxInt valueFiltro = 0.obs;
  RxBool isLoader = false.obs;

  defaultIndexMenu() {
    valueFiltro.value = 0;
  }
}
