import 'dart:math';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:login/controller/Time_Controller.dart';
import 'package:get/get.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({Key? key}) : super(key: key);

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  Time_controller _time_controller = Get.put(Time_controller());
  DateTime? selectedDate;
  Random random = Random();

  @override
  void initState() {
    setState(() {
      selectedDate = DateTime.now();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        centerTitle: true,
        leading: const Icon(
          Icons.wysiwyg_outlined,
          color: Colors.white,
          size: 30,
        ),
        title: const Text(
          "Work Report",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            CalendarTimeline(
              initialDate: DateTime.now(),
              firstDate: DateTime(2022, 1, 1),
              lastDate: DateTime(2024, 1, 1),
              onDateSelected: (date) => print(date),
              leftMargin: 20,
              monthColor: Colors.blueGrey,
              dayColor: Colors.teal[200],
              activeDayColor: Colors.white,
              activeBackgroundDayColor: Colors.blueAccent.shade100,
              dotsColor: Colors.black,
              locale: 'en_ISO',

            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      dividerThickness: 0,
                      columns: const [
                        DataColumn(
                          label: Text("Sr_no"),
                        ),
                        DataColumn(
                          label: Text("Date"),
                        ),
                        DataColumn(
                          label: Text("Start"),
                        ),
                        DataColumn(
                          label: Text("End"),
                        ),
                        DataColumn(
                          label: Text("Total Duration"),
                        ),
                      ],
                      rows: [
                        DataRow(cells: [
                          DataCell(Text("1")),
                          DataCell(
                              Text(DateTime.now().toString().substring(0, 10))),
                          DataCell(Text(
                              DateTime.now().toString().substring(11, 19))),
                          DataCell(Text(
                              DateTime.now().toString().substring(11, 19))),
                          DataCell(Text("0:00")),
                        ]),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
