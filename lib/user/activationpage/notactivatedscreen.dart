import 'package:flutter/material.dart';

class NotActivated extends StatefulWidget {
  const NotActivated({Key? key}) : super(key: key);

  @override
  State<NotActivated> createState() => _NotActivatedState();
}

class _NotActivatedState extends State<NotActivated> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("wait for activation or contact Admin."),
      ),
    );
  }
}
