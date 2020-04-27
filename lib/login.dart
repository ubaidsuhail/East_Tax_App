import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';


class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: Icon(Icons.close,color: Colors.lightBlue,),
        title: Text("Log in",style: TextStyle(color:Colors.lightBlue,)),
        centerTitle: true,
      ),


      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(left: 20.0,top: 20.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'EMAIL ADDRESS',style: TextStyle(fontSize: 20.0),
                  )
                ],
              )),
    Padding(
    padding: EdgeInsets.only(left: 20.0,right: 10.0),
    child:
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Email Address',

            ),
          )),

          Padding(
              padding: EdgeInsets.only(left: 20.0,top: 20.0),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'ENTER YOUR PIN',style: TextStyle(fontSize: 20.0),
                  )
                ],
              )),
          Padding(
          padding: EdgeInsets.only(left: 20.0,top: 20.0),
          child: Row(
            children: <Widget>[
              Container(
                width: 50.0,
                child: Center(
            child:
            TextFormField(
                  style: TextStyle(fontSize: 30.0),
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(left: 15.0),
                    hintText: '0',
//                    hintStyle: TextStyle(fontSize: )
                  ),
                ),),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: 50.0,
                child: Center(
                  child:
                  TextFormField(
                    style: TextStyle(fontSize: 30.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.0),
                      hintText: '0',
//                    hintStyle: TextStyle(fontSize: )
                    ),
                  ),),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: 50.0,
                child: Center(
                  child:
                  TextFormField(
                    style: TextStyle(fontSize: 30.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.0),
                      hintText: '0',
//                    hintStyle: TextStyle(fontSize: )
                    ),
                  ),),
              ),
              SizedBox(width: 10.0,),
              Container(
                width: 50.0,
                child: Center(
                  child:
                  TextFormField(
                    style: TextStyle(fontSize: 30.0),
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(left: 15.0),
                      hintText: '0',
//                    hintStyle: TextStyle(fontSize: )
                    ),
                  ),),
              ),
              SizedBox(width: 10.0,),
              AutoSizeText(
                'Forgot?',
                style: TextStyle(fontSize: 18.0,color: Colors.lightBlue),
              )
            ],
          )
          ),

SizedBox(height: 80.0,),
          Container(
            decoration: BoxDecoration(
                color: Colors.lightBlue,
              borderRadius: BorderRadius.circular(10.0)
            ),

            width: MediaQuery.of(context).size.width * 0.8,
            height: 55.0,
            child: Center(
              child: AutoSizeText(
                'Log in',style: TextStyle(color: Colors.white,fontSize: 18.0),
              ),
            )
          )
        ],
      ),

      ));
  }
}
