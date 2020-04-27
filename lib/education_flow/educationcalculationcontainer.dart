import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/education_flow/educationmainquestions.dart';

class EducationCalculationContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;


  EducationCalculationContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _EducationCalculationContainerState createState() => _EducationCalculationContainerState();
}

class _EducationCalculationContainerState extends State<EducationCalculationContainer> {
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
                                width: MediaQuery.of(context).size.width*0.15,
                                child:GestureDetector(
                                  onTap: (){
                                    AddData();
                                  },
                                  child: Text("Confirm",style: TextStyle(color: Colors.blueAccent)),
                                ),)
                            ],
                          ))),

                ],
              ),

            )));

  }


  void AddData()
  {

 if(widget.completeQuestion == "How many different trainings did you participate in during 2019?" && widget.questionOption == "Number of training courses")
  {
  Questions.totalTraining = int.parse(calculations.text);
  print("Total Training:"+Questions.totalTraining.toString());
  }

 else if(widget.completeQuestion == "How much money was reimbursed?" && widget.questionOption == "Reimbursed")
    {
      Questions.trainingLength += 1;
      Questions.trainingText ="TRAINING "+Questions.trainingLength.toString();
    }


  else if(widget.completeQuestion == "What kind of costs did you have?" && widget.questionOption == "Kind of costs")
    {
      Questions.educationOtherCosts = calculations.text.toString();

    }

    else if(widget.completeQuestion == "How many different routes to school/university did you use?" && widget.questionOption == "Number of routes")
    {
      Questions.totalSchoolRoute = int.parse(calculations.text);
      print("Total School Route:"+Questions.totalSchoolRoute.toString());
      Questions.schoolRouteLength += 1;
      Questions.schoolRouteText ="ROUTE "+Questions.schoolRouteLength.toString();
    }

    else if(widget.completeQuestion == "How much have you spent on travels to training?" && widget.questionOption == "Travel costs")
    {
      Questions.schoolRouteLength += 1;
      Questions.schoolRouteText ="ROUTE "+Questions.schoolRouteLength.toString();
    }

    else if(widget.completeQuestion == "How many different routes did you use to travel to libraries outside your campus?" && widget.questionOption == "Number of routes")
    {
      Questions.totalLibraryRoute = int.parse(calculations.text);
      print("Total School Route:"+Questions.totalLibraryRoute.toString());
      Questions.libraryRouteLength += 1;
      Questions.libraryRouteText ="ROUTE "+Questions.libraryRouteLength.toString();
    }

    else if(widget.completeQuestion == "How often did you use the route no. ${Questions.libraryRouteLength} to the library?" && widget.questionOption == "Number of drives")
    {
      Questions.libraryRouteLength += 1;
      Questions.libraryRouteText ="ROUTE "+Questions.libraryRouteLength.toString();
    }
    else if(widget.completeQuestion == "How much did you spend in total?" && widget.questionOption == "Actual costs")
    {
      Questions.libraryRouteLength += 1;
      Questions.libraryRouteText ="ROUTE "+Questions.libraryRouteLength.toString();
    }
 else if(widget.completeQuestion == "How many different routes did you use for travels to learning communities?" && widget.questionOption == "Number of routes")
 {
   Questions.totalLearningRoute = int.parse(calculations.text);
   print("Total Learning Route:"+Questions.totalLearningRoute.toString());
   Questions.learningRouteLength += 1;
   Questions.learningRouteText ="ROUTE "+Questions.learningRouteLength.toString();
 }

 else if(widget.completeQuestion == "How often did you use the route no. ${Questions.learningRouteLength}?" && widget.questionOption == "Number of drives")
 {
   Questions.learningRouteLength += 1;
   Questions.learningRouteText ="ROUTE "+Questions.learningRouteLength.toString();
 }

 else if(widget.completeQuestion == "How much did you spend in total for the route no. ${Questions.learningRouteLength}?" && widget.questionOption == "Actual costs")
 {
   Questions.learningRouteLength += 1;
   Questions.learningRouteText ="ROUTE "+Questions.learningRouteLength.toString();
 }
 else if(widget.completeQuestion == "How many unpaid internships did you participate in?" && widget.questionOption == "Number of internships")
 {
   Questions.totalUnpaidIntern = int.parse(calculations.text);
   print("Total Unpiad Internships:"+Questions.totalUnpaidIntern.toString());
   Questions.unpaidInternLength += 1;
   Questions.unpaidInternText ="UNPAID INTERNSHIP "+Questions.unpaidInternLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary breakfast?" && widget.questionOption == "Number of breakfast" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
 {
   Questions.unpaidInternLength += 1;
   Questions.unpaidInternText ="UNPAID INTERNSHIP "+Questions.unpaidInternLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary lunch?" && widget.questionOption == "Number of lunch" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
 {
   Questions.unpaidInternLength += 1;
   Questions.unpaidInternText ="UNPAID INTERNSHIP "+Questions.unpaidInternLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary dinner?" && widget.questionOption == "Number of dinner" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
 {
   Questions.unpaidInternLength += 1;
   Questions.unpaidInternText ="UNPAID INTERNSHIP "+Questions.unpaidInternLength.toString();
 }

 else if(widget.completeQuestion == "To how many excursions did you go?" && widget.questionOption == "Number of excursions")
 {
   Questions.totalExcursion = int.parse(calculations.text);
   print("Total Excursion:"+Questions.totalExcursion.toString());
   Questions.excursionLength += 1;
   Questions.excursionText ="EXCURSION "+Questions.excursionLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary breakfast?" && widget.questionOption == "Number of breakfast" && Questions.excursionText.contains("EXCURSION"))
 {
   Questions.excursionLength += 1;
   Questions.excursionText ="EXCURSION "+Questions.excursionLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary lunch?" && widget.questionOption == "Number of lunch" && Questions.excursionText.contains("EXCURSION"))
 {
   Questions.excursionLength += 1;
   Questions.excursionText ="EXCURSION "+Questions.excursionLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary dinner?" && widget.questionOption == "Number of dinner" && Questions.excursionText.contains("EXCURSION"))
 {
   Questions.excursionLength += 1;
   Questions.excursionText ="EXCURSION "+Questions.excursionLength.toString();
 }
 else if(widget.completeQuestion == "To how many semester abroad did you go?" && widget.questionOption == "Number of semester abroad")
 {
   Questions.totalSemester = int.parse(calculations.text);
   print("Total Semester:"+Questions.totalSemester.toString());
   Questions.semesterLength += 1;
   Questions.semesterText ="SEMESTER ABROAD "+Questions.semesterLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary breakfast?" && widget.questionOption == "Number of breakfast" && Questions.semesterText.contains("SEMESTER ABROAD"))
 {
   Questions.semesterLength += 1;
   Questions.semesterText ="SEMESTER ABROAD "+Questions.semesterLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary lunch?" && widget.questionOption == "Number of lunch" && Questions.semesterText.contains("SEMESTER ABROAD"))
 {
   Questions.semesterLength += 1;
   Questions.semesterText ="SEMESTER ABROAD "+Questions.semesterLength.toString();
 }

 else if(widget.completeQuestion == "How often did you receive complimentary dinner?" && widget.questionOption == "Number of dinner" && Questions.semesterText.contains("SEMESTER ABROAD"))
 {
   Questions.semesterLength += 1;
   Questions.semesterText ="SEMESTER ABROAD "+Questions.semesterLength.toString();
 }

 else if(widget.completeQuestion == "What kind of items did you buy?" && widget.questionOption == "Items")
 {
   Questions.educationTraItem = calculations.text;

 }

 else if(widget.completeQuestion == "How many pieces of furnitures cost more than 488 EUR?" && widget.questionOption == "Number")
 {
   Questions.totalExpFurniture = int.parse(calculations.text);
   print("Total Expensive Furniture:"+Questions.totalExpFurniture.toString());
   Questions.expFurnitureLength += 1;

 }
 else if(widget.completeQuestion == "What kind of  furniture did you buy?" && widget.questionOption == "Type")
 {
   Questions.educationOtherFurniture = calculations.text;

 }
 else if(widget.completeQuestion == "How much other valuable items for training did you buy in previous years?" && widget.questionOption == "Quantity")
 {
   Questions.totalEquipment = int.parse(calculations.text);
   print("Total Equipment:"+Questions.totalEquipment.toString());
   Questions.equipmentLength += 1;
   Questions.equipmentText ="EQUIPMENT "+Questions.equipmentLength.toString();
 }
 else if(widget.completeQuestion == "What items did you purchase for your training?" && widget.questionOption == "Items")
 {
   Questions.equipmentName = calculations.text;

 }

 else if(widget.completeQuestion == "What can you depreciate for item ${Questions.equipmentName} in 2019?" && widget.questionOption == "Amount")
 {
   Questions.equipmentLength += 1;
   Questions.equipmentText ="EQUIPMENT "+Questions.equipmentLength.toString();
 }





 qu.EducationAddAnswer(widget.identity, widget.bigQuestion, widget.completeQuestion, widget.questionOption, [calculations.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return EducationMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion: widget.questionOption, CheckAnswer: ["ok"]);
    }));



  }



}
