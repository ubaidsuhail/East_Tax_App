import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/home_flow/homemainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/datamodels/designfile.dart';



class HomeSixOptionContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  List answerOption = [];
  String additionalData;
  String multipleData;


  HomeSixOptionContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.answerOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _HomeSixOptionContainerState createState() => _HomeSixOptionContainerState();
}

class _HomeSixOptionContainerState extends State<HomeSixOptionContainer> {
  bool open = false;
  bool v3 = false;
  Questions qu =Questions();
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
  //List<String> items = ["Employeed","Minijob(e.g 4.50 basis)","Studying","others","Employeed","Minijob(e.g 4.50 basis)","Studying","others",];

  List values = [];

  //bool containerColor = false;



  @override

  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .008;
    //double maxHeight = MediaQuery.of(context).size.height * .59;
    double maxHeight = widget.containerSize;
    return AnimatedContainer(

        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,
//                    constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
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
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
                        ),
                        height: 140.0,
                        width: MediaQuery.of(context).size.width,

                      ),


                      Positioned(
                          right: MediaQuery.of(context).size.width* 0.04 ,
                          top: 7.0,
                          child: GestureDetector(
                              onTap: (){

                              },
                              child:Image(image: AssetImage("images/question_mark.png"),width: questionMarkWidth,height: questionMarkHeight,))
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
                            child:Text(widget.completeQuestion,style: TextStyle(fontSize:questionFontSize,color: Colors.white,wordSpacing: 3.0,fontWeight: FontWeight.w600),)),

                      )

                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 270.0,
                    width: 450.0,


//                                        color: Colors.red,
                    child: ListView.builder
                      (
                        itemCount: widget.answerOption.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return GestureDetector(
                            onTap: (){
                              //Home
                              if(widget.completeQuestion == "Why did you have a second household?" && widget.questionOption == "Reason for double housekeeping" && widget.answerOption[index] == "Private reasons" && Questions.secondHouseHoldLength > 0)
                              {
                                Questions.secondHouseHoldLength += 1;
                                Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
                                qu.HomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, [widget.answerOption[index]], 55.0);

                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return HomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : [widget.answerOption[index]]);
                                }));
                              }
                              //Relocation
                              else if(widget.completeQuestion == "What is the reason for your relocation No. ${Questions.relocationLength}?" && widget.questionOption == "Reason of relocation" && widget.answerOption[index] == "Moved in or out of a second household" && Questions.relocationLength > 0)
                              {
                                Questions.relocationLength += 1;
                                Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();
                                qu.HomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, [widget.answerOption[index]], 55.0);

                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return HomeMainQuestions(CheckCompleteQuestion : "What is the reason for your relocation No. ${Questions.relocationLength}?",CheckQuestion : widget.questionOption,CheckAnswer : [widget.answerOption[index]]);
                                }));

                              }
                              //Relocation
                              else if(widget.completeQuestion == "What is the reason for your relocation No. ${Questions.relocationLength}?" && widget.questionOption == "Reason of relocation" && widget.answerOption[index] == "None of them" && Questions.relocationLength > 0)
                              {
                                Questions.relocationLength += 1;
                                Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();
                                qu.HomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, [widget.answerOption[index]], 55.0);

                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return HomeMainQuestions(CheckCompleteQuestion : "What is the reason for your relocation No. ${Questions.relocationLength}?",CheckQuestion : widget.questionOption,CheckAnswer : [widget.answerOption[index]]);
                                }));

                              }
                              else{
                              qu.HomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, [widget.answerOption[index]], 55.0);

                              Navigator.of(context).pop();
                              Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return HomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : [widget.answerOption[index]]);
                              }));
                            }
                            },

                              child: Column(
                                  children: <Widget>[

                                    ListTile(
                                      leading:Text(widget.answerOption[index],style:TextStyle(color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),fontWeight: FontWeight.bold) ),
                                    ),

                                    Divider(thickness: 1.0,height: 1.0,),



                                  ]));
                        }
                    ),

                  ),


                ],
              ),

            )));


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