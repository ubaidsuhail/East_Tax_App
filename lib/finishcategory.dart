import 'package:easy_taxx/show.dart';
import 'package:easy_taxx/training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/income_flow/incomemainquestions.dart';
import 'package:easy_taxx/home_flow/homemainquestions.dart';
import 'package:easy_taxx/education_flow/educationmainquestions.dart';
import 'package:easy_taxx/family_flow/familymainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:responsive_container/responsive_container.dart';
//void main() => runApp(MaterialApp(home:HomeScreen()));

class FinishCategory extends StatefulWidget {

  String currentCategory="";
  String nextCategory="";
  FinishCategory(this.currentCategory,this.nextCategory);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FinishCategory> {

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
    double maxHeight = 210.0;
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
//                            onTap: () => setState(() => open = !open),
              child:
              Column(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color:Colors.lightBlue,
                    ),
                    height: 140.0,
                    width: 450.0,

                    child: Padding(padding: EdgeInsets.only(left: 20.0,top: 45.0),
                      child: Text("Congratulations! You have finished " + widget.currentCategory + ".Now You can move to "+ widget.nextCategory,style: TextStyle(fontSize:20.0,color: Colors.white),),),



                  ),

                  RaisedButton(onPressed: (){
                    Continue();
                    },
                    child:Text("Continue next category"),
                  )
                ],
              ),

            ))



    );


  }

  void Continue()
  {
     if(widget.currentCategory == "Living Situation Category")
       {
         Questions.incomeAnswerShow = [];
         Questions.totalDomain = 0;
         Questions.domainLength = 0;
         Questions.totalValuable = 0;
         Questions.valuableLength = 0;
         Questions.residence = "";
         Navigator.pop(context);
         Navigator.push(context, MaterialPageRoute(builder: (context) {
           return IncomeMainQuestions(CheckCompleteQuestion:"Have you received your annual payslip(s) (Lohnsteuerbescheinigung) for 2019?",CheckQuestion:"",CheckAnswer:[]);
         }));
       }

     else if(widget.currentCategory == "Income Category")
     {
       Questions.homeAnswerShow = [];
       Questions.utilityBillLength = 0;
       Questions.totalUtilityBill = 0;
       Questions.WEGLength = 0;
       Questions.totalWEG = 0;
       Questions.modeOfTransport = "";
       Questions.Appliance= "";
       Questions.otherFixture = "";
       Questions.totalSecondHouseHold = 0;
       Questions.secondHouseHoldLength = 0;
       Questions.secondHouseHoldText = "";
       Questions.totalRelocation = 0;
       Questions.relocationLength = 0;
       Questions.relocationText = "";
       Questions.totalCraftsmen = 0;
       Questions.craftsmenLength = 0;
       Questions.craftsmenText = "";

       Navigator.pop(context);
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return HomeMainQuestions(CheckCompleteQuestion:"What is your current address?",CheckQuestion:"Current address",CheckAnswer:[]);
       }));
     }

     else if(widget.currentCategory == "Home Category")
     {
       Questions.educationAnswerShow = [];
       Questions.educationOtherCosts = "";
       Questions.trainingLength = 1;
       Questions.totalTraining = 0;
       Questions.trainingText = "TRAINING ${Questions.trainingLength}";
       Questions.schoolRouteLength = 0;
       Questions.totalSchoolRoute = 0;
       Questions.schoolRouteText = "";
       Questions.libraryRouteLength = 0;
       Questions.totalLibraryRoute = 0;
       Questions.libraryRouteText = "";
       Questions.unpaidInternLength = 0;
       Questions.totalUnpaidIntern = 0;
       Questions.unpaidInternText = "";
       Questions.excursionLength = 0;
       Questions.totalExcursion = 0;
       Questions.excursionText = "";
       Questions.semesterLength = 0;
       Questions.totalSemester = 0;
       Questions.semesterText = "";
       Questions.educationTraItem  = "";
       Questions.educationExpfurniture = "EXPENSIVE FURNITURE";
       Questions.educationOtherFurniture = "";
       Questions.equipmentLength = 0;
       Questions.totalEquipment = 0;
       Questions.equipmentText = "";
       Questions.equipmentName = "";
       Navigator.pop(context);
       Navigator.push(context, MaterialPageRoute(builder: (context) {
         return EducationMainQuestions(CheckCompleteQuestion:"Did you complete any degrees or professional qualifications before 2019?",CheckQuestion:"Degree before 2019",CheckAnswer:[]);
       }));
     }

     else if(widget.currentCategory == "Education Category")
     {
                        Questions.familyAnswerShow = [];
                        Questions.childLength = 0;
                        Questions.totalChild = 0;
                        Questions.childText = "";
                        Questions.childFirstName = "";
                        Questions.childrenLive = "";
                        Questions.childrenExpense = "";
                        Questions.childAddressLength = 0;
                        Questions.totalChildAddress = 0;
                        Questions.childAddressText = "";
                        Questions.kindergartenLength = 0;
                        Questions.totalKindergarten = 0;
                        Questions.kindergartenText = "";
                        Questions.childMinderLength = 0;
                        Questions.totalChildMinder = 0;
                        Questions.childMinderText = "";
                        Questions.nannyLength = 0;
                        Questions.totalNanny = 0;
                        Questions.nannyText = "";
                        Questions.babySitterLength = 0;
                        Questions.totalBabySitter = 0;
                        Questions.babySitterText = "";
                        Questions.aupairLength = 0;
                        Questions.totalAupair = 0;
                        Questions.aupairText = "";
                        Questions.dayCareLength = 0;
                        Questions.totalDayCare = 0;
                        Questions.dayCareText = "";
                        Questions.schoolLength = 0;
                        Questions.totalSchool = 0;
                        Questions.schoolText = "";

                        Navigator.pop(context);
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return FamilyMainQuestions(CheckCompleteQuestion:"How many children do you have?",CheckQuestion:"Number of children",CheckAnswer:[]);
                        }));

     }
  }
}