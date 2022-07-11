import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/controller/Time_Controller.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({Key? key}) : super(key: key);

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  Time_controller _time_controller = Get.put(Time_controller());

  @override
  void initState() {
    super.initState();
    _time_controller.fire();
  }

  List<datacel> dataroww = [];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 5,
        leading: const Icon(
          Icons.list,
          color: Colors.white,
          size: 30,
        ),
        actions: [
          Icon(
            Icons.account_circle_outlined,
            size: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        title: const Text(
          "Time Counter",
          style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              letterSpacing: 1),
        ),
      ),
      extendBody: true,
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (_time_controller.duration != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Obx(
                  () => Text(
                    "Timer : ${_time_controller.duration.value.toString().substring(0, 7)}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                ),
              )
            else
              Container(),
            MaterialButton(
              disabledColor: Colors.blue.shade200,
              onPressed: _time_controller.isstart
                  ? null
                  : () {
                      setState(() {
                        _time_controller.isstart = true;
                        _time_controller.date = DateTime.now();
                        _time_controller.start = DateTime.now();
                        _time_controller.DateFormat(_time_controller.start!);
                        _time_controller.startstime();
                        _time_controller.time();
                      });
                    },
              child: const Text(
                "Start",
                style: TextStyle(color: Colors.white),
              ),
              color: Colors.blue,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: MaterialButton(
                disabledColor: Colors.red.shade200,
                onPressed: !_time_controller.isstart
                    ? null
                    : () {
                        setState(() {
                          dynamic second = 0;
                          _time_controller.isstart = false;
                          _time_controller.end = DateTime.now();
                          int sec = (_time_controller.end!
                              .difference(_time_controller.start!)
                              .inSeconds);
                          int min = 0;
                          if (sec < 60) {
                            second = Duration(minutes: 0, seconds: sec);
                          } else {
                            min++;
                            second = Duration(minutes: min, seconds: sec);
                          }
                          dataroww.add(datacel(
                            date: _time_controller.date!,
                            start: _time_controller.start!,
                            end: _time_controller.end!,
                            totalDuration: second.toString().substring(0, 4),
                          ));
                          _time_controller.stopstime();
                        });
                      },
                child: const Text(
                  "Stop",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.redAccent,
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                        border: TableBorder.all(
                            borderRadius: BorderRadius.circular(20)),
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
                        rows: dataroww
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(
                                    Text(
                                      (dataroww.indexOf(e) + 1).toString(),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      _time_controller.DateFormat(e.date),
                                    ),
                                  ),
                                  DataCell(
                                    Text(
                                      _time_controller.TimeFormat(e.start),
                                    ),
                                  ),
                                  DataCell(
                                    Text(_time_controller.TimeFormat(e.end)),
                                  ),
                                  DataCell(
                                    Text(e.totalDuration.toString()),
                                  ),
                                ],
                              ),
                            )
                            .toList()),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class datacel {
  final DateTime date;
  final DateTime start;
  final DateTime end;
  final String totalDuration;

  datacel(
      {required this.date,
      required this.start,
      required this.end,
      required this.totalDuration});
}
