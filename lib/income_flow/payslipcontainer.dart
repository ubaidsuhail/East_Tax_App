import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/income_flow/incomemainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:responsive_container/responsive_container.dart';


class PaySlipContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;


  PaySlipContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<PaySlipContainer> {

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
   // double maxHeight = 370.0;
    double maxHeight = widget.containerSize;
    // widget.Containersize;
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
              child:
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.lightBlue,
                    ),
                    height: 130.0,
                    width: 450.0,

                    child: Padding(padding: EdgeInsets.only(left: 20.0,top: 35.0),
                      child: Text(widget.completeQuestion,style: TextStyle(fontSize:20.0,color: Colors.white),),),

                  ),


                  SizedBox(height: 10.0,),

                  Container(
                    height: 170.0,
                    width: 450.0,
                    //color: Colors.pink,
//                    child:Padding(
//                      padding: EdgeInsets.only(left: 60.0,right: 60.0),
//                    child: Text("The Lohnsteuerbescheinigung is your annual payslip.You usually receive one per employer once per year.",style: TextStyle(fontSize: 15.0,color: Colors.grey),
//                    ),
//                    )

                  child: Row(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                            Image(image: AssetImage("images/payslip.png")),
                          ],
                        ),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          children: <Widget>[
                          Text("The Lohnsteuerbescheinigung is your annual payslip.You usually receive one per employer once per year.",style: TextStyle(fontSize: 15.0,color: Colors.grey)),
                          ],
                        ),
                      )

                    ],
                  ),

                  ),


                  Container(
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 5.0,
                        ),
                      ]),
                      width: MediaQuery.of(context).size.width,
                      child:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              //Questions.animatedContainer = 420.0;
                              qu.IncomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['No'], 55.0);

                              Navigator.of(context).pop();
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return IncomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["No"]);
                              }));
                            },

                            child:
                            Container(
                              width: MediaQuery.of(context).size.width * 0.465,
                              height: 50.0,
                              color: Colors.white,
                              child: Center(
                                child: Text('No',style: TextStyle(color:Colors.lightBlue),),
                              ),
                            ),),
                          GestureDetector(
                            onTap: (){
                              //Questions.animatedContainer = 420.0;
                              qu.IncomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['Yes'], 55.0);

                              Navigator.of(context).pop();
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return IncomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["Yes"]);
                              }));
                            },

                            child:
                            Container(
                              width: MediaQuery.of(context).size.width * 0.475,
                              height: 50.0,
                              color: Colors.white,
                              child: Center(
                                child: Text('Yes',style: TextStyle(color:Colors.lightBlue)),
                              ),
                            ),),
                        ],
                      ))
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