import 'package:easy_taxx/livingsituation_flow/container3.dart';
import 'package:easy_taxx/SplashScreen/NewHere.dart';
import 'package:easy_taxx/SplashScreen/splashscreen.dart';
import 'package:easy_taxx/SplashScreen/startedScreen.dart';
import 'package:easy_taxx/livingsituation_flow/container2.dart';
import 'package:easy_taxx/login.dart';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
//import 'package:easy_taxx/questions.dart';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/testing.dart';
import 'package:easy_taxx/testing2.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SplashScreen(),
    routes: <String, WidgetBuilder>{
      'GettingStartedScreens' : (BuildContext context) => GettingStartedScreen(),
      'NewHere' : (BuildContext context) => newHere(),
      'LoginPage' : (BuildContext context) => loginPage(),
      'MainQuestions' : (BuildContext context) => mainQuestions(),
      'Testing' : (BuildContext context) => testing(),
      'SingleScreen' : (BuildContext context) => Container2(),
      'Employed' : (BuildContext context) => Container3(),
      'DynamicContainer' : (BuildContext context) => animation(),
//      'BottomBarUhasm' : (BuildContext context) => bottomBarUhasm(),
    },
  ));
}


