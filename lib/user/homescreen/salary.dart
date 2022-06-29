import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SalaryScreen extends StatefulWidget {
  const SalaryScreen({Key? key}) : super(key: key);

  @override
  State<SalaryScreen> createState() => _SalaryScreenState();
}

class _SalaryScreenState extends State<SalaryScreen> {
  int sr = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        leading: const Icon(
          Icons.insert_chart_outlined_sharp,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          "Income Counter",
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
                Text(
                  "Recent Transection",
                  style: TextStyle(
                      color: Color(0xff202438),
                      fontSize: 17,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: ListTile(
                      onTap: () => Get.defaultDialog(contentPadding: EdgeInsets.all(15),middleText: "Payment Details",
                              actions: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Date :",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("Salary Date :"),
                                        Text("Total Days :"),
                                        Text("Work Days :"),
                                        Text("leave Days :",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("Petrol Allowance :"),
                                        Text("Other Allowance :"),
                                      ],
                                    ),
                                    Column(crossAxisAlignment:CrossAxisAlignment.end,
                                      children: [
                                        Text("29/05/2022",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("30/06/2022"),
                                        Text("30"),
                                        Text("20"),
                                        Text("6",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("500"),
                                        Text("200"),
                                      ],
                                    )
                                  ],
                                )
                              ],
                              
                              title: "",
                              middleTextStyle: 
                                  TextStyle(fontWeight: FontWeight.bold),
                                  ),
                      contentPadding: EdgeInsets.all(10),
                      tileColor: Colors.blueAccent.withOpacity(0.2),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      leading: Container(
                        padding: EdgeInsets.all(14),
                        child: Icon(
                          Icons.wallet,
                          color: Colors.black,
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue.withOpacity(0.5)),
                      ),
                      horizontalTitleGap: 12,
                      title: Text(
                        "Payment Success",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "29/05/2022 , 2:00 PM",
                        style: TextStyle(fontSize: 15),
                      ),
                      trailing: Text(
                        "₹ 2500",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      )),
                )
              ],
            ),
          )),
    );
  }
}
