import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/family_flow/familymainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';




class FamilyDifferentOptionContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  List answerOption = [];
  String additionalData;
  String multipleData;


  FamilyDifferentOptionContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.answerOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _FamilyDifferentOptionContainerState createState() => _FamilyDifferentOptionContainerState();
}

class _FamilyDifferentOptionContainerState extends State<FamilyDifferentOptionContainer> {
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
                          color: Colors.blueAccent,
                        ),
                        height: 140.0,
                        width: 450.0,

                      ),

                      Positioned(
                        left: 10.0,
                        top: 13.0,
                        child: Text(widget.multipleData,style: TextStyle(fontSize:12.5,color: Colors.black),),
                      ),

                      Positioned(
                        top: 35.0,
                        left: 10.0,
                        right: 10.0,

                        child: Text(widget.completeQuestion,style: TextStyle(fontSize:17.5,color: Colors.white,wordSpacing: 3.0),),
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

                                if(widget.answerOption[index] == "Vocational training" || widget.answerOption[index] == "Bachelor/Master/Diploma" || widget.answerOption[index] == "None")
                                {
                                  Questions.schoolLength += 1;
                                  Questions.schoolText ="SCHOOL FEES "+Questions.schoolLength.toString();
                                  qu.FamilyAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, [widget.answerOption[index]], 55.0);
                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return FamilyMainQuestions(CheckCompleteQuestion : "What type of certification is getting from school no. ${Questions.schoolLength}?",CheckQuestion : widget.questionOption,CheckAnswer : [widget.answerOption[index]]);
                                }));
                                }

                                else
                                  {
                                qu.FamilyAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, [widget.answerOption[index]], 55.0);

                                Navigator.of(context).pop();
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                return FamilyMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : [widget.answerOption[index]]);
                                }));
                                }
                              },

                              child: Column(
                                  children: <Widget>[

                                    ListTile(
                                      leading:Text(widget.answerOption[index],style:TextStyle(color: Colors.blueAccent,) ),
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