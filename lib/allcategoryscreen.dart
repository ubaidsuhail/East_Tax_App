import 'package:flutter/material.dart';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/income_flow/incomemainquestions.dart';
import 'package:easy_taxx/home_flow/homemainquestions.dart';
import 'package:easy_taxx/education_flow/educationmainquestions.dart';
import 'package:easy_taxx/family_flow/familymainquestions.dart';
import 'package:easy_taxx/health_flow/healthmainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/finance_flow/financemainquestions.dart';
import 'package:easy_taxx/work_flow/workmainquestions.dart';
import 'package:easy_taxx/categoryfinishedscreens/totaltaxamount.dart';

class AllCategoryScreen extends StatefulWidget {
  @override
  _AllCategoryScreenState createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body:SingleChildScrollView(
        child:Column(
              children: <Widget>[
                SizedBox(
                  height:35.0,
                ),

                ListTile(
                  leading:GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                  child:Icon(
                    Icons.arrow_back_ios,
                    color: Colors.lightBlue,
                    size: 22.0,

                  )),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      GestureDetector(
                       onTap: (){
                       },
                     child: Image(image: AssetImage("images/allcategoryuser.png"),width: 22.0,height: 22.0,)
                      )
              ],
                  ),
                  trailing: Image(image: AssetImage("images/allcategoryinbox.png"),width: 25.0,height: 25.0,)
                ),


                Container(
                  height: 60.0,
                  color: Colors.lightBlue,

                  child: ListTile(

                      title: Container(child:Text("You have not verified your email address yet.",style: TextStyle(color: Colors.white,fontSize: 13.0),)),
                      trailing: Text("Resend Email",style: TextStyle(fontSize: 15.0),)
                  ),

                ),


                ListTile(
                  title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),



                Divider(
                  height: 6.0,
                  thickness: 2.0,
                ),

                Container(
                  height: MediaQuery.of(context).size.height*0.61,

                child:SingleChildScrollView(
                child:Column(
                  children: <Widget>[
                GestureDetector(
                  onTap:() {
                    LivingSituation();
                  },
                child:Container(
                    padding: EdgeInsets.only(top:26.0,bottom: 26.0,left: 16.0,right: 16.0),
                color:Colors.white,
                child:Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width*0.75,

                      child: Row(
                        children: <Widget>[
                          Questions.categoryImageChange[0] == 1 ? Image(image:AssetImage("images/colorlivingsituation.png")) :Image(image:AssetImage("images/uncolorlivingsituation.png")) ,
                          Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Text("Living Situation",style: TextStyle(fontSize: 15.0),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.15,

                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[

                          Padding(
                            padding:EdgeInsets.only(right: 5.0),
                           child: Questions.categoryFinish[0] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.grey,
                            size: 16.0,
                          ),
                        ],
                      ),
                    )
                  ],
                )

                )
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),






                GestureDetector(
                  onTap: (){
                    Income();
                  },
                child:Container(
                    padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                    color:Colors.white,
                    child:Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: Row(
                            children: <Widget>[
                              Questions.categoryImageChange[1] == 1 ? Image(image:AssetImage("images/colorincome.png")) :Image(image:AssetImage("images/uncolorincome.png")) ,
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text("Income",style: TextStyle(fontSize: 15.0),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.15,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Padding(
                                padding:EdgeInsets.only(right: 5.0),
                                child: Questions.categoryFinish[1] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                )

                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),



               GestureDetector(
                 onTap: (){
                   Home();
                 },
                child:Container(
                    padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                    color:Colors.white,
                    child:Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: Row(
                            children: <Widget>[
                              Questions.categoryImageChange[2] == 1 ? Image(image:AssetImage("images/colorhome.png")) :Image(image:AssetImage("images/uncolorhome.png")) ,
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text("Home",style: TextStyle(fontSize: 15.0),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.15,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Padding(
                                padding:EdgeInsets.only(right: 5.0),
                                child: Questions.categoryFinish[2] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                )
               ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),




                GestureDetector(
                  onTap: (){
                    Work();
                  },
                child:Container(
                    padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                    color:Colors.white,
                    child:Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: Row(
                            children: <Widget>[
                              Questions.categoryImageChange[3] == 1 ? Image(image:AssetImage("images/colorwork.png")) :Image(image:AssetImage("images/uncolorwork.png")) ,
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text("Work",style: TextStyle(fontSize: 15.0),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.15,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Padding(
                                padding:EdgeInsets.only(right: 5.0),
                                child: Questions.categoryFinish[3] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                )
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),




                GestureDetector(
                  onTap: (){
                    Education();
                  },
                child:Container(
                    padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                    color:Colors.white,
                    child:Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: Row(
                            children: <Widget>[
                              Questions.categoryImageChange[4] == 1 ? Image(image:AssetImage("images/coloreducation.png")) :Image(image:AssetImage("images/uncoloreducation.png")) ,
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text("Education",style: TextStyle(fontSize: 15.0),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.15,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Padding(
                                padding:EdgeInsets.only(right: 5.0),
                                child: Questions.categoryFinish[4] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                )
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),


                GestureDetector(
                    onTap: (){
                      Family();
                    },
                    child:Container(
                        padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                        color:Colors.white,
                        child:Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width*0.75,

                              child: Row(
                                children: <Widget>[
                                  Questions.categoryImageChange[5] == 1 ? Image(image:AssetImage("images/colorfamily.png")) :Image(image:AssetImage("images/uncolorfamily.png")) ,
                                  Padding(
                                    padding: EdgeInsets.only(left: 12.0),
                                    child: Text("Family",style: TextStyle(fontSize: 15.0),),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.15,

                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[

                                  Padding(
                                    padding:EdgeInsets.only(right: 5.0),
                                    child: Questions.categoryFinish[5] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                                  ),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                    size: 16.0,
                                  ),
                                ],
                              ),
                            )
                          ],
                        )

                    )

                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),




                GestureDetector(
                  onTap: (){
                    Health();
                  },
                child:Container(
                    padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                    color:Colors.white,
                    child:Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: Row(
                            children: <Widget>[
                              Questions.categoryImageChange[6] == 1 ? Image(image:AssetImage("images/colorhealth.png")) :Image(image:AssetImage("images/uncolorhealth.png")) ,
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text("Health",style: TextStyle(fontSize: 15.0),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.15,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Padding(
                                padding:EdgeInsets.only(right: 5.0),
                                child: Questions.categoryFinish[6] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                )
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),



                GestureDetector(
                  onTap: (){
                    Finance();
                  },
                child:Container(
                    padding: EdgeInsets.only(top:22.0,bottom: 22.0,left: 16.0,right: 16.0),
                    color:Colors.white,
                    child:Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width*0.75,

                          child: Row(
                            children: <Widget>[
                              Questions.categoryImageChange[7] == 1 ? Image(image:AssetImage("images/colorfinance.png")) :Image(image:AssetImage("images/uncolorfinance.png")) ,
                              Padding(
                                padding: EdgeInsets.only(left: 12.0),
                                child: Text("Finances",style: TextStyle(fontSize: 15.0),),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.15,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[

                              Padding(
                                padding:EdgeInsets.only(right: 5.0),
                                child: Questions.categoryFinish[7] == 1 ? Image(image:AssetImage("images/righttick.png")) : Text(""),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: Colors.grey,
                                size: 16.0,
                              ),
                            ],
                          ),
                        )
                      ],
                    )

                )
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),
]))),
                SizedBox(
                  height: 1.5,
                ),


                Container(
                  height: 1.0,
                  decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(5.0),
                color: Colors.grey[300],

                  ),
                ),


                 Container(
                   margin: EdgeInsets.only(top: 10.0,left: 14.0),
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: <Widget>[
                       Row(
                         children: <Widget>[
                           Questions.afterAllCategoryFinish == true ?
                               Text("")
                           :
                           Image(image:AssetImage(Questions.categoryImage)),

                           Padding(
                               padding: EdgeInsets.only(left: 10.0),
                               child:Column(
                                 children: <Widget>[
                                   Questions.afterAllCategoryFinish == true ?
                                 Text("Loss carryforward",style: TextStyle(fontSize: 11.0),)
                                       :Text("Next",style: TextStyle(fontSize: 11.0),),
                                   Text(Questions.categoryName,style: TextStyle(fontWeight: FontWeight.bold),),
                                 ],
                               )),

                         ],
                       ),

                         GestureDetector(
                           onTap: (){
                             Continue();
                           },
                         child:Container(
                          margin: EdgeInsets.only(right: 10.0),
                            width: MediaQuery.of(context).size.width*0.25,
                            height: MediaQuery.of(context).size.height / 16,
                            decoration: BoxDecoration(
                             color: Colors.lightBlueAccent,
                             border: Border.all(
                               color: Colors.lightBlueAccent, //                   <--- border color
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(6.0),
                           ),
                            child:Center(
                              child:Text(Questions.afterAllCategoryFinish == true ? "see result":"Continue",style: TextStyle(fontSize: 14.0,color: Colors.white,),),
                            ))),


                     ],
                   )
                 )

//                Container(
//
//                  color: Colors.white,
//                  child:ListTile(
//
//                    leading: Container(width:MediaQuery.of(context).size.width*0.3,child:Text("Add income to see your result",style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.bold),)),
//
//
//                    trailing:  GestureDetector(
//                        onTap: (){
//                          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Photo()));
//                        },
//                        child:Container(
//                          //margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3),
//                            width: MediaQuery.of(context).size.width*0.25,
//                            height: 35.0,
//                            decoration: BoxDecoration(
//                              color: Colors.lightBlueAccent,
//                              border: Border.all(
//                                color: Colors.lightBlueAccent, //                   <--- border color
//                                width: 1.0,
//                              ),
//                              borderRadius: BorderRadius.circular(4.0),
//                            ),
//                            child:Center(
//                              child:Text("Continue",style: TextStyle(fontSize: 14.0,color: Colors.white,),),
//                            ))),
//
//                  ),
//                )






              ],
            )
        ));
  }

  void LivingSituation()
  {
    Questions.categoryName ="Income";
    Questions.categoryImage = "images/uncolorincome.png";
    Questions.categoryImageChange[0] = 1;

    if(Questions.answerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mainQuestions(CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return mainQuestions(CheckQuestion : Questions.answerShow[Questions.answerShow.length-1]['question'],CheckAnswer : [Questions.answerShow[Questions.answerShow.length-1]['answer'][0]]);
      }));
    }
  }

  void Income()
  {

    Questions.categoryName ="Home";
    Questions.categoryImage = "images/uncolorhome.png";
    Questions.categoryImageChange[1] = 1;

    if(Questions.incomeAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return IncomeMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return IncomeMainQuestions(CheckCompleteQuestion : Questions.incomeAnswerShow[Questions.incomeAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.incomeAnswerShow[Questions.incomeAnswerShow.length-1]['question'],CheckAnswer : [Questions.incomeAnswerShow[Questions.incomeAnswerShow.length-1]['answer'][0]]);
      }));
    }

  }

  void Home()
  {

    Questions.categoryName ="Education";
    Questions.categoryImage = "images/uncoloreducation.png";
    Questions.categoryImageChange[2] = 1;



    if(Questions.homeAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeMainQuestions(CheckCompleteQuestion : Questions.homeAnswerShow[Questions.homeAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.homeAnswerShow[Questions.homeAnswerShow.length-1]['question'],CheckAnswer : [Questions.homeAnswerShow[Questions.homeAnswerShow.length-1]['answer'][0]]);
      }));
    }
  }

  void Work()
  {
    Questions.categoryImageChange[3] = 1;



    if(Questions.workAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WorkMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return WorkMainQuestions(CheckCompleteQuestion : Questions.workAnswerShow[Questions.workAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.workAnswerShow[Questions.workAnswerShow.length-1]['question'],CheckAnswer : [Questions.workAnswerShow[Questions.workAnswerShow.length-1]['answer'][0]]);
      }));
    }
  }

  void Education()
  {

    Questions.categoryName ="Family";
    Questions.categoryImage = "images/uncolorfamily.png";
    Questions.categoryImageChange[4] = 1;


    if(Questions.educationAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EducationMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EducationMainQuestions(CheckCompleteQuestion : Questions.educationAnswerShow[Questions.educationAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.educationAnswerShow[Questions.educationAnswerShow.length-1]['question'],CheckAnswer : [Questions.educationAnswerShow[Questions.educationAnswerShow.length-1]['answer'][0]]);
      }));
    }
  }


  void Family()
  {

    Questions.categoryName ="Health";
    Questions.categoryImage = "images/uncolorhealth.png";
    Questions.categoryImageChange[5] = 1;


    if(Questions.familyAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FamilyMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FamilyMainQuestions(CheckCompleteQuestion : Questions.familyAnswerShow[Questions.familyAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.familyAnswerShow[Questions.familyAnswerShow.length-1]['question'],CheckAnswer : [Questions.familyAnswerShow[Questions.familyAnswerShow.length-1]['answer'][0]]);
      }));
    }
  }

  void Health()
  {

    Questions.categoryName ="Finances";
    Questions.categoryImage = "images/uncolorfinance.png";
    Questions.categoryImageChange[6] = 1;


    if(Questions.healthAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HealthMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HealthMainQuestions(CheckCompleteQuestion : Questions.healthAnswerShow[Questions.healthAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.healthAnswerShow[Questions.healthAnswerShow.length-1]['question'],CheckAnswer : [Questions.healthAnswerShow[Questions.healthAnswerShow.length-1]['answer'][0]]);
      }));
    }
  }

  void Finance()
  {
    Questions.categoryName ="Finances";
    Questions.categoryImage = "images/uncolorfinance.png";
    Questions.categoryImageChange[7] = 1;


    if(Questions.financeAnswerShow.length == 0)
    {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FinanceMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else {

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FinanceMainQuestions(CheckCompleteQuestion : Questions.financeAnswerShow[Questions.financeAnswerShow.length-1]['completequestion'],CheckQuestion : Questions.financeAnswerShow[Questions.financeAnswerShow.length-1]['question'],CheckAnswer : [Questions.financeAnswerShow[Questions.financeAnswerShow.length-1]['answer'][0]]);
      }));
    }
  }


  void Continue()
  {
    if(Questions.categoryName == "Income")
      {
        Questions.categoryImageChange[1] = 1;

        Navigator.of(context).pop();
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return IncomeMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
        }));
      }
    else if(Questions.categoryName == "Home")
    {
      Questions.categoryImageChange[2] = 1;

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HomeMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }
    else if(Questions.categoryName == "Education")
    {
      Questions.categoryImageChange[4] = 1;

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return EducationMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }
    else if(Questions.categoryName == "Family")
    {
      Questions.categoryImageChange[5] = 1;

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FamilyMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }
    else if(Questions.categoryName == "Health")
    {
      Questions.categoryImageChange[6] = 1;

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return HealthMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }
    else if(Questions.categoryName == "Finances")
    {
      Questions.categoryImageChange[7] = 1;

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FinanceMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
      }));
    }

    else if(Questions.categoryName == "574.663,00€")
    {

      Navigator.pop(context);
      Navigator.push(context, MaterialPageRoute(builder: (context)=>TotalTaxAmount()));
    }

  }
}
