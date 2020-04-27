import 'package:easy_taxx/SplashScreen/startedScreen.dart';
import 'package:flutter/material.dart';
import 'dart:async';


class SplashScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return SplashScreenState();
  }
}

class SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    loadData();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("images/tax.png"), ),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.3, 0.6, 0.6, 1.9],
          colors: [
            // Colors are easy thanks to Flutter's Colors class.
            Color.fromARGB(0xff,0x3A ,0xB5, 0xFF),
            Color.fromARGB(0xff,0x3A ,0xB5, 0xFF),
            Color.fromARGB(0xff,0x3A ,0xB5, 0xFF),
            Color.fromARGB(0xff,0x3A ,0xB5, 0xFF),

          ],
        ),
      ),

    );
  }
  Future<Timer> loadData() async {
    return new Timer(Duration(seconds: 3), onDoneLoading);
  }

  onDoneLoading() async {
    Navigator.pushNamed(context, 'GettingStartedScreens');
  }
}