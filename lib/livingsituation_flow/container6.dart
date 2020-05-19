import 'package:easy_taxx/livingsituation_flow/container2.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/datamodels/designfile.dart';
class Container6 extends StatefulWidget {
  String Identity;
  String BigQuestion = "";
  String Question;
  String QuestionOption;
  double Containersize;
  List AnswerOption = [];


  Container6({this.Identity,this.BigQuestion,this.Question,this.QuestionOption,this.AnswerOption,this.Containersize});



  @override
  _testing3State createState() => _testing3State();
}

class _testing3State extends State<Container6> {
  Questions qu = Questions();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
    //print("okxjsdnsmd");
  }




  void timer()
  {
    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open=true;
//        single=true;
      });
    });
  }
  bool open = false;
  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .008;
    double maxHeight = widget.Containersize;
    //double maxHeight = MediaQuery.of(context).size.height * .62;
    //double maxHeight =360.0;
    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,

        constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
//                            alignment: Alignment.lerp(1, 1, 0),
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
              onTap: () => setState(() => open = !open),
              child:
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        //margin: EdgeInsets.only(left: 10.0,right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF) : Colors.deepPurple[400],
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
                            child: Text("",style: TextStyle(fontSize:12.5,color: Colors.black),),
                          )),

                      Positioned(
                        top: 52.0,
                        left: MediaQuery.of(context).size.width / 30.0,
                        right: MediaQuery.of(context).size.width / 30.0,

                        child:Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child:Text(widget.Question,style: TextStyle(fontSize:questionFontSize,color: Colors.white,wordSpacing: 3.0,fontWeight: FontWeight.w600),)),

                      )

                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 120.0,
                    width: 450.0,
//                                        color: Colors.red,
                    child: ListView.builder
                      (
                        itemCount: widget.AnswerOption.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return GestureDetector(
                          onTap: (){
                            qu.addAnswer(widget.Identity,widget.BigQuestion, widget.QuestionOption, [widget.AnswerOption[index]], 55.0);

                            Navigator.of(context).pop();
                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                              return mainQuestions(CheckQuestion : widget.QuestionOption,CheckAnswer : [widget.AnswerOption[index]]);
                            }));
                          },
                           child: Column(
                                children: <Widget>[

                                  ListTile(
                                      leading:Text(widget.AnswerOption[index],style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF) : Colors.deepPurple[300],fontWeight: FontWeight.bold)),
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
}
