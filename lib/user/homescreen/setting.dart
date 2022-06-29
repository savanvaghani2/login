import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/controller/setting_controller.dart';
import 'package:login/screen/otpscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSettingPage extends StatefulWidget {
  const UserSettingPage({Key? key}) : super(key: key);

  @override
  State<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
  final Setting_Controller _setting_controller = Get.put(Setting_Controller());
  @override
  void initState() {
    super.initState();
    _setting_controller.Photo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        leading: const Icon(
          Icons.person_pin_outlined,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          "Account Info",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        backgroundColor: Colors.blue.withOpacity(0.6),
      ),
      resizeToAvoidBottomInset: true,
      extendBody: true,
      body: _setting_controller.did.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                      stream: FirebaseFirestore.instance
                          .collection('Users')
                          .doc(_setting_controller.did.value)
                          .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    decoration: const BoxDecoration(
                                        gradient: LinearGradient(
                                            end: Alignment.topCenter,
                                            begin: Alignment.bottomCenter,
                                            colors: [
                                          Colors.grey,
                                          Colors.white,
                                          Colors.white,
                                          Colors.white,
                                          Colors.grey
                                        ])),
                                    height: 350,
                                    width: double.infinity,
                                    child: SizedBox(
                                        height: 200,
                                        width: 200,
                                        child: Image.network(
                                          snapshot.data!.data()!["profileurl"],
                                          fit: BoxFit.fitHeight,
                                        )),
                                  ),
                                  Positioned(
                                      bottom: 35,
                                      left: 10,
                                      child: Text(
                                        snapshot.data!.data()!['name'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 25),
                                      )),
                                  const Positioned(
                                      bottom: 12,
                                      left: 10,
                                      child: Text(
                                        "Online",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )),
                                ],
                              ),
                              SizedBox(
                                height: 240,
                                child: SingleChildScrollView(physics: BouncingScrollPhysics(),
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text("Account",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold)),
                                      Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.person,
                                                color: Colors.grey, size: 30),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(snapshot.data!.data()!['name'],
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.call,
                                                color: Colors.grey, size: 30),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(
                                                snapshot.data!
                                                    .data()!['phone']
                                                    .toString()
                                                    .replaceRange(3, 3, ' ')
                                                    .replaceRange(9, 9, ' '),
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      const Divider(),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Card(
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 5),
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Row(
                                          children: [
                                            const Icon(Icons.calendar_month,
                                                color: Colors.grey, size: 30),
                                            const SizedBox(
                                              width: 20,
                                            ),
                                            Text(snapshot.data!.data()!['dob'],
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Divider(
                                          color: Colors.grey.withOpacity(0.5),
                                          height: 30,
                                          thickness: 20),
                                      Column(
                                        children: [
                                          const Text("Settings",
                                              style: TextStyle(
                                                  color: Colors.blue,
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                          const SizedBox(
                                            height: 10,
                                          ),
                                          InkWell(
                                            hoverColor: Colors.transparent,
                                            onTap: () {
                                              showDialog(
                                                context: context,
                                                builder: (c) {
                                                  return Dialog(
                                                    child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                          const Text(
                                                            "Are you sure Log Out ?",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                          const SizedBox(
                                                            height: 10,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              const SizedBox(
                                                                height: 15,
                                                              ),
                                                              MaterialButton(
                                                                  color: Colors
                                                                      .blue,
                                                                  child:
                                                                      const Text(
                                                                    "NO",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.of(
                                                                            context)
                                                                        .pop();
                                                                  }),
                                                              const SizedBox(
                                                                width: 15,
                                                              ),
                                                              MaterialButton(
                                                                  color: Colors
                                                                      .blue,
                                                                  child:
                                                                      const Text(
                                                                    "Yes",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                  onPressed:
                                                                      () {
                                                                    _setting_controller.Logout();
                                                                  }),
                                                            ],
                                                          ),
                                                          const SizedBox(
                                                            height: 15,
                                                          ),
                                                        ]),
                                                  );
                                                },
                                              );
                                            },
                                            child: Card(
                                              elevation: 0,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 5),
                                              color: Colors.transparent,
                                              child: Row(
                                                children: const [
                                                  Icon(
                                                    Icons.logout_outlined,
                                                    color: Colors.grey,
                                                    size: 30,
                                                  ),
                                                  SizedBox(
                                                    width: 20,
                                                  ),
                                                  Text("Log Out",
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      }),
                ],
              ),
            ),
    );
  }

  
}
