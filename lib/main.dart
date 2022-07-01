import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/controller/Page_Controller.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:get/get.dart';

void main() async {
  GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(
      null,
      [
        NotificationChannel(
            channelGroupKey: 'group1',
            channelKey: 'basic_channel1',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white),
        NotificationChannel(
            channelGroupKey: 'group2',
            channelKey: 'basic_channel2',
            channelName: 'Basic notifications',
            channelDescription: 'Notification channel for basic tests',
            defaultColor: Color(0xFF9D50DD),
            ledColor: Colors.white)
      ],
      channelGroups: [
        NotificationChannelGroup(
            channelGroupkey: 'basic_channel_group',
            channelGroupName: 'Basic group'),
        NotificationChannelGroup(
            channelGroupkey: 'group2', channelGroupName: 'Basic group')
      ],
      debug: true);

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: HandlerScreen(),
      showSemanticsDebugger: false,
    );
  }
}

class HandlerScreen extends StatelessWidget {
  final PageViewController _controller = Get.put(PageViewController());
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _controller.getPagess(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return Container(color: Colors.white);
          }
        });
  }
}
