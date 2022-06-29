import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:login/controller/Register_Controller.dart';
import 'package:login/dateformathelper.dart';

class Register extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  Register({Key? key}) : super(key: key);
  // final String num;

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Register_controller _register_controller = Get.put(Register_controller());
  final TextEditingController _name = TextEditingController();
  final TextEditingController _dep = TextEditingController();
  final TextEditingController _date = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  final data = GetStorage();

  bool value = false;
  String gender = "Male";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Form(
                key: _key,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Welcome To Sign Up",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                        onTap: () {
                          _register_controller.addimage();
                        },
                        child: Obx(
                          () => _register_controller.imgpic.value.path == ''
                              ? Container(
                                  height: 150,
                                  width: 150,
                                  child: const Icon(
                                    Icons.camera_enhance,
                                    size: 30,
                                  ),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                )
                              : Container(
                                  height: 150,
                                  width: 150,
                                  child: Obx(() => CircleAvatar(
                                      backgroundImage: FileImage(
                                          _register_controller.imgpic.value))),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.grey.withOpacity(0.5),
                                  ),
                                ),
                        )),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Name Required";
                        } else {
                          return null;
                        }
                      }),
                      controller: _name,
                      onChanged: (v) {
                        print(v);
                      },
                      decoration: InputDecoration(
                          labelText: "Name",
                          constraints: const BoxConstraints(maxWidth: 300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Enter a name"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Department Required";
                        } else {
                          return null;
                        }
                      }),
                      controller: _dep,
                      decoration: InputDecoration(
                          labelText: "Department",
                          constraints: const BoxConstraints(maxWidth: 300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "Department"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    TextFormField(
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return "Date Required";
                        } else {
                          return null;
                        }
                      }),
                      inputFormatters: [CustomDateTextFormatter()],
                      controller: _date,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                          labelText: "Date",
                          constraints: const BoxConstraints(maxWidth: 300),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          hintText: "DD/MM/YYYY"),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            minLeadingWidth: 50,
                            title: const Text("Male"),
                            leading: Radio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            minLeadingWidth: 50,
                            title: const Text("Female"),
                            leading: Radio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (String? value) {
                                setState(() {
                                  gender = value!;
                                });
                              },
                              activeColor: Colors.blue,
                            ),
                          ),
                        )
                      ],
                    ),
                    MaterialButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        minWidth: 250,
                        height: 45,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            data.write('name', _name.text);
                            data.write('dep', _dep.text);
                            data.write('date', _date.text);
                            data.write('gender', gender);
                            _register_controller.uploadfirebase();
                          }
                        },
                        color: const Color(0xff14224A)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
