import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/health_flow/healthmainquestions.dart';

class HealthCalculationContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;
  String suggestion;


  HealthCalculationContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData,this.suggestion});
  @override
  _HealthCalculationContainerState createState() => _HealthCalculationContainerState();
}

class _HealthCalculationContainerState extends State<HealthCalculationContainer> {
  TextEditingController calculations = TextEditingController();
  Questions qu =Questions();
  bool open = false;
  void timer() {
    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open = true;
//        single=true;
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }
  @override
  Widget build(BuildContext context) {

    double minHeight = MediaQuery
        .of(context)
        .size
        .height * .004;
//    double maxHeight = MediaQuery
//        .of(context)
//        .size
//        .height * .3;

    //double maxHeight = 210.0;
    double maxHeight = widget.containerSize;
    // var maskTextInputFormatter = MaskTextInputFormatter(mask: "## / ## / ####");
//filter: { "#": RegExp(r'[0-9]')

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
                  SizedBox(height: 10.0,),

                  Card(
                      elevation: 6.0,
                      child:Container(
                        //margin: EdgeInsets.only(right: 60.0),
//                                      decoration: new BoxDecoration(boxShadow: [
//                                        new BoxShadow(
//                                          color: Colors.grey,
//                                          blurRadius: 5.0,
//                                        ),
//                                      ]),
                          width: MediaQuery.of(context).size.width,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  color:Colors.white,
                                  width: MediaQuery.of(context).size.width*0.45,
                                  height: 60.0,
//                    color: Colors.wh,
                                  child: TextFormField(
                                    controller: calculations,
                                    //inputFormatters: [maskTextInputFormatter],
                                    //keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

                                        hintText: "0",
                                        contentPadding: EdgeInsets.only(left: 15.0)
                                    ),
                                  )
                              ),

                              Container(
                                //margin: EdgeInsets.only(left: 20.0),
                                // color: Colors.blue,
                                width: MediaQuery.of(context).size.width*0.20,
                                child:GestureDetector(
                                  onTap: (){
                                    AddData();
                                  },
                                  child: Text("Confirm",style: TextStyle(color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),fontWeight: FontWeight.w600,fontSize: 16.0)),
                                ),)
                            ],
                          ))),

                ],
              ),

            )));

  }


  void AddData()
  {

    if(widget.completeQuestion == "For how many adult children did ${Questions.healthYouIdentity} pay health insurance contributions?" && widget.questionOption == "Number of children")
    {
      Questions.totalHealthChildren = int.parse(calculations.text);
      print("Total Health Children:"+Questions.totalHealthChildren.toString());
      Questions.healthChildrenLength += 1;
      Questions.healthChildrenText ="INSURANCE CHILD "+Questions.healthChildrenLength.toString();
    }

    else if(widget.completeQuestion == "How much were ${Questions.healthYouIdentity} reimbursed?" && widget.questionOption == "Health insurance refunds - child")
    {
      Questions.healthChildrenLength += 1;
      Questions.healthChildrenText ="INSURANCE CHILD "+Questions.healthChildrenLength.toString();
    }

    else if(widget.completeQuestion == "To how many different doctors did ${Questions.healthYouIdentity} travel?" && widget.questionOption == "Doctors")
    {
      Questions.totalDoctorTrip = int.parse(calculations.text);
      print("Total Doctor Trip:"+Questions.totalHealthChildren.toString());
      Questions.doctorTripLength += 1;
      Questions.doctorTripText ="JOURNEY "+Questions.doctorTripLength.toString();
    }

    else if(widget.completeQuestion == "How much has been reimbursed?      " && widget.questionOption == "Reimbursement amount")
    {
      Questions.doctorTripLength += 1;
      Questions.doctorTripText ="JOURNEY "+Questions.doctorTripLength.toString();
    }



    else if(widget.completeQuestion == "How many people did ${Questions.healthYouIdentity} take care of?" && widget.questionOption == "Number of people cared for")
    {
      Questions.totalPeopleCare = int.parse(calculations.text);
      print("Total People Care:"+Questions.totalPeopleCare.toString());
      Questions.peopleCareLength += 1;
      Questions.peopleCareText ="PEOPLE "+Questions.peopleCareLength.toString();
    }

    else if(widget.completeQuestion == "How many other carers were there?" && widget.questionOption == "Number of carers" && Questions.totalPeopleCare > 0)
    {
      Questions.peopleCareLength += 1;
      Questions.peopleCareText ="PEOPLE "+Questions.peopleCareLength.toString();
    }


    qu.HealthAddAnswer(widget.identity, widget.bigQuestion, widget.completeQuestion, widget.questionOption, [calculations.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HealthMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion: widget.questionOption, CheckAnswer: ["ok"]);
    }));



  }



}
