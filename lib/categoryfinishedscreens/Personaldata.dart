import 'package:flutter/material.dart';
import 'package:easy_taxx/categoryfinishedscreens/Taxoffice.dart';



class Personaldata extends StatefulWidget {

  @override
  _MyPersonaldataState createState() =>  _MyPersonaldataState();

}

class  _MyPersonaldataState extends State<Personaldata> {

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
      body:SingleChildScrollView(
      child:Column(
          children: <Widget>[
    Container(

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
                  'Personal Data',
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
                  'We need to collect some more personal data from you ',
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
                  'FIRST NAME ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[600],


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
                  'LAST NAME ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[600],


                  ),
                ),
              ),
              TextField(
                cursorColor: Colors.amber,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(1),
                ),
              ),
              SizedBox(height: 12),
              Container(
                margin: EdgeInsets.only( right: 25.0),
               child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Align(
                      alignment: Alignment.bottomLeft,
                      child:Text(
                        'DATE OF BIRTH ',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[600],


                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomLeft,

                      child:Text(
                        'GENDER ',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 14.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Colors.grey[600],


                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Row(

                children: <Widget>[

                  Flexible(
                  child: TextField(
                    cursorColor: Colors.amber,
                    style: TextStyle(height: 1.0),
                    decoration: InputDecoration(
                      hintText: 'DD.MM.YYYY',
                      contentPadding: EdgeInsets.all(1),
                    ),
                  ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    padding: EdgeInsets.only(left: 2.0,right:2.0,top:10.0),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                  child:DropdownButton(
                    hint: Text(
                      "Choose",
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                        color: Colors.grey[600],
                      ),
                    ),
                    value : _valGender,
                    items: _listGender.map((value) {
                      return DropdownMenuItem(
                        child: Text(value),
                        value: value,
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        _valGender = value;  // To tell _valGender that the contents will be changed according to the value we selected
                      });
                    },
//                    style: Theme.of(context).textTheme.headline6,

                  ),
                          ),
                    ),
                  ),
                ],

              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.bottomLeft,
                child:Text(
                  'STEUERIDENTIFIKATIONSNUMMER ',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 14.0,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    color: Colors.grey[600],


                  ),
                ),
              ),
              TextField(
                cursorColor: Colors.amber,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  hintText: 'xx xxx xxx xxx',
                  contentPadding: EdgeInsets.all(1),
                ),
              ),








            ],

          ),
        ),



      )])),
      bottomNavigationBar: BottomAppBar(


        child: Container(
          height: 50,
          // color:Colors.amber,

          margin: EdgeInsets.only(left:30.0,right: 30.0,bottom: 20.0, top: 25.0),
          child: MaterialButton(
            shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12.0) ),
            height: 30,
            onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Taxoffice()));
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