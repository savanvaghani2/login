import 'package:get/get.dart';
class SalaryController extends GetxController{

  RxString dropdownvalue = 'Default'.obs;
  final RxList<String> items = ["Date Modified", "A to Z", "Default"].obs;
  final RxList payment_type = ["Cash", 'Online'].obs;
  int sr = 1;
  int val = 1;
  var colorgrpv;
  String sel = '';
  RxList transaction = [].obs;
  RxList ontp = [10,20,30].obs;
 }