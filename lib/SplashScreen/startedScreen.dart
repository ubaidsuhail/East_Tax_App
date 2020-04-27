import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class GettingStartedScreen extends StatefulWidget {
  @override
  _GettingStartedScreenState createState() => _GettingStartedScreenState();
}

class _GettingStartedScreenState extends State<GettingStartedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.blue,
        body: Stack(

          children: <Widget>[

            Container(decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("images/tax1.png"), fit: BoxFit.fitWidth),

//            color: Colors.red,
            ),
            ),
//          Opacity(
//            opacity: 0.7,
//            child: Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height,
//              color: Colors.lightBlueAccent,
//            ),
//          ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(child:

                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    child: Text('Already Registered',style: TextStyle(color: Colors.white),),
                  )

                    ,),
                  SizedBox(height: 15.0,),
                  Center(child:
                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'NewHere');
                    },
                    child:
                    Container(
                      color: Colors.white,
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50.0,
                      child:Center(child:
                      Text('I\'m new here'),),
                    ),),


                  ),
                  SizedBox(height: 15.0,),
                ],
              ),),
          ],
        )



    );
  }
}