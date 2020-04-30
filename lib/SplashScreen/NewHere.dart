import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/income_flow/incomemainquestions.dart';
import 'package:easy_taxx/home_flow/homemainquestions.dart';
import 'package:easy_taxx/work_flow/workmainquestions.dart';
import 'package:easy_taxx/education_flow/educationmainquestions.dart';
import 'package:easy_taxx/family_flow/familymainquestions.dart';
import 'package:easy_taxx/health_flow/healthmainquestions.dart';

class newHere extends StatefulWidget {
  @override
  _newHereState createState() => _newHereState();
}

class _newHereState extends State<newHere> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Questions.animatedContainer = 420.0;
    Questions.incomeAnimatedContainer = 370.0;
    Questions.homeAnimatedContainer = 210.0;
    Questions.workAnimatedContainer = 220.0;
    Questions.educationAnimatedContainer = 220.0;
    Questions.familyAnimatedContainer = 220.0;
    Questions.healthAnimatedContainer = 370.0;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20.0,),
            ListTile(
              leading: Icon(Icons.arrow_back_ios,color: Colors.lightBlue,size: 15.0,),

              trailing:
                  Container(
//                    color: Colors.redAccent,
                    width: 140.0,
                    height: 30.0,
                    child: Row(
                      children: <Widget>[
                        Text('Change tax country',style: TextStyle(fontSize: 13.0,color: Colors.lightBlue),),
                        SizedBox(width: 5.0,),
                        Icon(Icons.keyboard_arrow_down,size: 20.0,color: Colors.lightBlue,),
                      ],
                    )
                  )
            ),

            Padding(
              padding: EdgeInsets.only(left: 20.0,top: 20.0),
              child:
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                    'Choose a Tax Year',style: TextStyle(fontSize: 20.0),
                )
              ],
            )),
            Padding(
                padding: EdgeInsets.only(left: 20.0),
                child:
                    Container(
                        child:
                   AutoSizeText(
                      'Haven\'t filled a tax return for anyof the past years? You can do it upto 4 years back',
                     style: TextStyle(fontSize: 20.0),
                     maxLines: 2,
                    )),
                  ),
            SizedBox(height: 30.0,),

            ListTile(
              leading: AutoSizeText(
                '2019',style: TextStyle(fontSize: 20.0),
              ),

              trailing:
                    GestureDetector(
                      onTap: (){

                        //Health Flow Start//
                        Questions.healthAnswerShow = [];
                        Questions.healthYouIdentity = "you";
                        Questions.healthYourIdentity = "your";
                        Navigator.push(context, MaterialPageRoute(builder: (context) {
                          return HealthMainQuestions(CheckCompleteQuestion:"What kind of basic health insurance did ${Questions.healthYouIdentity} have in 2019?",CheckQuestion:"Kind of health insurance",CheckAnswer:[]);
                        }));

                        //HealthFlow End





                        //Family Flow Start//

//                        Questions.familyAnswerShow = [];
//                        Questions.childLength = 0;
//                        Questions.totalChild = 0;
//                        Questions.childText = "";
//                        Questions.childFirstName = "";
//                        Questions.childrenLive = "";
//                        Questions.childrenExpense = "";
//                        Questions.childAddressLength = 0;
//                        Questions.totalChildAddress = 0;
//                        Questions.childAddressText = "";
//                        Questions.kindergartenLength = 0;
//                        Questions.totalKindergarten = 0;
//                        Questions.kindergartenText = "";
//                        Questions.childMinderLength = 0;
//                        Questions.totalChildMinder = 0;
//                        Questions.childMinderText = "";
//                        Questions.nannyLength = 0;
//                        Questions.totalNanny = 0;
//                        Questions.nannyText = "";
//                        Questions.babySitterLength = 0;
//                        Questions.totalBabySitter = 0;
//                        Questions.babySitterText = "";
//                        Questions.aupairLength = 0;
//                        Questions.totalAupair = 0;
//                        Questions.aupairText = "";
//                        Questions.dayCareLength = 0;
//                        Questions.totalDayCare = 0;
//                        Questions.dayCareText = "";
//                        Questions.schoolLength = 0;
//                        Questions.totalSchool = 0;
//                        Questions.schoolText = "";
//
//                        Navigator.push(context, MaterialPageRoute(builder: (context) {
//                          return FamilyMainQuestions(CheckCompleteQuestion:"How many children do you have?",CheckQuestion:"Number of children",CheckAnswer:[]);
//                        }));



                        //Family Flow End//




                        //Living Situation Flow Start //

//                        Questions.answerShow = [];
//                        Questions.LivingCheck = 0;
//                        Questions.livcolContainer = 0;
//                        Navigator.push(context, MaterialPageRoute(builder: (context) {
//                          return mainQuestions(CheckQuestion:"What is your official marital status in Germany?",CheckAnswer:[]);
//                        }));

                        //Living Situation Flow End //

                      },
                      child:
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0,color: Colors.lightBlue)

                  ),
                  child:
                  Padding(
                    padding: EdgeInsets.only(left: 23.0,right: 23.0,top: 18.0,bottom: 18.0),
                    child:
                    Text('Begin',style: TextStyle(color: Colors.lightBlue),),)
              ),),),

            SizedBox(height: 10.0,),
            Divider(
              thickness: 1.0,
            ),

            ListTile(
              leading: AutoSizeText(
                '2018',style: TextStyle(fontSize: 20.0),
              ),

              trailing: GestureDetector(
                onTap: (){
                  Questions.incomeAnswerShow = [];
                  Questions.totalDomain = 0;
                  Questions.domainLength = 0;
                  Questions.totalValuable = 0;
                  Questions.valuableLength = 0;
                  Questions.residence = "";
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return IncomeMainQuestions(CheckCompleteQuestion:"Have you received your annual payslip(s) (Lohnsteuerbescheinigung) for 2019?",CheckQuestion:"",CheckAnswer:[]);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0,color: Colors.lightBlue)

                  ),
                  child:
                  Padding(
                    padding: EdgeInsets.only(left: 23.0,right: 23.0,top: 18.0,bottom: 18.0),
                    child:
                    Text('Begin',style: TextStyle(color: Colors.lightBlue),),)
              ),),
            ),
            SizedBox(height: 10.0,),
            Divider(
              thickness: 1.0,
            ),

            ListTile(
              leading: AutoSizeText(
                '2017',style: TextStyle(fontSize: 20.0),
              ),

              trailing: GestureDetector(
                onTap: (){
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return HomeMainQuestions(CheckCompleteQuestion:"What is your current address?",CheckQuestion:"Current address",CheckAnswer:[]);
                  }));
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(width: 1.0,color: Colors.lightBlue)

                  ),
                  child:
                  Padding(
                    padding: EdgeInsets.only(left: 23.0,right: 23.0,top: 18.0,bottom: 18.0),
                    child:
                    Text('Begin',style: TextStyle(color: Colors.lightBlue),),)
              ),)
            ),
            SizedBox(height: 10.0,),
            Divider(
              thickness: 1.0,
            ),

            ListTile(
                leading: AutoSizeText(
                  '2016',style: TextStyle(fontSize: 20.0),
                ),

                trailing: GestureDetector(
                  onTap: (){
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return EducationMainQuestions(CheckCompleteQuestion:"Did you complete any degrees or professional qualifications before 2019?",CheckQuestion:"Degree before 2019",CheckAnswer:[]);
                    }));
                  },
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(width: 1.0,color: Colors.lightBlue)

                      ),
                      child:
                      Padding(
                        padding: EdgeInsets.only(left: 23.0,right: 23.0,top: 18.0,bottom: 18.0),
                        child:
                        Text('Begin',style: TextStyle(color: Colors.lightBlue),),)
                  ),)
            ),
            SizedBox(height: 10.0,),
            Divider(
              thickness: 1.0,
            ),

            ListTile(
              leading:


              Container(
                width: 250.0,
//                color: Colors.red,
                child: Row(
                  children: <Widget>[
                    AutoSizeText(
                      '2015',style: TextStyle(fontSize: 20.0,color: Colors.grey),
                    ),
                    SizedBox(width: 10.0,),
                    AutoSizeText(
                      'Deadline Expired',style: TextStyle(fontSize: 20.0,color: Colors.grey),
                    ),

                  ],
                )
              )



            ),


          ],
        )
      ),
    );
  }
}
