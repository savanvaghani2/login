import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:login/data/colors.dart';

class Usersmanagment extends StatefulWidget {
  const Usersmanagment({Key? key}) : super(key: key);

  @override
  State<Usersmanagment> createState() => _UsersmanagmentState();
}

class _UsersmanagmentState extends State<Usersmanagment> {
//  String? admindid;
//   getpref() async {
//    final _pref = await SharedPreferences.getInstance();

//                admindid = _pref.getString("did");
//   }

//   @override
//   void initState() {
//     // TODO: implement initState

//     super.initState();
//     getpref();
//   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection("Users")
              .where("isAdmin", isNotEqualTo: true)
              .snapshots(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              final data = snapshot.data!.docs;

              print(data);
              return ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  final user = data[index];
                  print(user.data());
                  final name = user["name"];
                  return Container(
                    child: Text(name),
                  );
                },
              );
            } else {
              return Center(
                  child: CircularProgressIndicator(color: AppColor.green));
            }
          })),
    );
  }
}
