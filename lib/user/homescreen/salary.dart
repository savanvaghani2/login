import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/salary_controller.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  TextEditingController amount = TextEditingController();
  TextEditingController spendname = TextEditingController();
  final _salarycontroller = Get.put(SalaryController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              title: "personal Allowance",
              content: StatefulBuilder(builder: (context, setState) {
                return Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: TextField(
                      controller: spendname,
                      decoration: InputDecoration(
                          hintText: "Used of money",
                          labelText: "Used Money",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: amount,
                      decoration: InputDecoration(
                          hintText: "Total Amount ₹",
                          labelText: "Total Amount",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 50,
                    width: 400,
                    alignment: Alignment.center,
                    child: SizedBox(
                        height: 40,
                        width: 264,
                        child: Row(
                          children: [
                            Obx(() {
                              return ButtonBar(
                                children: [
                                  Radio(
                                      activeColor: Colors.green,
                                      value: "Cash",
                                      groupValue:
                                          _salarycontroller.colorgrpv.value,
                                      onChanged: (String? val) {
                                        _salarycontroller.colorgrpv.value =
                                            val!;
                                        print(_salarycontroller.colorgrpv);
                                      }),
                                  const Text("Cash"),
                                  Radio(
                                      activeColor: Colors.green,
                                      value: "Online",
                                      groupValue:
                                          _salarycontroller.colorgrpv.value,
                                      onChanged: (String? val) {
                                        _salarycontroller.colorgrpv.value =
                                            val!;
                                        print(_salarycontroller.colorgrpv);
                                      }),
                                  const Text("Online")
                                ],
                              );
                            })
                          ],
                        )),
                  ),
                  MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    minWidth: 150,
                    onPressed: () {
                      _salarycontroller.transaction.add({
                        'amount': amount.text,
                        'spends': spendname.text,
                        'paymenttype': _salarycontroller.colorgrpv.value,
                        'date': DateTime.now()
                      });

                      Get.back();
                    },
                    child: const Text(
                      "Done",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ),
                    color: Colors.blueAccent,
                  )
                ]);
              }),
            );
          },
          child: const Icon(Icons.add)),
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        leading: const Icon(
          Icons.insert_chart_outlined_sharp,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          "P/L Counter",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        backgroundColor: Colors.blue.withOpacity(0.6),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Transections",
                  style: TextStyle(
                      color: Color(0xff202438),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Obx(
                  () => DropdownButton<String>(
                    borderRadius: BorderRadius.circular(10),
                    value: _salarycontroller.dropdownvalue.value,
                    icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    style: const TextStyle(color: Colors.black, fontSize: 15),
                    onChanged: (String? newValue) {
                      _salarycontroller.dropdownvalue.value =
                          newValue.toString();
                      _salarycontroller.sortingData();
                    },
                    items: _salarycontroller.items
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
              child: StatefulBuilder(builder: (context, setstate) {
                return Column(
                  children: [
                    SizedBox(
                      height: 522,
                      width: double.maxFinite,
                      child: Obx(
                        () => ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: _salarycontroller.sorted.length,
                            itemBuilder: (BuildContext, int) {
                              print(_salarycontroller.sorted.length);
                              if (_salarycontroller.sorted.length != null) {
                                return Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 4),
                                  child: ListTile(
                                      contentPadding: const EdgeInsets.all(10),
                                      tileColor:
                                          Colors.redAccent.withOpacity(0.2),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                      leading: Container(
                                        padding: const EdgeInsets.all(14),
                                        child: const Icon(
                                          Icons.currency_rupee_sharp,
                                          color: Colors.black,
                                        ),
                                        decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red.withOpacity(0.5)),
                                      ),
                                      title: Text(
                                          "${_salarycontroller.sorted[int]['spends'].toString().capitalize} - ${_salarycontroller.sorted[int]['paymenttype']}"),
                                      subtitle: Text(
                                        "${DateTime.now().toString().substring(0, 10)} , ${DateTime.now().toString().substring(10, 19)}",
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      trailing: Text(
                                        "₹ ${_salarycontroller.sorted[int]['amount']}",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17),
                                      )),
                                );
                              } else {
                                return Container();
                              }
                            }),
                      ),
                    ),
                    // ListTile(
                    //     onTap: () => Get.defaultDialog(
                    //           contentPadding: EdgeInsets.all(15),
                    //           content: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceBetween,
                    //             children: [
                    //               Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.start,
                    //                 children: [
                    //                   Text(
                    //                     "Date :",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                   Text("Salary Date :"),
                    //                   Text("Total Days :"),
                    //                   Text("Work Days :"),
                    //                   Text(
                    //                     "leave Days :",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                   Text("Petrol Allowance :"),
                    //                   Text("Other Allowance :"),
                    //                 ],
                    //               ),
                    //               Column(
                    //                 crossAxisAlignment:
                    //                     CrossAxisAlignment.end,
                    //                 children: [
                    //                   Text(
                    //                     "29/05/2022",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                   Text("30/06/2022"),
                    //                   Text("30"),
                    //                   Text("20"),
                    //                   Text(
                    //                     "6",
                    //                     style: TextStyle(
                    //                         fontWeight: FontWeight.bold),
                    //                   ),
                    //                   Text("500"),
                    //                   Text("200"),
                    //                 ],
                    //               )
                    //             ],
                    //           ),
                    //           middleText: "",
                    //           title: "Payment Details",
                    //           middleTextStyle:
                    //               TextStyle(fontWeight: FontWeight.bold),
                    //         ),
                    //     contentPadding: EdgeInsets.all(10),
                    //     tileColor: Colors.greenAccent.withOpacity(0.2),
                    //     shape: RoundedRectangleBorder(
                    //         borderRadius: BorderRadius.circular(15)),
                    //     leading: Container(
                    //       padding: EdgeInsets.all(14),
                    //       child: Icon(
                    //         Icons.wallet,
                    //         color: Colors.black,
                    //       ),
                    //       decoration: BoxDecoration(
                    //           shape: BoxShape.circle,
                    //           color: Colors.green.withOpacity(0.5)),
                    //     ),
                    //     horizontalTitleGap: 12,
                    //     title: Text(
                    //       "Payment Success",
                    //       style: TextStyle(
                    //           fontSize: 15, fontWeight: FontWeight.bold),
                    //     ),
                    //     subtitle: Text(
                    //       "29/05/2022 , 2:00 PM",
                    //       style: TextStyle(fontSize: 15),
                    //     ),
                    //     trailing: Text(
                    //       "₹ 2500",
                    //       style: TextStyle(
                    //           fontWeight: FontWeight.bold, fontSize: 17),
                    //     )),
                  ],
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
