import 'package:easy_taxx/livingsituation_flow/container2.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Colors.blueAccent : Colors.deepPurple[400],
                    ),
                    height: 130.0,
                    width: 450.0,

                    child: Padding(padding: EdgeInsets.only(left: 20.0,top: 45.0),
                      child: Text(widget.Question,style: TextStyle(fontSize:20.0,color: Colors.white),),),

                  ),
                  SizedBox(height: 10.0,),
                  Container(
                    height: 140.0,
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
                                      leading:Text(widget.AnswerOption[index],style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Colors.lightBlue : Colors.deepPurple[300])),
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
