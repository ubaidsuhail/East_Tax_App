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

        backgroundColor: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,


          children: <Widget>[

            Container(
              margin: EdgeInsets.only(left:20.0),
              height: MediaQuery.of(context).size.height * 0.60,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
          Image(image: AssetImage("images/mainimage.png"),),

           Container(
             margin: EdgeInsets.only(top: 25.0),
             color: Colors.white,
             height: 30.0,
             child: Text("easyTaxx",style: TextStyle(fontSize: 25.0,color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),),
           ),
              Padding(
                padding:EdgeInsets.only(top: 3.0),
              child:Text("Die Steuer-App",style: TextStyle(fontSize: 23.0,color: Colors.white),)),
            ],
          ),



        ),

//            color: Colors.red,

//          Opacity(
//            opacity: 0.7,
//            child: Container(
//              width: MediaQuery.of(context).size.width,
//              height: MediaQuery.of(context).size.height,
//              color: Colors.lightBlueAccent,
//            ),
//          ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Center(child:

                  GestureDetector(
                    onTap: (){
                      Navigator.pushNamed(context, 'LoginPage');
                    },
                    child: Text('Already registered?',style: TextStyle(color: Colors.white),),
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
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 50.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8.0),
                          ),
                      child:Center(child:
                      Text('Im new here'),),
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