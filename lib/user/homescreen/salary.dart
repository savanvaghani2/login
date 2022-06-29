import 'package:flutter/material.dart';

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
