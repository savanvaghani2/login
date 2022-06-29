import 'dart:async';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as inte;
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: camel_case_types
class Time_controller extends GetxController {
  DateTime? starttime;
  DateTime? stoptime;
  Rx<Duration> duration = Duration(seconds: 0).obs;

  DateTime? date;
  DateTime? start;
  DateTime? end;
  Duration? def;
  bool isstart = false;
  Future startstime() async {
    final pref = await SharedPreferences.getInstance();
    starttime = DateTime.now();
    pref.setBool("isStart", true);
    final clockstarttime =
        await pref.setString("clockStime", starttime.toString());
    print("start = ${starttime.toString().substring(10, 19)}");
    await AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 10,
            locked: false,
            showWhen: true,
            channelKey: 'basic_channel1',autoDismissible: true,
            title: '${'Notification of started'}'.toString().capitalizeFirst,
            body:
                'Your Work Time has started at${starttime.toString().substring(10, 19)}'));
  }

  stopstime() async {
    timer!.cancel();
    final pref = await SharedPreferences.getInstance();
    pref.setBool("isStart", false);
    //
    stoptime = DateTime.now();
    //
    print("End = ${stoptime.toString().substring(10, 19)}");
    final clockstoptime =
        await pref.setString("clockEtime", stoptime.toString());
    AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            locked: false,
            showWhen: true,
            channelKey: 'basic_channel2',
            title: 'Notification of stopped',
            body:
                'Your Work Time has stopped at ${stoptime.toString().substring(10, 19)}'));
  }

  Timer? timer;
  int secon = 0;
  time() {
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (starttime != null) {
        duration.value = starttime!.difference(DateTime.now());
        print("Duration = $duration");
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  String DateFormat(DateTime time) {
    final formate = inte.DateFormat('dd-MM-yyyy');
    final formated = formate.format(time);

    return formated;
  }

  fire() async {
    String name = "";
    final pref = await SharedPreferences.getInstance();
    final _uid = pref.getString("uid");
    final _auth = await FirebaseFirestore.instance
        .collection('Users')
        .where("uid", isEqualTo: _uid)
        .get();
    name = _auth.docs.first.data()['name'];

    final _pref = await SharedPreferences.getInstance();
    if (_pref.getBool("isStart") != null) {
      isstart = _pref.getBool("isStart")!;
    }
  }

  String TimeFormat(DateTime time) {
    final formate = inte.DateFormat('hh:mm');
    final formated = formate.format(time);
    return formated;
  }
}
