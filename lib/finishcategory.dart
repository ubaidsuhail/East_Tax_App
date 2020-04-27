import 'package:easy_taxx/show.dart';
import 'package:easy_taxx/training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:responsive_container/responsive_container.dart';
//void main() => runApp(MaterialApp(home:HomeScreen()));

class FinishCategory extends StatefulWidget {

  String currentCategory="";
  String nextCategory="";
  FinishCategory(this.currentCategory,this.nextCategory);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FinishCategory> {

  bool open = false;
  bool v3 = false;
  Questions qu=Questions();
  Widget circleButton(IconData iconData){
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(iconData, size: 30,),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }


  void timer()
  {
    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open=true;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .004;
    //double maxHeight = MediaQuery.of(context).size.height * .3;
    double maxHeight = 210.0;
    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,

        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          //color: Colors.grey[200],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child:
        SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:
            InkWell(
//                            onTap: () => setState(() => open = !open),
              child:
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:Colors.lightBlue,
                    ),
                    height: 210.0,
                    width: 450.0,

                    child: Padding(padding: EdgeInsets.only(left: 20.0,top: 45.0),
                      child: Text("Congratulations! You have finished " + widget.currentCategory + ".Now You can move to "+ widget.nextCategory,style: TextStyle(fontSize:20.0,color: Colors.white),),),

                  ),
                                  ],
              ),

            ))



    );


  }
  void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Hello from the default snackbar'),
        action: SnackBarAction(
          label: 'Click Me',
          onPressed: () {},
        ),
      ),
    );
  }
}