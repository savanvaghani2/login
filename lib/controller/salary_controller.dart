import 'dart:developer';

import 'package:get/get.dart';

class SalaryController extends GetxController {
  RxString dropdownvalue = 'Default'.obs;
  final RxList<String> items =
      ["Date Modified", "A to Z", "Default", "Cash", 'Online'].obs;
  final RxList payment_type = ["Cash", 'Online'].obs;
  int sr = 1;
  dynamic val = 1;
  RxString colorgrpv = ''.obs;
  String sel = '';
  RxList transaction = [].obs;
  RxList ontp = [10, 20, 30].obs;
  RxList sorted = [].obs;
  void sortingData() {
    if (dropdownvalue.value == 'Cash') {
      log("Cash===");
      sorted.value =
          transaction.where((e) => e['paymenttype'] == 'Cash').toList();
    } else if (dropdownvalue.value == 'Online') {
      log("Online===");
      sorted.value =
          transaction.where((e) => e['paymenttype'] == 'Online').toList();
    } else if (dropdownvalue.value == 'A to Z') {
      sorted = transaction;
      sorted.sort((a, b) => a['spends'].toString().compareTo(b['spends']));
    } else if (dropdownvalue.value == 'Date Modified') {
      sorted = transaction;
      sorted.sort((a, b) => a['date'].compareTo(b['date']));
    } else {
      sorted = transaction;
    }
  }
}
