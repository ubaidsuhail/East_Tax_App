import 'package:flutter/material.dart';
import 'package:easy_taxx/categoryfinishedscreens/ConfirmIdentity.dart';
import 'package:easy_taxx/categoryfinishedscreens/Taxoffice.dart';



class Bankdetails extends StatefulWidget {

  @override
  _BankdetailState createState() =>  _BankdetailState();

}

class  _BankdetailState extends State<Bankdetails> {

  double height;
  double width;
  double body_height;
  String _valGender;
  List _listGender = ["Male", "Female"];
  final Color lightbluecolor = Color(0xFF3AB5FF);


  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    body_height = height* 0.90;
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(''),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: lightbluecolor, //change your color here
        ),
      ),
      body: Container(

        margin: EdgeInsets.only(left:15.0,right: 15.0),
        color: Colors.white,
        width: width,
        height: body_height ,
        child: Container(
          child: Column(
            children: <Widget>[
              SizedBox(height: 16),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'Bank details',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 16.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,

                  ),
                ),
              ),

              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'Please list your primary (not savings) account here. This '
                      'will be used for your refund from the tax office and our'
                      ' one-time filing payment (if applicable).',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,

                  ),
                ),
              ),
              SizedBox(height: 10),
              Align(
                alignment: Alignment.bottomLeft,
                child:Text(
                  'ACCOUNT HOLDER ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 15.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.black,


                  ),
                ),
              ),
              TextField(
                cursorColor: Colors.amber,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  //    hintText: "FIRST NAME",
                  contentPadding: EdgeInsets.all(1),
                ),

              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomLeft,
                child:Text(
                  'IBAN ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[300],


                  ),
                ),
              ),
              TextField(
                cursorColor: Colors.amber,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  hintText: 'XXXX XXXX XXXX XXXX XXXX XX',
                  contentPadding: EdgeInsets.all(1),
                ),
              ),
              SizedBox(height: 12),




            ],

          ),
        ),



      ),
      bottomNavigationBar: BottomAppBar(


        child: Container(
          height: 50,
          // color:Colors.amber,

          margin: EdgeInsets.only(left:30.0,right: 30.0,bottom: 20.0, top: 25.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12.0) ),
            height: 30,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>ConfirmIdentity()));
              print("cilcked");
            },
            child: Text(
              "Confirm",
              style: TextStyle(
                decoration: TextDecoration.none,
                fontSize: 15.0,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.w700,
                color: Colors.white,

              ),
            ),
            color: lightbluecolor ,
          ),
        ),
        //   ),
      ),

    );
  }
}