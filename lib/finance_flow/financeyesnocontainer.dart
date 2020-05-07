import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/finance_flow/financemainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';



class FinanceYesNoContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData ="";
  String multipleData;
  List suggestion;


  FinanceYesNoContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData,this.suggestion});

  @override
  _FinanceYesNoContainerScreenState createState() => _FinanceYesNoContainerScreenState();
}

class _FinanceYesNoContainerScreenState extends State<FinanceYesNoContainer> {

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
    //double maxHeight = 280.0;
    double maxHeight = widget.containerSize;
    // widget.Containersize;
    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,

        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
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
                  Stack(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(left: 10.0,right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
                        ),
                        height: 148.0,
                        width: MediaQuery.of(context).size.width,

                      ),


                      Positioned(
                          right: MediaQuery.of(context).size.width* 0.04 ,
                          top: 7.0,
                          child: GestureDetector(
                              onTap: (){

                              },
                              child:Image(image: AssetImage("images/question_mark.png"),width: 23.0,height: 23.0,))
                      ),

                      Positioned(
                          left: MediaQuery.of(context).size.width / 30.0,
                          top: 30.0,
                          child:Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(widget.multipleData,style: TextStyle(fontSize:12.5,color: Colors.black),),
                          )),

                      Positioned(
                        top: 52.0,
                        left: MediaQuery.of(context).size.width / 30.0,
                        right: MediaQuery.of(context).size.width / 30.0,

                        child:Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child:Text(widget.completeQuestion,style: TextStyle(fontSize:19.0,color: Colors.white,wordSpacing: 3.0,fontWeight: FontWeight.w600),)),

                      )

                    ],
                  ),

                  SizedBox(height: 8.0,),
                  Container(
                    //margin: EdgeInsets.only(top: 5.0),
                    height: 2.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 0.8,

                      ),
                    ]),

                  ),


                  Container(
                      decoration: new BoxDecoration(boxShadow: [
                        new BoxShadow(
                          color: Colors.grey,
                          blurRadius: 2.0,
                        ),
                      ]),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          GestureDetector(
                            onTap: (){
                              YesResponse();
                            },

                            child:
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 52.0,
                              //color: Colors.white,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border(
                                  right: BorderSide(
                                    color: Colors.grey[300],
                                  ),
                                ),
                                //borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Center(
                                child: Text('Yes',style: TextStyle(color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),fontWeight: FontWeight.w600,fontSize: 16.0),),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: (){
                              NoResponse();
                            },

                            child:
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              height: 52.0,
                              color: Colors.white,
                              child: Center(
                                child: Text('No',style: TextStyle(color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),fontWeight: FontWeight.w600,fontSize:16.0)),
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),

            ))



    );


  }


  void NoResponse()
  {

    qu.FinanceAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['No'], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FinanceMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["No"]);
    }));




  }

  void YesResponse()
  {
    qu.FinanceAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['Yes'], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FinanceMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["Yes"]);
    }));
  }


}