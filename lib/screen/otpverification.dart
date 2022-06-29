import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:login/controller/Otp_Controller.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({Key? key}) : super(key: key);

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Otp_Controller _otp_controller = Get.put(Otp_Controller());
  final TextEditingController _otp = TextEditingController();

  @override
  void initState() {
    super.initState();
    _otp_controller.sendotp();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.white,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
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
                              style:
                                  TextStyle(fontSize: 12, color: Colors.black))
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                          height: 280,
                          width: 280,
                          child: SvgPicture.asset("assets/svg/otp.svg")),
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(children: [
                          const Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "We will send you one time password this email address.",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "( ${_otp_controller.phn} )",
                                style: const TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500,
                                ),
                              )),
                          const SizedBox(
                            height: 10,
                          ),
                          OtpTextField(
                            numberOfFields: 6,
                            borderColor: Colors.black,
                            showFieldAsBox: true,
                            onCodeChanged: (String code) {
                              _otp.text = _otp.text + code;
                              print(
                                  "code====================================================${_otp.text}");
                              //handle validation or checks here
                            },
                            //runs when every textfield is filled
                            // end onSubmit
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
                            "Submit",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            _otp_controller.otpverification(_otp.text);
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
    );
  }
}
