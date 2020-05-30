//import 'package:easy_taxx/questions.dart';
import 'package:easy_taxx/show.dart';
import 'package:easy_taxx/livingsituation_flow/container1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/livingsituation_flow/container2.dart';
import 'package:easy_taxx/livingsituation_flow/container3.dart';
import 'package:easy_taxx/livingsituation_flow/container4.dart';
import 'package:easy_taxx/livingsituation_flow/container5.dart';
import 'package:easy_taxx/livingsituation_flow/container6.dart';
import 'package:easy_taxx/livingsituation_flow/container7.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:easy_taxx/livingsituation_flow/unsupportedscreen.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:auto_size_text/auto_size_text.dart';

//void main() => runApp(MaterialApp(home:HomeScreen()));

class mainQuestions extends StatefulWidget {
  String CheckQuestion;
  List CheckAnswer;

  mainQuestions({Key key,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<mainQuestions> {
  Questions qu =Questions();
  var dynamicContainer = List<Widget>();
  var dynamicContainerbig = List<Widget>();
bool detail =true;
String detailOption;
double screenHeight = 0.0;
double screenHeightbig = 0.0;
List screenHeightbiglist = [];
String detailsHeight;
int countLongContainer = 0;
int i,j=0,l=0,co;
int k=0;
int heightcount = 0;
List heightList = [];
List screenheightList = [];
int hlength=0;
bool a= false;
int specificIndex = -1;


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
    //timer();
    Screenheight();
    DynamicContainer();
  }

  void Screenheight()
  {
    print("question length:"+Questions.answerShow.length.toString());

    for(k=l;k<Questions.answerShow.length;k++)
    {
      print("how manysdsdsd");
      screenHeightbig  = 0.0;
      if(Questions.answerShow[k]['identity'] == "You" || Questions.answerShow[k]['identity'] == "You & Partner" || Questions.answerShow[k]['identity'] == "Partner")
        {
          screenHeight = screenHeight +70.0;
        }
      else if(Questions.answerShow[k]['details'] == "")
      {
        screenHeight = screenHeight +60.0;
        detail= true;
      }
      else{
        detailsHeight = Questions.answerShow[k]['details'];

        for(l=k;l<Questions.answerShow.length;l++)
          {
            if(Questions.answerShow[l]['details'] == detailsHeight)
              {
                print("height");
                heightcount ++;
              }
              else
                {
                  //k = l-1;
                  break;
                }

          }

        k = l-1;

          print("height screen is:"+heightcount.toString());
          heightList.add(heightcount);
          print("height list:"+heightList.toString());
        heightcount =0;
        screenheightList = [];
        for(int he = 0;he < heightList.length; he++)
          {
            screenheightList.add((heightList[he]*60.0) + 60.0 +2);

          }

        print(screenheightList.toString());
//        for(int h=0;h<screenheightList.length;h++)
//          {
//            screenHeightbig = screenheightList[h] + 5.0;
//          }

        //calculate screen height according to new big container
      screenHeight = screenHeight + screenheightList[screenheightList.length - 1] +5.0;




      }
      print("k:"+k.toString()+"l:"+l.toString());
    }
    //screenHeightbig = screenHeightbig +2;
    screenHeight = screenHeight + Questions.animatedContainer;
   // screenHeight = screenHeight;
    print("Screen Height:"+screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;





  }


  void DynamicContainer(){
    hlength=0;
   // print("question length:"+Questions.answerShow.length.toString());
    for (i=j;i<Questions.answerShow.length;i++) {
      print("value oif i is:"+i.toString());


      print("dat is:"+i.toString());
      //You and your and your partner identity
      if(Questions.answerShow[i]['identity'] == "You" || Questions.answerShow[i]['identity'] == "You & Partner" || Questions.answerShow[i]['identity'] == "Partner")
        {
          dynamicContainer.add(
              Container(
                margin: EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
                height: Questions.answerShow[i]['containerheight'],
                width: 450.0,
                child:Text(Questions.answerShow[i]['identity'],style: TextStyle(fontSize: 40.0)) ,
              )
          );
        }
     else if(Questions.answerShow[i]['details'] == "") {
       //specificIndex++;
        dynamicContainer.add(
         SingleSmallContainer(currentIndex : i)
//            Container(
//              margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
//              height: Questions.answerShow[i]['containerheight'],
//              width: 450.0,
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(7.0),
//                  border: Border.all(width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
//              ),
//              child: Padding(
//                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      //Text(Questions.answerShow[i]['question']),
//                      Container(
//                          width: 155.0,
//                          //color: Colors.purple,
//                          child:AutoSizeText(Questions.answerShow[i]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                      ),
//                      Row(children: <Widget>[
//                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                        Container(
//                            width: 140.0,
//                            // color:Colors.blue,
//                            child:AutoSizeText(Questions.answerShow[i]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)
//
//                        ),
//                        SizedBox(width: 5.0,),
//                        Icon(Icons.arrow_forward_ios, size: 12.0,
//                          color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF))
//                      ],)
//                    ],
//                  )),
//            )
        );
      }

      //data that contains long container
      else
        {
          detailOption = Questions.answerShow[i]['details'];
          print(detailOption);
          countLongContainer = 0;
//print("ahsjasjasksss");

          //set length of data in details that how much data comes
          for(co = i ; co < Questions.answerShow.length; co++)
            {
              if(Questions.answerShow[co]['details'] == detailOption) {
                countLongContainer++;
                //print("data after container");

              }
              else
                {
                  break;
                }
            }

          countLongContainer = countLongContainer+i;
            //print("count long container:"+countLongContainer.toString()+" "+i.toString());

          for(j=i;j<countLongContainer;j++) {
//print("4<5");
            if(Questions.answerShow[j]['details'] == detailOption && detail == true) {

              dynamicContainerbig.add(
                Container(
                    height: 55.0,
                    width: 450.0,
                    color: Colors.white,
                    child: Padding(
                        padding: EdgeInsets.only(left: 10.0, right: 15.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //Text(Questions.answerShow[i]['question']),
                            Text(Questions.answerShow[i]['details'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                            Row(children: <Widget>[
                              //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                              Text(""),
                              SizedBox(width: 10.0,),
                            ],)
                          ],))),

              );

              dynamicContainerbig.add(
                  Padding(
                    padding: EdgeInsets.only(left: 20.0),
                child:Container(
                  margin: EdgeInsets.only(top:2.0,bottom:2.0),
                  height: 1.0,
                  color: Colors.grey[200],

              )));
              //so that details data not come again and again
              detail = false;
            }
            // after details data
            if(Questions.answerShow[j]['details'] == detailOption && detail == false)
              {
                //specificIndex++;
                dynamicContainerbig.add(
                    MultipleBigContainer(currentIndex : j)
//                    Container(
//                    color: Colors.white,
//                      height: 55.0,
//                      width: 450.0,
//                      child: Padding(
//                          padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                          child: Row(
//                            crossAxisAlignment: CrossAxisAlignment.center,
//                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                            children: <Widget>[
//                              //Text(Questions.answerShow[i]['question']),
//                              Container(
//                                  width: 155.0,
//                                  //color: Colors.purple,
//                                  child:AutoSizeText(Questions.answerShow[j]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                              ),
//                              Row(children: <Widget>[
//                                //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                                Container(
//                                    width: 140.0,
//                                    // color:Colors.blue,
//                                    child:AutoSizeText(Questions.answerShow[j]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)
//
//                                ),
//                                SizedBox(width: 5.0,),
//                                Icon(Icons.arrow_forward_ios, size: 12.0,
//                                  color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),)
//                              ],)
//                            ],
//                          ))
//                  ),

                );

                dynamicContainerbig.add(
                    Padding(
                        padding: EdgeInsets.only(left: 20.0),
                        child:Container(
                          margin: EdgeInsets.only(top:2.0,bottom:2.0),
                          height: j == countLongContainer-1 ? 0.0 :1.0,
                          color: Colors.grey[200],

                        )));
              }

          }
//per container 5
          dynamicContainer.add(
              Container(
              height:  screenheightList[hlength] ,
              margin: EdgeInsets.only(bottom:2.5,top:2.5,left: 10.0,right: 10.0),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
              ),
              child:Column(
                children:dynamicContainerbig,
              )
          ));

          i=j-1;
          detail = true;
          dynamicContainerbig=[];
          hlength++;

          //print("value oif j is:"+j.toString());

        }
    }
  }





  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .008;
    double maxHeight = MediaQuery.of(context).size.height * .82;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: (){
          Navigator.pushReplacementNamed(context, 'allCategoryScreen');
          //  Navigator.pop(context);
          },
            child:Icon(Icons.arrow_back_ios,color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),size: 20.0)
        ),
        title: Text('Living Situation',style: TextStyle(color: Colors.black,fontSize: 14.0),),
        centerTitle: true,
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 18.0),
            child:GestureDetector(
              onTap: (){
                print("skip");
              },
            child:Image(image:AssetImage("images/skip.png"),width: 23.0,height: 23.0,)
            )
            )
       ]


      ),
      body: SingleChildScrollView(
        reverse: true,
            child: Container(
              color: Colors.white,
           // height: 667.0,
            //height:Questions.answerShow.length <3 ? MediaQuery.of(context).size.height*0.87 : (Questions.answerShow.length*60.0)+430.0,
            //height:Questions.answerShow.length <3 ? 624.0 : (Questions.answerShow.length*60.0)+430.0,
              //height: MediaQuery.of(context).size.height*0.87,

              height: MediaQuery.of(context).size.height*0.87 >= screenHeight ? MediaQuery.of(context).size.height*0.87 : screenHeight ,
            width: MediaQuery.of(context).size.width,
            child:
              Stack(

              children: <Widget>[

              Positioned(
                bottom: 0,
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    //color: Colors.red,
                    child:
                Column(

                      children: <Widget>[

//
                        Column(children: dynamicContainer,),
//

//                        Column(
//                          children: dynamicContainer.asMap()
//                              .map((i,element) =>MapEntry(i,
//                            GestureDetector(
//                              onTap: (() {
//                                setState(() {
//                                  // print("element=${element.toString()}");
//                                  // print("element=${userBoard[element]}");
//                                  print(i.toString());
//                                  print(element.toString());
//                                  print(dynamicContainer[i].toString());
//                                });
//                              }),
//                              child:dynamicContainer[i],
//                            ),
//                          ))
//                              .values.toList(),
//                        ),



                        ChangeContainer(),

                      ],

                  ),
                ),),

//                Positioned(
//                  bottom: 0,
//                  child:changeContainer(),
//                ),

        ],
      ),)

    ));


  }










Widget ChangeContainer()
{
  if(Questions.answerShow.length ==0)
    {
      //For Single 430.0
      //For Divorced 220.0
      //For Widowed 220.0
      //For Married/ civil partnership 220.0
      //For It's Complicated 220.0
      Questions.LivingCheck = 1;
          return MaritalStatus("",430.0);
    }
    else if(Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ) {
    if (widget.CheckQuestion == "Marital"){
      if (widget.CheckAnswer[0] == "Single") {
        //for Employed 220.0
        // for Minijob (e.g. 450€ basis) 430.0
        // for studying 380.0 for container No 5
        // for training 260 for container No 6
        //for Self-employed unsupported screen 220.0
        //for Own business unsupported 220.0
        //for Forestry unsupported 220.0
        //for Retired unsupported 220.0
        //for Parental Leave 430.0
        //for Not working  430.0

        //qu.addAnswer("You","", "", [], 80.0);

        return OccupationContainer("",430.0);
      }

      else if(widget.CheckAnswer[0] == "Married/ civil partnership")
        {
          return LivingTogether("",220.0);
        }

        else if(widget.CheckAnswer[0] == "Divorced"){
        return DivorceDate("",430.0);

      }

      else if(widget.CheckAnswer[0] == "Widowed"){
        return WidowedDate("",430.0);
      }

      else if(widget.CheckAnswer[0] == "It's Complicated"){

        //For No 430.0
        //For yes 220.0
        return FormallyMarried("",430.0);
      }



  }

//divorce date
        else if(widget.CheckQuestion == "Date of divorce")
          {
            return OccupationContainer("",430.0);
          }

 //Widowed since

    else if(widget.CheckQuestion == "Widowed since")
    {
      return OccupationContainer("",430.0);
    }


    //living together tax year

    else if(widget.CheckQuestion == "Living together")
      {
        if(widget.CheckAnswer[0] == "No")
          {
            return StartLivingPart("",430.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
            {
              return GetMarried("",220.0);
            }
      }

      //Start living part of married/civilpartnership

        else if(widget.CheckQuestion == "Date of separation")
        {
          return OccupationContainer("",430.0);
          }


       //Start living part of married/civilpartnership
    //Date of marriage

        else if(widget.CheckQuestion == "Date of marriage")
        {
          return AssessedJointly("",430.0);
        }


        //It's Complicated Formally Married
          else if(widget.CheckQuestion == "Formally married")
          {
            if(widget.CheckAnswer[0] == "No")
            {
              return OccupationContainer("",430.0);
            }
            else if(widget.CheckAnswer[0] == "Yes")
            {
             return LivingTogether("", 220.0);
            }
          }


        //Assesses Jointly
          else if(widget.CheckQuestion == "Joint assessment")
          {
            if(widget.CheckAnswer[0] == "No")
            {
              return OccupationContainer("",430.0);
            }
            else if(widget.CheckAnswer[0] == "Yes")
            {
             //Partner's Question will be here for married/civilpartnership
              Questions.LivingCheck = 2;
              qu.updateAnswer("You & Partner","", "", [], 60.0);
              qu.addAnswer("You", "", "", [], 60.0);
              return OccupationContainer("",430.0);
            }
          }



        else if(widget.CheckQuestion == "Occupation")
          {
            for(int m=0;m<widget.CheckAnswer.length;m++) {

              if(widget.CheckAnswer[m] == "Employed") {

                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";


                return ProfessionalCourseTraining("",430.0);
              }

              else if(widget.CheckAnswer[m] == "Minijob (e.g. 450€ basis)")
                {
                  // For Relation in Finance
                  Questions.occupationStudyingFinance ="";

                  //For Relation in Home
                  Questions.occupationMiniJobHome = "Minijob";

                  //For Relation in Finance
                  Questions.occupationMiniJobFinance = "Minijob";
                  Questions.specialistActivityFinance = "";

                  //For Relation to Education Enable
                  Questions.educationCategoryEnable = "";

                  return IncomeSources("",430.0);
                }
              else if(widget.CheckAnswer[m] == "Studying")
              {

                // For Relation in Finance
                Questions.occupationStudyingFinance ="Studying";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";


                //For Relation to Education Enable
                Questions.educationCategoryEnable = "Education";

                //return ApplyStudies("",430.0);
                return EarnMoney("",430.0);
              }

              else if(widget.CheckAnswer[m] == "Training")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "Education";

                //return KindOfTraining("",430.0);
                return EarnMoney("",430.0);
              }
              else if(widget.CheckAnswer[m] == "Self-employed")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";

                //return UnSupportedScreen();
                return Text("");
              }
              else if(widget.CheckAnswer[m] == "Own business")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";

                //return UnSupportedScreen();
                return Text("");
              }
              else if(widget.CheckAnswer[m] == "Forestry")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";

                //return UnSupportedScreen();
                return Text("");
              }
              else if(widget.CheckAnswer[m] == "Retired")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";

                //return UnSupportedScreen();
                return Text("");
              }
              else if(widget.CheckAnswer[m] == "Parental Leave")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";

                return IncomeSources("",430.0);
              }
              else if(widget.CheckAnswer[m] == "Not working")
              {
                // For Relation in Finance
                Questions.occupationStudyingFinance ="";

                //For Relation in Home
                Questions.occupationMiniJobHome = "";

                //For Relation in Finance
                Questions.occupationMiniJobFinance = "";
                Questions.specialistActivityFinance = "";

                //For Relation to Education Enable
                Questions.educationCategoryEnable = "";

                return IncomeSources("",430.0);
              }
            }
          }

          else if(widget.CheckQuestion == "Training")
            {
              if(widget.CheckAnswer[0] == "No")
                {
                  //For Relation to Education Enable
                  Questions.educationCategoryEnable = "";
                }
                else if(widget.CheckAnswer[0] == "Yes")
                 {
                   //For Relation to Education Enable
                   Questions.educationCategoryEnable = "Education";
                 }

              //for Letting and Leasing 220.0
              // for sale of property 220.0
              // for capital gain 220.0
              //for pension 220.0
              ////for Alimony here we said 430.0 but we have to check for 380.0 its better if I put 380.0
              return IncomeSources("",430.0);
            }


            // studying and training(Earn Money)

    else if(widget.CheckQuestion == "Income from")
    {
      return IncomeSources("",430.0);
//      for(int m=0;m<widget.CheckAnswer.length;m++) {
//        if(widget.CheckAnswer[m] == "Part-time degree")
//        {
//          return IncomeSources("",430.0);
//        }
//        else if(widget.CheckAnswer[m] == "Distance learning") {
//          return IncomeSources("",430.0);
//        }
//        else if(widget.CheckAnswer[m] == "Postgraduate studies")
//        {
//          return IncomeSources("",430.0);
//        }
//        else if(widget.CheckAnswer[m] == "None")
//        {
//          return PreviousCompletedDegree("",430.0);
//        }
//
//
//      }
    }




//        else if(widget.CheckQuestion == "Type of study")
//        {
//          for(int m=0;m<widget.CheckAnswer.length;m++) {
//            if(widget.CheckAnswer[m] == "Part-time degree")
//            {
//              return IncomeSources("",430.0);
//            }
//            else if(widget.CheckAnswer[m] == "Distance learning") {
//              return IncomeSources("",430.0);
//            }
//            else if(widget.CheckAnswer[m] == "Postgraduate studies")
//            {
//              return IncomeSources("",430.0);
//            }
//            else if(widget.CheckAnswer[m] == "None")
//            {
//              return PreviousCompletedDegree("",430.0);
//            }
//
//
//          }
//        }

        //previouslydegreecompleted
        else if(widget.CheckQuestion == "Previous degree" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
        {
          return IncomeSources("",430.0);
        }


        //Typeoftraining
        else if(widget.CheckQuestion == "Type of training" && (widget.CheckAnswer[0] == "Dual training" || widget.CheckAnswer[0] == "Professional School" ))
        {
          return IncomeSources("",430.0);
        }


        else if(widget.CheckQuestion == "Other income")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Letting and Leasing")
              {
                //For relations with income
                Questions.alimonyReceivedIncome = "";


                //For relations with income
                Questions.salePropertyIncome = "";

                //return UnSupportedScreen();
                return Text("");
              }
            else if(widget.CheckAnswer[m] == "Sale of Property") {

              //For relations with income
              Questions.alimonyReceivedIncome = "";

              //For relations with income
              Questions.salePropertyIncome = "Sale of property";

              //for yes 210 and for no 380.0
              return SaleProperty("",380.0);
            }
            else if(widget.CheckAnswer[m] == "Capital gains")
              {
                //For relations with income
                Questions.alimonyReceivedIncome = "";

                //For relations with income
                Questions.salePropertyIncome = "";

                //for no 210 and for yes 430.0
                return CapitalGain("",430.0);
              }

            else if(widget.CheckAnswer[m] == "Pensions")
            {
              //For relations with income
              Questions.alimonyReceivedIncome = "";

              //For relations with income
              Questions.salePropertyIncome = "";

              //return UnSupportedScreen();
              return Text("");
            }

            else if(widget.CheckAnswer[m] == "Alimony")
            {

              //For relations with income
              Questions.alimonyReceivedIncome = "Alimony received";


              //For relations with income
              Questions.salePropertyIncome = "";


              //for Separated spouse 220.0
              // for Adult relatives 220.0
              //for child 220.0
              return PayAlimony("",220.0);
            }
          }
        }





        //for sale of property
        else if(widget.CheckQuestion == "More than one property" )
        {
          if(widget.CheckAnswer[0] == "Yes")
            {
              //return UnSupportedScreen();
              return Text("");
            }
            else if(widget.CheckAnswer[0] == "No")
              {
                //for Have a disability 220.0
                //for Alimony here we said 430.0 but we have to check for 380.0 its better if I put 380.0
                //for Survivor's pension unsupported screen show 220.0
                //for None 220.0
                return ApplySources("",430.0);
              }

        }


        //for Alimony check that yaha alimony check krna agar 4e ha to 6b select but shown same
        else if(widget.CheckQuestion == "Alimony recipient")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Separated spouse")
            {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Adult relatives") {
              //return UnSupportedScreen();
              return Text("");
            }
            else if(widget.CheckAnswer[m] == "Child")
            {
              //for no 220.0
              // for yes 380.0
              return ChildTaxAllowance("",380.0);
            }


          }
        }
        //Child benefits
        else if(widget.CheckQuestion == "Child benefits" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            //return UnSupportedScreen();
            return Text("");
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {
            return ApplySources("",430.0);
          }

        }





        //for capitalgain

        else if(widget.CheckQuestion == "German account" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            return ReceiveCapitalGain("",430.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {
            //380.0 for interest in capitalgain
            // 420.for From shares
            // 430.0 for From loans check its size it has three elements
            // 220.0 For insurance contracts
            // 220.0 Old shares from funds
            //430.0 	From complex financial instruments
            return ReceiveCapitalGain("",430.0);
          }

        }

        else if(widget.CheckQuestion == "Type of Capital gains")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Interest") {
               return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "From shares"){
              //for dividends and Earnings  and Liquidation proceeds  and Shares in associations and foundations size is 220.0,Earnings from sale of stocks is 380.0,Shares in associations and foundations 380.0
              return IncomeShares("",380.0);
            }
            else if(widget.CheckAnswer[m] == "From loans"){


              //for Privateloan unsupported 220.0
              //for Shareholder loan question 21  220.0
              // for Partiarisches Darlehen 220.0
              return TypeOfLoan("",220.0);
            }
            else if(widget.CheckAnswer[m] == "From insurance contracts"){

              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Old shares from funds"){

              return OldFundShares("",220.0);
            }
            else if(widget.CheckAnswer[m] == "From complex financial instruments"){

              //For Domestic Investment Funds 220.0
              //For Investment funds 220.0
              // For Option 220.0
              // For Option Premiums 220.0
              // For Derivatives 220.0
              //For Bonds 220.0
              return FinancialInstruments("",220.0);
            }
          }
        }



        else if(widget.CheckQuestion == "Loan")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Private loan") {
              //return UnSupportedScreen();
              return Text("");
            }
            else if(widget.CheckAnswer[m] == "Shareholder loan")
              {
                return Shares10Company("",220.0);
              }
             else if(widget.CheckAnswer[m] == "Partiarisches Darlehen"){
              //return UnSupportedScreen();
              return Text("");
            }

          }
        }


            else if(widget.CheckQuestion == "> 10% of shares" )
            {
            if(widget.CheckAnswer[0] == "No")
            {
            return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[0] == "Yes")
            {
              return Text("");
            //return UnSupportedScreen();
            }

            }




        else if(widget.CheckQuestion == "Certificate for old shares")
        {
          if(widget.CheckAnswer[0] == "No")
          {
            //return UnSupportedScreen();
            return Text("");
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {

            return ApplySources("",430.0);
          }
        }




        else if(widget.CheckQuestion == "Shares")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Dividends") {
              return KeyRole("",220.0);
            }
            else if(widget.CheckAnswer[m] == "Earnings from sale of stocks") {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Liquidation proceeds") {
              return KeyRole("",220.0);
            }
            else if(widget.CheckAnswer[m] == "Shares in associations and foundations") {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Silent partnerships") {
              return Text("");
              //return UnSupportedScreen();
            }

          }
        }


        //financial assets
        else if(widget.CheckQuestion == "Financial assests")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Domestic investment funds") {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Foreign investment funds")
              {
                return Text("");
                //return UnSupportedScreen();
              }
            else if(widget.CheckAnswer[m] == "Options")
            {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Option premiums")
            {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Derivatives")
            {
              return ApplySources("",430.0);
            }
            else if(widget.CheckAnswer[m] == "Bonds")
            {
              return ApplySources("",430.0);
            }



          }
        }






        else if(widget.CheckQuestion == "Key roles" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            return Shares25Company("",220.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {

            return Shares1Company("",220.0);
          }

        }


        else if(widget.CheckQuestion == "> 25% of shares" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            return ApplySources("",430.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {

            return Text("");
            //return UnSupportedScreen();
          }

        }


        else if(widget.CheckQuestion == "> 1% of shares" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            return ApplySources("",430.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {

            return Text("");
            //return UnSupportedScreen();
          }

        }





        else if(widget.CheckQuestion == "Further Information")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Have a disability") {

              //For relation in health
              Questions.haveDisabilityHealth = "Have a disability";

              //For relation in Family
              Questions.alimonyPaidFamily = "";

              return TaxReturn("",220.0);
            }
            else if(widget.CheckAnswer[m] == "Alimony paid") {

              //For relation in health
              Questions.haveDisabilityHealth = "";

              //For relation in Family
              Questions.alimonyPaidFamily = "Alimony paid";

              //question 8
              return PayAlimony("",220.0);
            }
            else if(widget.CheckAnswer[m] == "Survivor’s pension") {

              //For relation in health
              Questions.haveDisabilityHealth = "";

              //For relation in Family
              Questions.alimonyPaidFamily = "";


              //question 8
              return Text("");
              //return UnSupportedScreen();
            }
            else if(widget.CheckAnswer[m] == "None") {

              //For relation in health
              Questions.haveDisabilityHealth = "";

              //For relation in Family
              Questions.alimonyPaidFamily = "";

              //question 8
              //for Questions. LivingCheck=1 220.0
              //for Questions. LivingCheck=2 430.0
              return TaxReturn("",430.0);
            }
          }
        }

        else if(widget.CheckQuestion == "Tax return filed" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
          {
            if(Questions.LivingCheck == 1) {
              return HaveChildren("", 220.0);
            }
            else if(Questions.LivingCheck == 2)
              {
                Questions.LivingCheck = 3;
                qu.addAnswer("Partner", "", "", [], 60.0);
                //Partner's Yaha sa start hoga ab .Partner ka flow
                //Yaha size right nhi check it
                return PartnerOccupationContainer("",220.0);
              }
          }

        else if(widget.CheckQuestion == "Children")
        {
          if(widget.CheckAnswer[0] == "No") {

            //For relation with health
            Questions.childrenYesHealth = "";

            //For relation to enable family
            Questions.familyCategoryEnable = "";

            //For yes 220.0
            //For living abroad no :420
            //yaha last ma at home ka kaam bhi krna ha
            return LiveAlone("", 430.0);
          }

          else if(widget.CheckAnswer[0] == "Yes") {

            //For relation with health
            Questions.childrenYesHealth = "Childrenyes";

            //For relation to enable family
            Questions.familyCategoryEnable = "Family";

            //For yes 220.0
            //For living abroad no :420
            //yaha last ma at home ka kaam bhi krna ha
            return LiveAlone("", 430.0);
          }
        }
        else if(widget.CheckQuestion == "Living alone")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return LiveAbroad("",220.0);
          }
          else if(widget.CheckAnswer[0] == "No")
            {
              return WhoLiveWith("",220.0);
            }
        }

      //Living situation

        else if(widget.CheckQuestion == "Living situation")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "With my spouse") {
              return LiveAbroad("",220.0);
            }
            else if(widget.CheckAnswer[m] == "With my partner") {
              //question 8
              return LiveAbroad("",220.0);
            }
            else if(widget.CheckAnswer[m] == "With my children") {
              //question 8
              return LiveAbroad("",220.0);
            }
            else if(widget.CheckAnswer[m] == "In a flat share") {
              //question 8
              return LiveAbroad("",220.0);
            }
            else if(widget.CheckAnswer[m] == "With my parents") {
              //question 8
              return LiveAbroad("",220.0);
            }
          }
        }







        else if(widget.CheckQuestion == "Living abroad")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return Text("");
            //return UnSupportedScreen();
          }
          else if(widget.CheckAnswer[0] == "No")
          {
            return ForeignIncome("",220.0);
          }
        }

        else if(widget.CheckQuestion == "Foreign Income")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return Text("");
            //return UnSupportedScreen();
          }
          else if(widget.CheckAnswer[0] == "No")
          {
            return FinishCategory("Living Situation Category","Income Category");
          }
        }
    }
       // ======================================== Partner's Flow Has been Started ============================================ //
      // ======================================== Partner's Flow Has been Started ============================================ //
     // ======================================== Partner's Flow Has been Started ============================================ //
    // ======================================== Partner's Flow Has been Started ============================================ //
   // ======================================== Partner's Flow Has been Started ============================================ //
  // ======================================== Partner's Flow Has been Started ============================================ //

    else if(Questions.LivingCheck == 3)
      {
        if(widget.CheckQuestion == "Occupation")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {

      if(widget.CheckAnswer[m] == "Employed") {


        return PartnerProfessionalCourseTraining("",430.0);
      }

      else if(widget.CheckAnswer[m] == "Minijob (e.g. 450€ basis)")
      {

        return PartnerIncomeSources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Studying")
      {


        //For Part-time degree 430.0
        //For Distance learning 430.0
        //For Postgraduate studies 430.0
        //For None 220.0

        //return PartnerApplyStudies("",430.0);
        return PartnerEarnMoney("",430.0);
      }

      else if(widget.CheckAnswer[m] == "Training")
      {


        return PartnerEarnMoney("",430.0);
        //return PartnerKindOfTraining("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Self-employed")
      {


        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Own business")
      {


        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Forestry")
      {


        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Retired")
      {


        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Parental Leave")
      {


        return PartnerIncomeSources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Not working")
      {


        return PartnerIncomeSources("",430.0);
      }
    }
  }

  else if(widget.CheckQuestion == "Training" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
  {
    //for Letting and Leasing 220.0
    // for sale of property 220.0
    // for capital gain 220.0
    //for pension 220.0
    ////for Alimony here we said 430.0 but we have to check for 380.0 its better if I put 380.0
    return PartnerIncomeSources("",430.0);
  }


  // studying and training(Partner Earn money)
        else if(widget.CheckQuestion == "Income from")
        {
          return PartnerIncomeSources("",430.0);


        }

//  else if(widget.CheckQuestion == "Type of study")
//  {
//    for(int m=0;m<widget.CheckAnswer.length;m++) {
//      if(widget.CheckAnswer[m] == "Part-time degree")
//      {
//        return PartnerIncomeSources("",430.0);
//      }
//      else if(widget.CheckAnswer[m] == "Distance learning") {
//        return PartnerIncomeSources("",430.0);
//      }
//      else if(widget.CheckAnswer[m] == "Postgraduate studies")
//      {
//        return PartnerIncomeSources("",430.0);
//      }
//      else if(widget.CheckAnswer[m] == "None")
//      {
//        return PartnerPreviousCompletedDegree("",430.0);
//      }
//
//
//    }
//  }

  //previouslydegreecompleted
  else if(widget.CheckQuestion == "Previous degree" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
  {
    return PartnerIncomeSources("",430.0);
  }


  //Typeoftraining
  else if(widget.CheckQuestion == "Type of training" && (widget.CheckAnswer[0] == "Dual training" || widget.CheckAnswer[0] == "Professional School" ))
  {
    return PartnerIncomeSources("",430.0);
  }


  else if(widget.CheckQuestion == "Other income")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Letting and Leasing")
      {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Sale of Property") {
        //for yes 210 and for no 380.0
        return PartnerSaleProperty("",380.0);
      }
      else if(widget.CheckAnswer[m] == "Capital gains")
      {
        //for no 210 and for yes 430.0
        return PartnerCapitalGain("",430.0);
      }

      else if(widget.CheckAnswer[m] == "Pensions")
      {

        return UnSupportedScreen();
      }

      else if(widget.CheckAnswer[m] == "Alimony")
      {
        //for Separated spouse 220.0
        // for Adult relatives 220.0
        //for child 220.0
        return PartnerPayAlimony("",220.0);
      }
    }
  }





  //for sale of property
  else if(widget.CheckQuestion == "More than one property" )
  {
    if(widget.CheckAnswer[0] == "Yes")
    {
      return UnSupportedScreen();
    }
    else if(widget.CheckAnswer[0] == "No")
    {
      //for Have a disability 220.0
      //for Alimony here we said 430.0 but we have to check for 380.0 its better if I put 380.0
      //for Survivor's pension unsupported screen show 220.0
      //for None 220.0
      return PartnerApplySources("",430.0);
    }

  }


  //for Alimony check that yaha alimony check krna agar 4e ha to 6b select but shown same
  else if(widget.CheckQuestion == "Alimony recipient")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Separated spouse")
      {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Adult relatives") {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Child")
      {
        //for no 220.0
        // for yes 380.0
        return PartnerChildTaxAllowance("",380.0);
      }


    }
  }
  //Child benefits
  else if(widget.CheckQuestion == "Child benefits" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return UnSupportedScreen();
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {
      return PartnerApplySources("",430.0);
    }

  }





  //for capitalgain

  else if(widget.CheckQuestion == "German account" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return UnSupportedScreen();
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {
      //380.0 for interest in capitalgain
      // 420.for From shares
      // 430.0 for From loans check its size it has three elements
      // 220.0 For insurance contracts
      // 220.0 Old shares from funds
      //430.0 	From complex financial instruments
      return PartnerReceiveCapitalGain("",430.0);
    }

  }

  else if(widget.CheckQuestion == "Type of Capital gains")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Interest") {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "From shares"){
        //for dividends and Earnings  and Liquidation proceeds  and Shares in associations and foundations size is 220.0,Earnings from sale of stocks is 380.0,Shares in associations and foundations 380.0
        return PartnerIncomeShares("",380.0);
      }

      else if(widget.CheckAnswer[m] == "From loans"){


        //for Privateloan unsupported 220.0
        //for Shareholder loan question 21  220.0
        // for Partiarisches Darlehen 220.0
        return PartnerTypeOfLoan("",220.0);
      }
      else if(widget.CheckAnswer[m] == "From insurance contracts"){

        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Old shares from funds"){

        return PartnerOldFundShares("",220.0);
      }
      else if(widget.CheckAnswer[m] == "From complex financial instruments"){

        //For Domestic Investment Funds 220.0
        //For Investment funds 220.0
        // For Option 220.0
        // For Option Premiums 220.0
        // For Derivatives 220.0
        //For Bonds 220.0
        return PartnerFinancialInstruments("",220.0);
      }
    }
  }



  else if(widget.CheckQuestion == "Loan")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Private loan") {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Shareholder loan")
      {
        return PartnerShares10Company("",220.0);
      }
      else if(widget.CheckAnswer[m] == "Partiarisches Darlehen"){
        return UnSupportedScreen();
      }

    }
  }


  else if(widget.CheckQuestion == "> 10% of shares" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return PartnerApplySources("",430.0);
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {
      return UnSupportedScreen();
    }

  }




  else if(widget.CheckQuestion == "Certificate for old shares")
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return UnSupportedScreen();
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {

      return PartnerApplySources("",430.0);
    }
  }




  else if(widget.CheckQuestion == "Shares")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Dividends") {
        return PartnerKeyRole("",220.0);
      }
      else if(widget.CheckAnswer[m] == "Earnings from sale of stocks") {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Liquidation proceeds") {
        return PartnerKeyRole("",220.0);
      }
      else if(widget.CheckAnswer[m] == "Shares in associations and foundations") {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Silent partnerships") {
        return UnSupportedScreen();
      }

    }
  }


  //financial assets
  else if(widget.CheckQuestion == "Financial assests")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Domestic investment funds") {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Foreign investment funds")
      {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Options")
      {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Option premiums")
      {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Derivatives")
      {
        return PartnerApplySources("",430.0);
      }
      else if(widget.CheckAnswer[m] == "Bonds")
      {
        return PartnerApplySources("",430.0);
      }



    }
  }






  else if(widget.CheckQuestion == "Key roles" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return PartnerShares25Company("",220.0);
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {

      return PartnerShares1Company("",220.0);
    }

  }


  else if(widget.CheckQuestion == "> 25% of shares" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return PartnerApplySources("",430.0);
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {

      return UnSupportedScreen();
    }

  }


  else if(widget.CheckQuestion == "> 1% of shares" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return PartnerApplySources("",430.0);
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {

      return UnSupportedScreen();
    }

  }





  else if(widget.CheckQuestion == "Further Information")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Have a disability") {
        return PartnerTaxReturn("",220.0);
      }
      else if(widget.CheckAnswer[m] == "Alimony paid") {
        //question 8
        return PartnerPayAlimony("",220.0);
      }
      else if(widget.CheckAnswer[m] == "Survivor’s pension") {
        //question 8
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "None") {
        //question 8
        //for Questions. LivingCheck=1 220.0
        //for Questions. LivingCheck=2 430.0
        return PartnerTaxReturn("",220.0);
      }
    }
  }

  else if(widget.CheckQuestion == "Tax return filed" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
  {
    Questions.livcolContainer = 1;
    qu.addAnswer("You & Partner", "", "", [], 60.0);

      return PartnerHaveChildren("",220.0);

  }

        else if(widget.CheckQuestion == "Children" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
        {

          return PartnerLiveTogetherEntireYear("",220.0);
        }

        else if(widget.CheckQuestion == "Together all-year" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
        {
          return PartnerLiveAbroad("", 220.0);
        }

        //Living situation

        else if(widget.CheckQuestion == "Living abroad")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return UnSupportedScreen();
          }
          else if(widget.CheckAnswer[0] == "No")
          {
            return PartnerForeignIncome("",220.0);
          }
        }

        else if(widget.CheckQuestion == "Foreign Income")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return UnSupportedScreen();
          }
          else if(widget.CheckAnswer[0] == "No")
          {
            return FinishCategory("Living Situation Category","Income Category");
          }
        }


      }
}

Widget MaritalStatus(String identity,double anContainer)
{
  Questions.animatedContainer = anContainer;
  return Container1(Identity:identity,BigQuestion:"",Question:"What is your official marital status in Germany?",QuestionOption:"Marital",AnswerOption:["Single","Married/ civil partnership","Divorced","Widowed","It's Complicated"],Containersize:430.0);
}

Widget OccupationContainer(String identity,double anContainer)
{
  Questions.animatedContainer = anContainer;
  return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What were your occupations in the year 2019?",QuestionOption:"Occupation",AnswerOption:["Employed","Minijob (e.g. 450€ basis)","Studying","Training","Self-employed","Own business","Forestry","Retired","Parental Leave","Not working"],AnswerImages:["images/employedoption.png","images/minijoboption.png","images/studyingoption.png","images/trainingoption.png","images/selfemployed.png","images/ownbusinessoption.png","images/forestryoption.png","images/retired.png","images/parentalleaveoption.png","images/notworkingoption.png"],Containersize:430.0);
}

  Widget ProfessionalCourseTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you attend any professional training courses?",QuestionOption:"Training",Containersize:220.0);
  }


  Widget IncomeSources(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"Did you have any other income sources in 2019?",QuestionOption:"Other income",AnswerOption:["Letting and Leasing","Sale of Property","Capital gains","Pensions","Alimony"],AnswerImages:["images/lettingoption.png","images/salepropertyoption.png","images/capitalgainoption.png","images/pensionsoption.png","images/alimonyoption.png"],Containersize:430.0);
  }


  Widget SaleProperty(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you sell more than one property?",QuestionOption:"More than one property",Containersize:220.0);
  }

  Widget ApplySources(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container4(Identity:identity,BigQuestion:"Personal Details",Question:"Did any of these applied to you during 2019?",QuestionOption:"Further Information",AnswerOption:["Have a disability","Alimony paid","Survivor’s pension","None"],AnswerImages:["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],Containersize:380.0);
  }

  Widget TaxReturn(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have you filed a tax return before?",QuestionOption:"Tax return filed",Containersize:220.0);
  }


  Widget HaveChildren(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Do you have children?",QuestionOption:"Children",Containersize:220.0);
  }

  Widget LiveAlone(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did you live alone in 2019?",QuestionOption:"Living alone",Containersize:220.0);
  }

  Widget LiveAbroad(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did you live abroad for extended periods of time in 2019?",QuestionOption:"Living abroad",Containersize:220.0);
  }

  Widget ForeignIncome(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did you have income from abroad during 2019",QuestionOption:"Foreign Income",Containersize:220.0);
  }


  Widget CapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your capital gain enter a German depot or bank account only?",QuestionOption:"German account",Containersize:220.0);
  }


  Widget ReceiveCapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of capital gains did you receive?",QuestionOption:"Type of Capital gains",AnswerOption:["Interest","From shares","From loans","From insurance contracts","Old shares from funds","From complex financial instruments"],AnswerImages:["images/interestoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/frominsuranceoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:430.0);
  }

  Widget IncomeShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of income from shares did you have?",QuestionOption:"Shares",AnswerOption:["Dividends","Earnings from sale of stocks","Liquidation proceeds","Shares in associations and foundations","Silent partnerships"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:430.0);
  }


  Widget KeyRole(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you work in a key role for any of these companies?",QuestionOption:"Key roles",Containersize:220.0);
  }


  Widget Shares25Company(String identity,double anContainer)
  {
      Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you hold more than 25% of the shares of any one company?",QuestionOption:"> 25% of shares",Containersize:220.0);
  }

  Widget Shares1Company(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you hold more than 1% of the shares of any one company?",QuestionOption:"> 1% of shares",Containersize:220.0);
  }


  Widget TypeOfLoan(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of loan did you grant?",QuestionOption:"Loan",AnswerOption:["Private loan","Shareholder loan","Partiarisches Darlehen"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:430.0);
  }

  Widget Shares10Company(String identity,double anContainer)
  {
   // Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you hold at least 10% of the shares of any one company?",QuestionOption:"> 10% of shares",Containersize:220.0);
  }

  Widget OldFundShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have you received a certificate from the bank listing the returns on old fund shares (Alt-Anteile von Fonds) that you purchased before 2009?",QuestionOption:"Certificate for old shares",Containersize:220.0);
  }

  Widget FinancialInstruments(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"In which financial instruments have you invested?",QuestionOption:"Financial assests",AnswerOption:["Domestic investment funds","Foreign investment funds","Options","Option premiums","Derivatives","Bonds"],AnswerImages:["images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:430.0);
  }


  //iska question option likhna baqi ha
  Widget PayAlimony(String identity,double anContainer)
  {
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"To whom did you pay Alimony?",QuestionOption:"Alimony recipient",AnswerOption:["Separated spouse","Adult relatives","Child"],AnswerImages:["images/spouseoption.png","images/adultoption.png","images/childoption.png"],Containersize:430.0);
  }

  Widget WhoLiveWith(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"",Question:"Who do you live with?",QuestionOption:"Living situation",AnswerOption:["With my spouse","With my partner","With my children","In a flat share","With my parents"],AnswerImages:["images/withspouseoption.png","images/withpartneroption.png","images/withchildren.png","images/flatshareoption.png","images/withparent.png"],Containersize:430.0);
  }

  Widget ChildTaxAllowance(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Are you or any other person entitled to receive child benefits or the child tax allowance for this child?",QuestionOption:"Child benefits",Containersize:220.0);
  }



//  Widget ApplyStudies(String identity,double anContainer)
//  {
//    Questions.animatedContainer = anContainer;
//    return Container5(Identity:identity,BigQuestion:"Personal Details",Question:"Which of these apply to your studies?",QuestionOption:"Type of study",AnswerOption:["Part-time degree","Distance learning","Postgraduate studies","None"],Containersize:380.0);
//  }

  Widget EarnMoney(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //return Container5(Identity:identity,BigQuestion:"Personal Details",Question:"In 2019, did you earn money during any of the following?",QuestionOption:"Income from",AnswerOption:["In the course of a training","With dual studies","As a working student","With a part-time job","During an internship","with a minijob","No"],Containersize:380.0);
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"In 2019, did you earn money during any of the following?",QuestionOption:"Income from",AnswerOption:["In the course of a training","With dual studies","As a working student","With a part-time job","During an internship","with a minijob","No"],AnswerImages:["images/withspouseoption.png","images/withpartneroption.png","images/withchildren.png","images/flatshareoption.png","images/withparent.png","images/withparent.png","images/withparent.png"],Containersize:430.0);

  }


  Widget PreviousCompletedDegree(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have you previously completed a degree (study or training)?",QuestionOption:"Previous degree",Containersize:220.0);
  }


  Widget KindOfTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container6(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of training did you do?",QuestionOption:"Type of training",AnswerOption:["Dual training","Professional School"],Containersize:280.0);
  }

  Widget DivorceDate(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"When did you get divorced?",QuestionOption:"Date of divorce",Containersize:220.0);
  }


  Widget WidowedDate(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"Since when have you been widowed?",QuestionOption:"Widowed since",Containersize:220.0);
  }


  Widget LivingTogether(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Relationship status",Question:"Have you been living together at any time during the tax year?",QuestionOption:"Living together",Containersize:220.0);
  }


  Widget StartLivingPart(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"When did you start living apart?",QuestionOption:"Date of separation",Containersize:220.0);
  }


  Widget GetMarried(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"When did you get married?",QuestionOption:"Date of marriage",Containersize:220.0);
  }


  Widget AssessedJointly(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Relationship status",Question:"Do you wish to be assessed jointly?",QuestionOption:"Joint assessment",Containersize:220.0);
  }


  Widget FormallyMarried(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Relationship status",Question:"Are you formally married?",QuestionOption:"Formally married",Containersize:220.0);
  }






  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================


  Widget PartnerOccupationContainer(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What were your partner’s occupation in the year 2019?",QuestionOption:"Occupation",AnswerOption:["Employed","Minijob (e.g. 450€ basis)","Studying","Training","Self-employed","Own business","Forestry","Retired","Parental Leave","Not working"],AnswerImages:["images/employedoption.png","images/minijoboption.png","images/studyingoption.png","images/trainingoption.png","images/selfemployed.png","images/ownbusinessoption.png","images/forestryoption.png","images/retired.png","images/parentalleaveoption.png","images/notworkingoption.png"],Containersize:430.0);
  }

  Widget PartnerProfessionalCourseTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner attend any professional training courses?",QuestionOption:"Training",Containersize:220.0);
  }


  Widget PartnerIncomeSources(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner have any other income sources in 2019?",QuestionOption:"Other income",AnswerOption:["Letting and Leasing","Sale of Property","Capital gains","Pensions","Alimony"],AnswerImages:["images/lettingoption.png","images/salepropertyoption.png","images/capitalgainoption.png","images/pensionsoption.png","images/alimonyoption.png"],Containersize:430.0);
  }


  Widget PartnerSaleProperty(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner sell more than one property?",QuestionOption:"More than one property",Containersize:220.0);
  }

  Widget PartnerApplySources(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container4(Identity:identity,BigQuestion:"Personal Details",Question:"Did any of these applied to your partner during 2019?",QuestionOption:"Further Information",AnswerOption:["Have a disability","Alimony paid","Survivor’s pension","None"],AnswerImages:["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],Containersize:380.0);
  }

  Widget PartnerTaxReturn(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Has your partner filed a tax return before?",QuestionOption:"Tax return filed",Containersize:220.0);
  }


  Widget PartnerCapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner’s capital gain enter a German depot or bank account only?",QuestionOption:"German account",Containersize:220.0);
  }


  Widget PartnerReceiveCapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of capital gains did your partner receive?",QuestionOption:"Type of Capital gains",AnswerOption:["Interest","From shares","From loans","From insurance contracts","Old shares from funds","From complex financial instruments"],AnswerImages:["images/interestoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/frominsuranceoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:430.0);
  }

  Widget PartnerIncomeShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of income from shares did your partner have?",QuestionOption:"Shares",AnswerOption:["Dividends","Earnings from sale of stocks","Liquidation proceeds","Shares in associations and foundations","Silent partnerships"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:430.0);
  }


  Widget PartnerKeyRole(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner work in a key role for any of these companies?",QuestionOption:"Key roles",Containersize:220.0);
  }


  Widget PartnerShares25Company(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner hold more than 25% of the shares of any one company?",QuestionOption:"> 25% of shares",Containersize:220.0);
  }

  Widget PartnerShares1Company(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner hold more than 1% of the shares of any one company?",QuestionOption:"> 1% of shares",Containersize:220.0);
  }


  Widget PartnerTypeOfLoan(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of loan did your partner grant?",QuestionOption:"Loan",AnswerOption:["Private loan","Shareholder loan","Partiarisches Darlehen"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:430.0);
  }

  Widget PartnerShares10Company(String identity,double anContainer)
  {
    // Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner hold at least 10% of the shares of any one company?",QuestionOption:"> 10% of shares",Containersize:220.0);
  }

  Widget PartnerOldFundShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have your partner received a certificate from the bank listing the returns on old fund shares (Alt-Anteile von Fonds) that you purchased before 2009?",QuestionOption:"Certificate for old shares",Containersize:220.0);
  }

  Widget PartnerFinancialInstruments(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"In which financial instruments have your partner invested?",QuestionOption:"Financial assests",AnswerOption:["Domestic investment funds","Foreign investment funds","Options","Option premiums","Derivatives","Bonds"],AnswerImages:["images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:430.0);
  }


  //iska question option likhna baqi ha
  Widget PartnerPayAlimony(String identity,double anContainer)
  {
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"To whom did your partner pay Alimony?",QuestionOption:"Alimony recipient",AnswerOption:["Separated spouse","Adult relatives","Child"],AnswerImages:["images/spouseoption.png","images/adultoption.png","images/childoption.png"],Containersize:430.0);
  }


  Widget PartnerChildTaxAllowance(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Are you or your partner entitled to receive child benefits or the child tax allowance for this child",QuestionOption:"Child benefits",Containersize:220.0);
  }



//  Widget PartnerApplyStudies(String identity,double anContainer)
//  {
//    Questions.animatedContainer = anContainer;
//    return Container5(Identity:identity,BigQuestion:"Personal Details",Question:"Which of these apply to your partner’s studies?",QuestionOption:"Type of study",AnswerOption:["Part-time degree","Distance learning","Postgraduate studies","None"],Containersize:380.0);
//  }

  Widget PartnerEarnMoney(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //return Container5(Identity:identity,BigQuestion:"Personal Details",Question:"In 2019, did you earn money during any of the following?",QuestionOption:"Income from",AnswerOption:["In the course of a training","With dual studies","As a working student","With a part-time job","During an internship","with a minijob","No"],Containersize:380.0);
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"In 2019, did your partner earn money during any of the following?",QuestionOption:"Income from",AnswerOption:["In the course of a training","With dual studies","As a working student","With a part-time job","During an internship","with a minijob","No"],AnswerImages:["images/withspouseoption.png","images/withpartneroption.png","images/withchildren.png","images/flatshareoption.png","images/withparent.png","images/withparent.png","images/withparent.png"],Containersize:430.0);

  }


  Widget PartnerPreviousCompletedDegree(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have your partner previously completed a degree (study or training)?",QuestionOption:"Previous degree",Containersize:220.0);
  }


  Widget PartnerKindOfTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container6(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of training did your partner do?",QuestionOption:"Type of training",AnswerOption:["Dual training","Professional School"],Containersize:280.0);
  }


  Widget PartnerHaveChildren(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Do either of you have children?",QuestionOption:"Children",Containersize:220.0);
  }

  Widget PartnerLiveTogetherEntireYear(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did the two of you live together for the entire year?",QuestionOption:"Together all-year",Containersize:220.0);
  }

  Widget PartnerLiveAbroad(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did either of you live abroad for extended periods of time in 2019?",QuestionOption:"Living abroad",Containersize:220.0);
  }

  Widget PartnerForeignIncome(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did either of you have income from abroad during 2019?",QuestionOption:"Foreign Income",Containersize:220.0);
  }

}


//For show and index of small container
class SingleSmallContainer extends StatelessWidget {

int currentIndex;
List answerSubList = [];
  SingleSmallContainer({this.currentIndex});


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){

        print("Small Container Current index is:"+currentIndex.toString());


        if(currentIndex == 0)
          {
            Questions.answerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return mainQuestions(CheckQuestion : "",CheckAnswer : []);
            }));
          }

        else {
          answerSubList = Questions.answerShow.sublist(0, currentIndex);
          print("Answer sub list:$answerSubList");
          Questions.answerShow = [];
          Questions.answerShow.addAll(answerSubList);

          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return mainQuestions(CheckQuestion : Questions.answerShow[currentIndex-1]['question'],CheckAnswer : [Questions.answerShow[currentIndex-1]['answer'][0]]);
          }));
        }





        },
        child:Container(
      margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
      height: Questions.answerShow[currentIndex]['containerheight'],
      width: 450.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7.0),
          border: Border.all(width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
      ),
      child: Padding(
          padding: EdgeInsets.only(left: 10.0, right: 10.0),
          child: Row(crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //Text(Questions.answerShow[i]['question']),
              Container(
                  width: 155.0,
                  //color: Colors.purple,
                  child:AutoSizeText(Questions.answerShow[currentIndex]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
              ),
              Row(children: <Widget>[
                //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                Container(
                    width: 140.0,
                    // color:Colors.blue,
                    child:AutoSizeText(Questions.answerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

                ),
                SizedBox(width: 5.0,),
                Icon(Icons.arrow_forward_ios, size: 12.0,
                    color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF))
              ],)
            ],
          )),
    ));
  }
}





//For show and index of big container
class MultipleBigContainer extends StatelessWidget {
  int currentIndex;
  List answerSubList = [];
  MultipleBigContainer({this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        print("Big Coontainer Current index is:"+currentIndex.toString());

        if(currentIndex == 0)
        {
          Questions.answerShow = [];

          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return mainQuestions(CheckQuestion : "",CheckAnswer : []);
          }));
        }

        else {
          answerSubList = Questions.answerShow.sublist(0, currentIndex);
          print("Answer sub list:$answerSubList");
          Questions.answerShow = [];
          Questions.answerShow.addAll(answerSubList);

          Navigator.of(context).pop();
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return mainQuestions(CheckQuestion : Questions.answerShow[currentIndex-1]['question'],CheckAnswer : [Questions.answerShow[currentIndex-1]['answer'][0]]);
          }));
        }



//        Navigator.of(context).pop();
//        Navigator.push(context, MaterialPageRoute(builder: (context) {
//          return mainQuestions(CheckQuestion : Questions.answerShow[currentIndex]['question'],CheckAnswer : [Questions.answerShow[currentIndex]['answer'][0]]);
//        }));
      },
      child:Container(
        color: Colors.white,
        height: 55.0,
        width: 450.0,
        child: Padding(
            padding: EdgeInsets.only(left: 10.0, right: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //Text(Questions.answerShow[i]['question']),
                Container(
                    width: 155.0,
                    //color: Colors.purple,
                    child:AutoSizeText(Questions.answerShow[currentIndex]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                ),
                Row(children: <Widget>[
                  //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                  Container(
                      width: 140.0,
                      // color:Colors.blue,
                      child:AutoSizeText(Questions.answerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

                  ),
                  SizedBox(width: 5.0,),
                  Icon(Icons.arrow_forward_ios, size: 12.0,
                    color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),)
                ],)
              ],
            ))
    ));
  }
}




