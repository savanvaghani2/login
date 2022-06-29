import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/admin/adminhome/adminhome.dart';
import 'package:login/screen/dashboard.dart';
import 'package:login/screen/otpscreen.dart';
import 'package:login/screen/register.dart';
import 'package:login/user/activationpage/notactivatedscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PageViewController extends GetxController {
  Future<Widget> getPagess() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();

    if (pref.getBool("isLogin") != null &&
        pref.getString("uid") != null &&
        pref.getBool("isLogin") == true) {
      final did = pref.getString("did");

      final userdata =
          await FirebaseFirestore.instance.collection("Users").doc(did).get();
      final isadmin = pref.getBool("isAdmin");
      bool? admin = userdata.data()?["isAdmin"];
      if (pref.getBool("isRegister") == null &&
          pref.getBool("isRegister") == false) {
        return Register();
      } else if (pref.getBool("isAdmin") != null && isadmin! || admin!) {
        return AdminHome();
      } else {
        bool isactivated = userdata.data()!["isActivated"] as bool;
        if (isactivated == true) {
          return Dashboard();
        } else {
          return NotActivated();
        }
      }
    } else {
      return LoginScreen();
    }
  }
}
