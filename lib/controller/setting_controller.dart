import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/screen/otpscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Setting_Controller extends GetxController {
  RxString did = "".obs;
  int a = 0;
  Photo() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    FirebaseStorage _ref = FirebaseStorage.instance;

    did.value = _pref.getString("did")!;
    did.refresh();
  }

  Logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear();
    await FirebaseAuth.instance
        .signOut()
        .whenComplete(() => Get.to(LoginScreen(),duration: Duration(milliseconds: 600),transition: Transition.cupertino));
  }
}
