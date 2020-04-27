import 'package:flutter/material.dart';


class UnSupportedScreen extends StatefulWidget {
  @override
  _UnSupoortedScreenState createState() => _UnSupoortedScreenState();
}

class _UnSupoortedScreenState extends State<UnSupportedScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 210.0,
      child: Text("unsupported screen"),
    );
  }
}
