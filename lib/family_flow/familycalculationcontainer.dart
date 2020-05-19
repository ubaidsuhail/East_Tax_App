import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/family_flow/familymainquestions.dart';
import 'package:easy_taxx/datamodels/designfile.dart';

class FamilyCalculationContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;


  FamilyCalculationContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _FamilyCalculationContainerState createState() => _FamilyCalculationContainerState();
}

class _FamilyCalculationContainerState extends State<FamilyCalculationContainer> {
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
//                            onTap: () => setState(() => open = !open),
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
                        height: 150.0,
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
                                  width: MediaQuery.of(context).size.width*0.70,
                                  height: 50.0,
//                    color: Colors.wh,
                                  child: TextFormField(
                                    controller: calculations,
                                    //inputFormatters: [maskTextInputFormatter],
                                    //keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

                                        hintText: widget.additionalData == "calculation" ? "€0" : "example" ,
                                        contentPadding: EdgeInsets.only(left: 15.0)
                                    ),
                                    keyboardType:widget.additionalData == "calculation" ? TextInputType.number : TextInputType.emailAddress ,
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
                          )),

                ],
              ),

            )));

  }


  void AddData()
  {

    if(widget.completeQuestion == "How many children do you have?" && widget.questionOption == "Number of children")
    {
      Questions.childLength = 0;
      Questions.totalChild = int.parse(calculations.text);
      print("Total Children:"+Questions.totalChild.toString());
      Questions.childLength += 1;
      Questions.childText ="CHILD "+Questions.childLength.toString();
    }

    else if(widget.completeQuestion == "What is your child's first name?" && widget.questionOption == "First name child")
    {
     Questions.childFirstName = calculations.text;
    }

    else if(widget.completeQuestion == "In how many different places has your child lived?" && widget.questionOption == "Number of places lived")
    {
      Questions.childAddressLength = 0;
      Questions.totalChildAddress = int.parse(calculations.text);
      print("Total Child Address:"+Questions.totalChildAddress.toString());
      Questions.childAddressLength += 1;
      Questions.childAddressText ="ADDRESS "+Questions.childAddressLength.toString();
    }

    else if(widget.completeQuestion == "For how many kindergartens did you have costs?" && widget.questionOption == "Kindergartens attended")
    {
      Questions.kindergartenLength = 0;
      Questions.totalKindergarten = int.parse(calculations.text);
      print("Total Kindergarten:"+Questions.totalKindergarten.toString());
      Questions.kindergartenLength += 1;
      Questions.kindergartenText ="KINDERGARTEN "+Questions.kindergartenLength.toString();
    }

    else if(widget.completeQuestion == "How many child minders did you pay for?" && widget.questionOption == "Number of child minders")
    {
      Questions.childMinderLength = 0;
      Questions.totalChildMinder = int.parse(calculations.text);
      print("Total Child Minder"+Questions.totalChildMinder.toString());
      Questions.childMinderLength += 1;
      Questions.childMinderText ="CHILD MINDER "+Questions.childMinderLength.toString();
    }

    else if(widget.completeQuestion == "How many nannies did you pay?" && widget.questionOption == "Number of nannies")
    {
      Questions.nannyLength = 0;
      Questions.totalNanny = int.parse(calculations.text);
      print("Total Nanny"+Questions.totalNanny.toString());
      Questions.nannyLength += 1;
      Questions.nannyText ="NANNY "+Questions.nannyLength.toString();
    }

    else if(widget.completeQuestion == "How many babysitters did you pay for?" && widget.questionOption == "Number of babysitters")
    {
      Questions.babySitterLength = 0;
      Questions.totalBabySitter = int.parse(calculations.text);
      print("Total BabySitter"+Questions.totalBabySitter.toString());
      Questions.babySitterLength += 1;
      Questions.babySitterText ="BABYSITTER "+Questions.babySitterLength.toString();
    }

    else if(widget.completeQuestion == "How many au pairs did you pay for?" && widget.questionOption == "Number of au pairs")
    {
      Questions.aupairLength = 0;
      Questions.totalAupair = int.parse(calculations.text);
      print("Total AuPair"+Questions.totalAupair.toString());
      Questions.aupairLength += 1;
      Questions.aupairText ="AU PAIR "+Questions.aupairLength.toString();
    }


    else if(widget.completeQuestion == "How many different daycare centers has your child attended?" && widget.questionOption == "Number of daycare centers")
    {
      Questions.dayCareLength = 0;
      Questions.totalDayCare = int.parse(calculations.text);
      print("Total DayCare"+Questions.totalDayCare.toString());
      Questions.dayCareLength += 1;
      Questions.dayCareText ="DAYCARE CENTER "+Questions.dayCareLength.toString();
    }

    else if(widget.completeQuestion == "For how many schools did you pay tuition fees?" && widget.questionOption == "Schools attended")
    {
      Questions.schoolLength = 0;
      Questions.totalSchool = int.parse(calculations.text);
      print("Total School"+Questions.totalSchool.toString());
      Questions.schoolLength += 1;
      Questions.schoolText ="SCHOOL FEES "+Questions.schoolLength.toString();
    }

    else if(widget.completeQuestion == "Which school did your child attend?" && widget.questionOption == "Name of school")
    {
      Questions.schoolLength += 1;
      Questions.schoolText ="SCHOOL FEES "+Questions.schoolLength.toString();
    }
    else if(widget.completeQuestion == "What other benefits office is responsible for your child benefits?" && widget.questionOption == "Child benefits office")
    {
      Questions.childLength += 1;
      Questions.childText ="CHILD "+Questions.childLength.toString();
    }




    qu.FamilyAddAnswer(widget.identity, widget.bigQuestion, widget.completeQuestion, widget.questionOption, [calculations.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FamilyMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion: widget.questionOption, CheckAnswer: ["ok"]);
    }));



  }



}
