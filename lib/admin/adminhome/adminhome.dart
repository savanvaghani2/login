import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:login/data/colors.dart';
import 'package:login/data/textstyles.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  final GlobalKey<SliderDrawerState> _key = GlobalKey<SliderDrawerState>();
  String title = "Home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
          key: _key,
          slider: SliderItems(
            ontap: (_title) {
              setState(() {
                title = _title;
              });
            },
          ),
          appBar: SliderAppBar(
            drawerIconColor: Colors.white,
            appBarColor: AppColor.green,
            appBarHeight: 80,
            title: Text(
              title,
              style: AppTextStyle.h3.copyWith(color: Colors.white),
            ),
          ),
          child: Container(
            color: Colors.white,
          )),
    );
  }
}

class SliderPageView extends StatefulWidget {
  const SliderPageView({Key? key}) : super(key: key);

  @override
  State<SliderPageView> createState() => _SliderPageViewState();
}

class _SliderPageViewState extends State<SliderPageView> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class SliderItems extends StatefulWidget {
  const SliderItems({Key? key, required this.ontap}) : super(key: key);
  final Function(String) ontap;
  @override
  State<SliderItems> createState() => _SliderItemsState();
}

class _SliderItemsState extends State<SliderItems> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SliderItem(
              title: "Home",
              ontap: (val) {
                setState(() {
                  widget.ontap(val);
                });
              },
            ),
            SliderItem(
              title: "Settings",
              ontap: (val) {
                setState(() {
                  widget.ontap(val);
                });
              },
            ),
            SliderItem(
              title: "Users",
              ontap: (val) {
                setState(() {
                  widget.ontap(val);
                });
              },
            ),
            const Spacer(),
            SliderItem(
              title: "Logout",
              ontap: (val) {
                // setState(() {
                //   widget.ontap(val);
                // });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SliderItem extends StatelessWidget {
  const SliderItem({Key? key, required this.title, required this.ontap})
      : super(key: key);
  final String title;
  final Function(String) ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: ListTile(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        tileColor: Colors.white,
        title: Text(
          title,
          style: AppTextStyle.p3,
        ),
        onTap: () {
          ontap(title);
        },
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
