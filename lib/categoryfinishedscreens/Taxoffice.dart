import 'package:flutter/material.dart';
import 'package:easy_taxx/categoryfinishedscreens/Bankdetails.dart';
import 'package:easy_taxx/categoryfinishedscreens/SearchTaxoffice.dart';




class Taxoffice extends StatefulWidget {

  @override
  _TaxofficeState createState() =>  _TaxofficeState();

}

class  _TaxofficeState extends State<Taxoffice> {

  double height;
  double width;
  double body_height;
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Your Tax Office  ',
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
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchTaxoffice()));
                    },
                 child: Icon(
                    Icons.info,
                    color: Colors.amber,
                    size: 24.0,
                   // onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchTaxoffice()));},
                  )
                  ),
                ],
              ),

              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child:Text(
                  'The responsible tax office to send your tax declaration to. ',
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
              SizedBox(height: 16),
              Align(
                alignment: Alignment.bottomLeft,
                child:Text(
                  'TAX OFFICE ',
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

         // InkWell(
           //   child:
              TextField(
                cursorColor: Colors.amber,
                style: TextStyle(height: 1.0),
                decoration: InputDecoration(
                  //    hintText: "FIRST NAME",
                  contentPadding: EdgeInsets.all(1),
                ),

              ),
           // onTap: () { Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchTaxoffice()));},
         // ),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Bankdetails()));
                    print(height);
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
