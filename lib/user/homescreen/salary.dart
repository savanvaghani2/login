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
        ),backgroundColor: Colors.blue.withOpacity(0.6),
      ),
      body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              
            ],
          )),
    );
  }
}
