import 'dart:developer';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login/user/activationpage/notactivatedscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Register_controller extends GetxController {
  final Rx<File> imgpic = File('').obs;
  final data = GetStorage();

  addimage() async {
    final _picker = ImagePicker();

    final image = await _picker.pickImage(source: ImageSource.gallery);
    // setState(() {
    imagefile = File(image!.path);

    // });
    log("message");

    imgpic.refresh();
  }

  set imagefile(File file) {
    imgpic.value = file;

    imgpic.refresh();
  }

  uploadfirebase() async {
    SharedPreferences _pref = await SharedPreferences.getInstance();
    final _store = FirebaseStorage.instance.ref().child("profilepictures");
    File _file = File(imgpic.value.path);
    await _store.putFile(_file);

    final url = await _store.getDownloadURL();

    final DocumentReference ref =
        FirebaseFirestore.instance.collection('Users').doc();
    await ref.set({
      'name': data.read('name'),
      'dob': data.read('date'),
      'phone': _pref.getString("phone"),
      'department': data.read('dep'),
      'gender': data.read('gender'),
      'isAdmin': false,
      "isActivated": false,
      'created': DateTime.now(),
      'did': ref.id,
      'profileurl': url,
      'uid': _pref.getString("uid"),
    });
    _pref.setString("did", ref.id);
    _pref.setString("did", url);
    _pref.setString("name", data.read('name'));
    _pref.setString("bod", data.read('date'));
    _pref.setBool("isRegister", true);
    Get.to(NotActivated(), transition: Transition.cupertino);
  }
}
