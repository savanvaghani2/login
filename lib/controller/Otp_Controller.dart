import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/admin/adminhome/adminhome.dart';
import 'package:login/screen/register.dart';
import 'package:login/user/activationpage/notactivatedscreen.dart';
import 'package:login/user/homescreen/userhome.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Otp_Controller extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String ver_id = "";
  final data = GetStorage();
  String phn = '';

  otpverification(String code) async {
    if (ver_id != "") {
      final credential =
          PhoneAuthProvider.credential(verificationId: ver_id, smsCode: code);
      final user = await _auth.signInWithCredential(credential);
      SharedPreferences _pref = await SharedPreferences.getInstance();

      if (user.user != null) {
        _pref.setBool("isLogin", true);
        print("ok====================");
        _pref.setString("phone", user.user!.phoneNumber!);
        _pref.setString("uid", user.user!.uid);

        final data = await FirebaseFirestore.instance
            .collection("Users")
            .where("uid", isEqualTo: user.user!.uid)
            .get();

        final doc = data.docs;

        if (doc.isNotEmpty) {
          bool isAdmin = doc[0].data()["isAdmin"];
          _pref.setBool("isAdmin", isAdmin);
          if (isAdmin) {
            _pref.setBool("isAdmin", isAdmin);
            _pref.setString("did", doc[0].id);
            Get.to(AdminHome(), transition: Transition.cupertino);
          } else {
            _pref.setString("did", doc[0].id);
            if (doc[0].data()["isActivated"]) {
              Get.to(UserHomePage(), transition: Transition.cupertino);
            } else {
              Get.to(NotActivated(), transition: Transition.cupertino);
            }
          }
        } else {
          _pref.setBool("isRegister", false);
          Get.to(Register(), transition: Transition.cupertino);
        }
      }
    }
  }

  sendotp() async {
    phn = data.read('ph');
    await _auth.verifyPhoneNumber(
        phoneNumber: "+91" + phn,
        verificationCompleted: (verificationCompleted) async {},
        verificationFailed: (verificationFailed) async {},
        codeSent: (verificationId, code) async {
          ver_id = verificationId;
          print(ver_id);
        },
        codeAutoRetrievalTimeout: (codeAutoRetrievalTimeout) async {});
  }
}
