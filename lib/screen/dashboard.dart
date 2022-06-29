import 'package:flutter/material.dart';
import 'package:login/user/homescreen/report.dart';
import 'package:login/user/homescreen/setting.dart';
import '../user/homescreen/salary.dart';
import '../user/homescreen/userhome.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int index = 0;

  List<Widget> bodyList = [
    const UserHomePage(),
    const ReportScreen(),
    const SalaryScreen(),
    const UserSettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        clipBehavior: Clip.none,
        margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                offset: const Offset(0, 5))
          ],
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          backgroundColor: Colors.transparent,
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          selectedItemColor: Colors.blue,
          selectedLabelStyle:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          currentIndex: index,
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Report",
              icon: Icon(
                Icons.stacked_bar_chart,
              ),
            ),
            BottomNavigationBarItem(
              label: "Salary",
              icon: Icon(
                Icons.monetization_on,
              ),
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "Setting"),
          ],
          onTap: (v) {
            setState(() {
              index = v;
            });
          },
        ),
      ),
      body: bodyList.elementAt(index),
    ));
  }
}
