import 'package:flutter/material.dart';
import 'package:easy_taxx/categoryfinishedscreens/Carryforward.dart';
import 'package:easy_taxx/categoryfinishedscreens/PersonalData.dart';



class TotalTaxAmount extends StatefulWidget {
  TotalTaxAmount({Key key, this.title}) : super(key: key);



  final String title;

  @override
  _TotalTaxAmount createState() => _TotalTaxAmount();
}

class _TotalTaxAmount extends State<TotalTaxAmount> {


//  var screenWidth = MediaQuery.of(context).size.width;
//  var screenHeight = MediaQuery.of(context).size.height;
//  double height;
//  double width;
  //double sp_width;
  final Color lightbluecolor = Color(0xFF3AB5FF);

  @override
  Widget build(BuildContext context) {
//    width = MediaQuery.of(context).size.width;
//    height = MediaQuery.of(context).size.height;
    //sp_width = width * 0.85;
    //print(height);
    return Scaffold(
      resizeToAvoidBottomInset : false,
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF3AB5FF),

        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            IconButton(
              onPressed: () {
                //Navigator.push(context, MaterialPageRoute(builder: (context)=>mainTax()));
                Navigator.pushReplacementNamed(context, 'allCategoryScreen');
                },
              icon: new Image.asset('images/close.png',color: Colors.white,),
            ),
            // Your widgets here
          ],
        ),

      ),
      body: SingleChildScrollView(
          child:Column(
            children: <Widget>[

              Container(
                alignment: Alignment.bottomCenter,
                color: lightbluecolor,
                height: MediaQuery.of(context).size.height/2.0,
                child:Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[

                    Container(
                      alignment: Alignment.center,

                      child: new Image.asset(
                        'images/walletpig.png',
                        width: 172,
                        height: 172,
                        // fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 15),
                    Container(
                      alignment: Alignment.center,
                      child:  Text(
                        'Tax 2019',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 18.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Colors.white,

                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      child:  Text(
                        'You get a tax bonus on future income!',
                        textDirection: TextDirection.ltr,
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w700,
                          color: Colors.black,

                        ),
                      ),
                    ),
                  ],
                ),



              ),


              Container(
                color: Colors.white,
                //width: width,
                height: MediaQuery.of(context).size.height/1.5,
                child: new Column(

                  children: [

                    new Container(
                      margin: EdgeInsets.all(15.0),
                      child: new Row(

                        children: <Widget>[

                          Text(
                            "LOSS CARRYFORWARD",
                            textDirection: TextDirection.ltr,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 15.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black,

                            ),

                          ),
                          Spacer(),
                          Text(
                            "574.663,00"+"€",
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 28.0,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),

                          ),



                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(left:15.0,right:15.0,top:15.0),
                      child: Row(

                        children: <Widget>[
                          Flexible(
                            child: Text(
                              "If your cost exceeds your income, then you,ve made aloss for this tax year."
                                  " you can carry this loss over into next year with..."
                              ,
                              textDirection: TextDirection.ltr,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 16.0,
                                fontFamily: 'Raleway',
                                fontWeight: FontWeight.w700,
                                color: Colors.black,


                              ),

                            ),
                          ),


                        ],
                      ),


                    ),
                    Container(
                      margin: EdgeInsets.only(left:15.0, top: 5.0),
                      alignment: Alignment.topLeft,
                      child: GestureDetector(
                        onTap: () {

                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Carryforward()));
                        },


                        child:Text(
                          "Info",
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            fontSize: 15.0,
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w500,
                            color: lightbluecolor,

                          ),

                        ),
                      ),
                    ),

                    Container(

                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.only(left: 12.0,right:12.0,bottom:5.0),

                      child: Text(
                        "How we calculate your result",
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          fontSize: 15.0,
                          fontFamily: 'Raleway',
                          fontWeight: FontWeight.w700,
                          color: lightbluecolor,

                        ),

                      ),

                    ),


                    new Expanded(
                      child: new Container(
                        alignment: Alignment.topCenter,

                        margin: EdgeInsets.only(left:12.0,right:12.0,bottom:12.0),



                        child: new Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          verticalDirection: VerticalDirection.down,

                          children: <Widget>[

                            MaterialButton(
                              shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(12.0) ),
                              minWidth: MediaQuery.of(context).size.width * 0.85,
                              height: 50,
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Personaldata()));
                              },
                              child: Text(
                                "Prepare for submission",
                                style: TextStyle(
                                  decoration: TextDecoration.none,
                                  fontSize: 15.0,
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,

                                ),
                              ),
                              color: lightbluecolor ,
                            ),


                          ],
                        ),


                      ),
                    ),

                  ],

                ),
              ),


            ],
          )),


      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
