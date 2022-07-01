import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  final List payment_type = ["Cash", 'Online'] as List;
  int sr = 1;
  int _val = 1;
  var _colorgrpv;
  TextEditingController amount = TextEditingController();
  TextEditingController spendname = TextEditingController();
  List<Map> transaction = [{}];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.defaultDialog(
              title: "personal Allowance",
              content: Column(children: [
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
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(keyboardType: TextInputType.number,
                    controller: amount,
                    decoration: InputDecoration(
                        hintText: "Total Amount ₹",
                        labelText: "Total Amount",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                SizedBox(
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
                          ButtonBar(
                            children: [
                              Radio(
                                  activeColor: Colors.green,
                                  value: "Cash",
                                  groupValue: _colorgrpv,
                                  onChanged: (val) {
                                    setState(() {
                                      _colorgrpv = val;
                                      print(_colorgrpv);
                                    });
                                  }),
                              Text("Cash"),
                              Radio(
                                  activeColor: Colors.blue,
                                  value: "Online",
                                  groupValue: _colorgrpv,
                                  onChanged: (val) {
                                    _colorgrpv = val;
                                    print(_colorgrpv);
                                    setState(() {});
                                  }),
                              Text("Online")
                            ],
                          )
                        ],
                      )),
                ),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  minWidth: 150,
                  onPressed: () {
                    Get.back();
                    setState(() {
                      transaction.addAll(
                          [{'amount': amount.text, 'spends': spendname.text}]);
                    });
                  },
                  child: Text(
                    "Done",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ),
                  color: Colors.blueAccent,
                )
              ]),
            );
          },
          child: Icon(Icons.add)),
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
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transections",
                      style: TextStyle(
                          color: Color(0xff202438),
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                    Icon(CupertinoIcons.sort_down)
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 522,
                        width: double.maxFinite,
                        child: ListView.builder(physics: BouncingScrollPhysics(),
                            itemCount: transaction.length,
                            itemBuilder: (BuildContext, int) {
                              print(transaction.length);
                            if(transaction.length!=1){
return Padding(
                                padding: const EdgeInsets.symmetric(vertical: 4),
                                child: ListTile(
                                  contentPadding: EdgeInsets.all(10),
                                  tileColor: Colors.redAccent.withOpacity(0.2),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  leading: Container(
                                    padding: EdgeInsets.all(14),
                                    child: Icon(
                                      Icons.currency_rupee_sharp,
                                      color: Colors.black,
                                    ),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.red.withOpacity(0.5)),
                                  ),
                                  title: Text("${transaction[int]['spends'].toString().capitalize} - Cash"),
                                  subtitle: Text(
                            "29/05/2022 , 2:00 PM",
                            style: TextStyle(fontSize: 15),
                          ), trailing: Text(
                            "₹ ${transaction[int]['amount']}",
                            style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17),
                          )
                                ),
                              );
                            }else{
                              return Container();
                            }
                            }),
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
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
