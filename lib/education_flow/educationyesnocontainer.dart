import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/education_flow/educationmainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';



class EducationYesNoContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData ="";
  String multipleData;


  EducationYesNoContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData});

  @override
  _EducationYesNoContainerScreenState createState() => _EducationYesNoContainerScreenState();
}

class _EducationYesNoContainerScreenState extends State<EducationYesNoContainer> {

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
                        child: Text(widget.multipleData,style: TextStyle(fontSize:12.5,color: Colors.black),),
                      ),

                      Positioned(
                        top: 52.0,
                        left: MediaQuery.of(context).size.width / 30.0,
                        right: MediaQuery.of(context).size.width / 30.0,

                        child: Text(widget.completeQuestion,style: TextStyle(fontSize:17.5,color: Colors.white,wordSpacing: 3.0),),
                      )

                    ],
                  ),


                  SizedBox(height: 10.0,),


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
                              NoResponse();
                            },

                            child:
                            Container(
                              width: MediaQuery.of(context).size.width * 0.465,
                              height: 60.0,
                              color: Colors.white,
                              child: Center(
                                child: Text('No',style: TextStyle(color: Colors.blueAccent,),),
                              ),
                            ),),
                          GestureDetector(
                            onTap: (){
                             YesResponse();
                            },

                            child:
                            Container(
                              width: MediaQuery.of(context).size.width * 0.475,
                              height: 60.0,
                              color: Colors.white,
                              child: Center(
                                child: Text('Yes',style: TextStyle(color: Colors.blueAccent,)),
                              ),
                            ),),
                        ],
                      ))
                ],
              ),

            ))



    );


  }


  void NoResponse()
  {

    if(widget.completeQuestion == "Were your travel expenses for route no. ${Questions.schoolRouteLength} higher than €1.00?" && widget.questionOption == "Higher expenses")
    {
      Questions.schoolRouteLength += 1;
      Questions.schoolRouteText ="ROUTE "+Questions.schoolRouteLength.toString();
      qu.EducationAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['No'], 55.0);

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EducationMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["No"]);
      }));
    }
    else if(widget.completeQuestion == "Were the costs reimbursed by your employer or the employment agency?" && widget.questionOption == "Reimbursement of costs")
    {
      Questions.trainingLength += 1;
      Questions.trainingText ="TRAINING "+Questions.trainingLength.toString();
      qu.EducationAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['No'], 55.0);

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EducationMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["No"]);
      }));
    }


    else{
      qu.EducationAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['No'], 55.0);

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EducationMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["No"]);
      }));
    }



  }

  void YesResponse()
  {

    qu.EducationAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, ['Yes'], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EducationMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["Yes"]);
    }));
  }


}