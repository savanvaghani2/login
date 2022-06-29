import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/screen/otpverification.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _num = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String? validateMyInput(String value) {
    String pattern =
        r'^([6789]{1})([0-9]{9})$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Enter Valid Number';
    } else {
      return null;
    }
  }
  
  final data = GetStorage();


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
          child: Form(
            key: _key,
            child: Stack(
              children: [
                Positioned(
                  left: -50,
                  top: -50,
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Colors.white,
                          Color.fromARGB(255, 170, 203, 88)
                        ])),
                  ),
                ),
                Positioned(
                  right: -50,
                  top: -50,
                  child: Container(
                    height: 300,
                    width: 300,
                    decoration: const BoxDecoration(
                        color: Colors.red,
                        backgroundBlendMode: BlendMode.darken,
                        shape: BoxShape.circle,
                        gradient: LinearGradient(colors: [
                          Color.fromARGB(255, 170, 203, 88),
                          Colors.white,
                        ])),
                  ),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 50),
                    child: Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text("OTP Login",
                                style: TextStyle(
                                    fontSize: 25,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold)),
                            Text(
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nNon nisi, mi, ornare aliquet. ",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 12, color: Colors.black))
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        SizedBox(
                            height: 280,
                            width: 280,
                            child: SvgPicture.asset("assets/svg/login.svg")),
                        Container(
                          padding: const EdgeInsets.all(10),
                          child: Column(children: [
                            const Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  "Enter Your Phone Number",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            const SizedBox(
                              height: 10,
                            ),
                            TextFormField(
                              validator: (value) => validateMyInput(value!),
                              controller: _num,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: "Enter Mobile Number",
                                contentPadding: const EdgeInsets.all(10),
                                // constraints: BoxConstraints(maxHeight: 50),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ]),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        MaterialButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            minWidth: 300,
                            height: 45,
                            child: const Text(
                              "Send Otp",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                            onPressed: () {
                              data.write('ph',_num.text);
                              print(_key.currentState!.validate());
                              if (_key.currentState!.validate()) {
                                Get.to(OtpScreen(),transition: Transition.cupertino);
                              }
                            },
                            color: const Color(0xff14224A)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
