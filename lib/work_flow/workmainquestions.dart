import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/work_flow/workcalculationcontainer.dart';
import 'package:easy_taxx/work_flow/workyesnocontainer.dart';
import 'package:easy_taxx/work_flow/workmultipleoptionscontainer.dart';
import 'package:easy_taxx/work_flow/workthreeoptioncontainer.dart';
import 'package:easy_taxx/work_flow/workdatecontainer.dart';
import 'package:easy_taxx/work_flow/workdifferentoptioncontainer.dart';
import 'package:easy_taxx/work_flow/workmultithreecontainer.dart';
import 'package:easy_taxx/work_flow/workcalculationbigcontainer.dart';
import 'package:easy_taxx/work_flow/worktwooptioncontainer.dart';
import 'package:easy_taxx/work_flow/workmultitwocontainer.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:auto_size_text/auto_size_text.dart';



//void main() => runApp(MaterialApp(home:HomeScreen()));

class WorkMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  WorkMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _WorkMainQuestionsState createState() => _WorkMainQuestionsState();
}

class _WorkMainQuestionsState extends State<WorkMainQuestions> {
  Questions qu = Questions();
  var dynamicContainer = List<Widget>();
  var dynamicContainerbig = List<Widget>();
  bool detail = true;
  String detailOption;
  double screenHeight = 0.0;
  double screenHeightbig = 0.0;
  List screenHeightbiglist = [];
  String detailsHeight;
  int countLongContainer = 0;
  int i,
      j = 0,
      l = 0,
      co;
  int k = 0;
  int heightcount = 0;
  List heightList = [];
  List screenheightList = [];
  int hlength = 0;
  bool a = false;


  Widget circleButton(IconData iconData) {
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

  void Screenheight() {
    print("question length:" + Questions.workAnswerShow.length.toString());

    for (k = l; k < Questions.workAnswerShow.length; k++) {
      print("how manysdsdsd");
      screenHeightbig = 0.0;
      if (Questions.workAnswerShow[k]['identity'] == "You" ||
          Questions.workAnswerShow[k]['identity'] == "You & Partner" ||
          Questions.workAnswerShow[k]['identity'] == "Partner") {
        screenHeight = screenHeight + 70.0;
      }
      else if (Questions.workAnswerShow[k]['details'] == "") {
        screenHeight = screenHeight + 60.0;
        detail = true;
      }
      else {
        detailsHeight = Questions.workAnswerShow[k]['details'];

        for (l = k; l < Questions.workAnswerShow.length; l++) {
          if (Questions.workAnswerShow[l]['details'] == detailsHeight) {
            print("height");
            heightcount ++;
          }
          else {
            //k = l-1;
            break;
          }
        }

        k = l - 1;

        print("height screen is:" + heightcount.toString());
        heightList.add(heightcount);
        print("height list:" + heightList.toString());
        heightcount = 0;
        screenheightList = [];
        for (int he = 0; he < heightList.length; he++) {
          screenheightList.add((heightList[he] * 60.0) + 60.0 + 2);
        }

        print(screenheightList.toString());
//        for(int h=0;h<screenheightList.length;h++)
//          {
//            screenHeightbig = screenheightList[h] + 5.0;
//          }

        //calculate screen height according to new big container
        screenHeight =
            screenHeight + screenheightList[screenheightList.length - 1] + 5.0;
      }
      print("k:" + k.toString() + "l:" + l.toString());
    }
    //screenHeightbig = screenHeightbig +2;
    screenHeight = screenHeight + Questions.workAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:" + screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;
  }


  void DynamicContainer() {
    hlength = 0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i = j; i < Questions.workAnswerShow.length; i++) {
      print("value oif i is:" + i.toString());


      print("dat is:" + i.toString());
      //You and your and your partner identity
      if (Questions.workAnswerShow[i]['identity'] == "You" ||
          Questions.workAnswerShow[i]['identity'] == "You & Partner" ||
          Questions.workAnswerShow[i]['identity'] == "Partner") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: Questions.workAnswerShow[i]['containerheight'],
              width: 450.0,
              child: Text(Questions.workAnswerShow[i]['identity'],
                  style: TextStyle(fontSize: 40.0)),
            )
        );
      }
      else if (Questions.workAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            SingleSmallContainer(currentIndex : i)
//            Container(
//              margin: EdgeInsets.only(
//                  top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
//              height: Questions.workAnswerShow[i]['containerheight'],
//              width: 450.0,
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(10.0),
//                  border: Border.all(width: 1.0, color: Colors.lightBlue)
//              ),
//              child: Padding(
//                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
//                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                    children: <Widget>[
//                      //Text(Questions.answerShow[i]['question']),
//                      Text(Questions.workAnswerShow[i]['question'],
//                        style: TextStyle(fontWeight: FontWeight.bold),),
//                      Row(children: <Widget>[
//                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                        Text(Questions.workAnswerShow[i]['answer'][0]),
//                        SizedBox(width: 10.0,),
//                        Icon(Icons.arrow_forward_ios, size: 12.0,
//                          color: Colors.lightBlue,)
//                      ],)
//                    ],)),
//            )
         );
      }

      //data that contains long container
      else {
        detailOption = Questions.workAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for (co = i; co < Questions.workAnswerShow.length; co++) {
          if (Questions.workAnswerShow[co]['details'] == detailOption) {
            countLongContainer++;
            //print("data after container");

          }
          else {
            break;
          }
        }

        countLongContainer = countLongContainer + i;
        //print("count long container:"+countLongContainer.toString()+" "+i.toString());

        for (j = i; j < countLongContainer; j++) {
//print("4<5");
          if (Questions.workAnswerShow[j]['details'] == detailOption &&
              detail == true) {
            dynamicContainerbig.add(
              Container(
                  height: 55.0,
                  width: 450.0,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Text(Questions.answerShow[i]['question']),
                          Text(Questions.workAnswerShow[i]['details'],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15.0),),
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
                    child: Container(
                      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                      height: 1.0,
                      color: Colors.grey[200],

                    )));
            //so that details data not come again and again
            detail = false;
          }
          // after details data
          if (Questions.workAnswerShow[j]['details'] == detailOption &&
              detail == false) {
            dynamicContainerbig.add(
                MultipleBigContainer(currentIndex : j)
//              Container(
//                  color: Colors.white,
//                  height: 55.0,
//                  width: 450.0,
//                  child: Padding(
//                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          //Text(Questions.answerShow[i]['question']),
//                          Text(Questions.workAnswerShow[j]['question'],
//                            style: TextStyle(color: Colors.grey),),
//                          Row(children: <Widget>[
//                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                            Text(Questions.workAnswerShow[j]['answer'][0]),
//                            SizedBox(width: 10.0,),
//                            Icon(Icons.arrow_forward_ios, size: 12.0,
//                              color: Colors.lightBlue,)
//                          ],)
//                        ],))
//              ),

            );

            dynamicContainerbig.add(
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                      height: j == countLongContainer-1 ? 0.0 :1.0,
                      color: Colors.grey[200],

                    )));
          }
        }
//per container 5
        dynamicContainer.add(
            Container(
                height: screenheightList[hlength],
                margin: EdgeInsets.only(
                    bottom: 2.5, top: 2.5, left: 10.0, right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
                ),
                child: Column(
                  children: dynamicContainerbig,
                )
            ));

        i = j - 1;
        detail = true;
        dynamicContainerbig = [];
        hlength++;

        //print("value oif j is:"+j.toString());

      }
    }
  }


  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery
        .of(context)
        .size
        .height * .008;
    double maxHeight = MediaQuery
        .of(context)
        .size
        .height * .82;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, 'allCategoryScreen');
              },
              child: Icon(
                Icons.arrow_back, color: Colors.lightBlue, size: 18.0,)
          ),
          title: Text('Work',
            style: TextStyle(color: Colors.black, fontSize: 14.0),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Container(
              color: Colors.white,
              // height: 667.0,
              //height:Questions.answerShow.length <3 ? MediaQuery.of(context).size.height*0.87 : (Questions.answerShow.length*60.0)+420.0,
              //height:Questions.answerShow.length <3 ? 624.0 : (Questions.answerShow.length*60.0)+420.0,
              //height: MediaQuery.of(context).size.height*0.87,

              height: MediaQuery
                  .of(context)
                  .size
                  .height * 0.87 >= screenHeight ? MediaQuery
                  .of(context)
                  .size
                  .height * 0.87 : screenHeight,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              child:
              Stack(

                children: <Widget>[

                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      child:
                      Column(

                        children: <Widget>[

//
                          Column(children: dynamicContainer,),
                          WorkChangeContainer(),

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


  Widget WorkChangeContainer()
  {

    if(Questions.workAnswerShow.length == 0)
    {

      if(Questions.LivingCheck == 2 || Questions.LivingCheck == 3)
      {
        qu.WorkAddAnswer("You", "","","", [], 60.0);
        Questions.workFirst = "FirstQuestion";
        Questions.workPartnerSingleMove = true;
        Questions.workPartnerSingleMoveCal = true;
      }

      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);

    }

    //For you for the partner
    else if(Questions.workFirst == "FirstQuestion")
      {
        print("work firs");
        Questions.workFirst = "";
        //Question No 1
        return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

    else
      {
print("kyu");
        //Answer No 1
        if(widget.CheckCompleteQuestion =="What was ${Questions.workYourIdentity} job title?" && widget.CheckQuestion == "Profession")
        {
          //Question No 2
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} take any business trips or travel for work in 2019?","Business trips",220.0,"","",[]);
        }

        //Answer No 2
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} take any business trips or travel for work in 2019?" && widget.CheckQuestion == "Business trips")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 3
            //For No 220.0
            //For Yes 430.0
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 68
            return workyesnoContainer("","Work","Have ${Questions.workYouIdentity} had costs during ${Questions.workYourIdentity} business trip for which ${Questions.workYouIdentity} were not reimbursed by ${Questions.workYourIdentity} employer?","Costs not reimbursed",220.0,"","",[]);
          }

        }


        //Answer No 3
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have an accident during your commute in 2019?" && widget.CheckQuestion == "Accident")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 12
            // For No 430.0
            // For Yes 220.0
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);

          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 4
            return workmultipleoptionsContainer("","Work","What costs did ${Questions.workYouIdentity} have due to the accident?","Costs",["Repairs","Technical report","Deductible amount","Claim for damages","Rental car","Travel costs","Medical expenses","None of these"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None of these","",[]);
          }

        }

        // ====== Costs due to accident Starts ====== //

        //Answer No 4
        else if(widget.CheckCompleteQuestion =="What costs did ${Questions.workYouIdentity} have due to the accident?" && widget.CheckQuestion == "Costs")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Repairs")
            {
             //Question No 5
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on repairs?","Repair costs",220.0,"calculation","",[]);

            }

            else if(widget.CheckAnswer[m] == "Technical report")
            {
               //Question No 6
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} pay for an expert?","Expert",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Deductible amount")
            {
              //Question No 7
              return workcalculationContainer("","Work","How much was ${Questions.workYourIdentity} deductible amount?","Deductible amount",220.0,"calculation","",[]);

            }

            else if(widget.CheckAnswer[m] == "Claim for damages")
            {
              //Question No 8
              return workcalculationContainer("","Work","How much compensation did ${Questions.workYouIdentity} pay?","Claim for damages",220.0,"calculation","",[]);

            }

            else if(widget.CheckAnswer[m] == "Rental car")
            {
              //Question No 9
              return workcalculationContainer("","Work","How much was the rental car?","Rental car",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Travel costs")
            {
              //Question No 10
              return workcalculationContainer("","Work","How much were ${Questions.workYourIdentity} travel costs?","Travel costs",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Medical expenses")
            {
              //Question No 11
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on medical expenses?","Medical expenses",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "None of these")
            {
              //Question No 12
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);
            }


          }
        }



        //Answer No 5
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on repairs?" && widget.CheckQuestion == "Repair costs")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);
        }

        //Answer No 6
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} pay for an expert?" && widget.CheckQuestion == "Expert")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);

        }


        //Answer No 7
        else if(widget.CheckCompleteQuestion =="How much was ${Questions.workYourIdentity} deductible amount?" && widget.CheckQuestion == "Deductible amount")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);

        }


        //Answer No 8
        else if(widget.CheckCompleteQuestion =="How much compensation did ${Questions.workYouIdentity} pay?" && widget.CheckQuestion == "Claim for damages")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);

        }


        //Answer No 9
        else if(widget.CheckCompleteQuestion =="How much was the rental car?" && widget.CheckQuestion == "Rental car")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);
        }


        //Answer No 10
        else if(widget.CheckCompleteQuestion =="How much were ${Questions.workYourIdentity} travel costs?" && widget.CheckQuestion == "Travel costs")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);
        }

        //Answer No 11
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on medical expenses?" && widget.CheckQuestion == "Medical expenses")
        {
          //Question No 12
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work from home?","Work from home",220.0,"","",[]);
        }



        // ====== Costs due to accident Ends ====== //

        //Answer No 12
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} work from home?" && widget.CheckQuestion == "Work from home")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 67
            return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} bought any of the following work equipment items for ${Questions.workYourIdentity} job(s) in 2019?","Purchases in the tax year",["Office furniture","Computer / laptop","Computer accessories","Mobile phone / Smartphone","Document shredder","Tools","Clothing","Briefcase","Specialist literature","Stationery","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 13
            // For No 430.0
            // For Yes 220.0
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} work in a separate room?","Separate room",220.0,"","",[]);
          }

        }

        //Answer No 13
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} work in a separate room?" && widget.CheckQuestion == "Separate room")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 67
            return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} bought any of the following work equipment items for ${Questions.workYourIdentity} job(s) in 2019?","Purchases in the tax year",["Office furniture","Computer / laptop","Computer accessories","Mobile phone / Smartphone","Document shredder","Tools","Clothing","Briefcase","Specialist literature","Stationery","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 14
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have more than one home office?","More than one home office",340.0,"","",[]);
          }

        }


        //Answer No 14
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have more than one home office?" && widget.CheckQuestion == "More than one home office")
        {

          if(widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes")
          {
            //Question No 15
            return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office for?","Type of use",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"","",[]);
          }

        }


       //Answer No 15
        else if(widget.CheckCompleteQuestion =="Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office for?" && widget.CheckQuestion == "Type of use")
        {

          if(widget.CheckAnswer[0] == "Sometimes for work (e.g. home office possibility)")
          {
            //Question No 23
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office?","Office equipment",220.0,"","",[]);
          }

          else
          {
           //Question No 16
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have the opportunity to carry out these tasks at ${Questions.workYourIdentity} employer's office?","Possible at employer?",220.0,"","",[]);
          }

        }

        //Answer No 16
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have the opportunity to carry out these tasks at ${Questions.workYourIdentity} employer's office?" && widget.CheckQuestion == "Possible at employer?")
        {

          if(widget.CheckAnswer[0] == "No")
          {
           //QuestionNo 17
            return workcalculationContainer("","Work","What is the area of ${Questions.workYourIdentity} home office in square meters?","Home office sq m",220.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 23
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office?","Office equipment",220.0,"","",[]);
          }

        }

        //Answer No 17
        else if(widget.CheckCompleteQuestion =="What is the area of ${Questions.workYourIdentity} home office in square meters?" && widget.CheckQuestion == "Home office sq m")
        {
           //QuestionNo 18
          return workcalculationContainer("","Work","What is the total area of ${Questions.workYourIdentity} apartment in square meters?","Total area in sq m",220.0,"","",[]);
        }

        //Answer No 18
        else if(widget.CheckCompleteQuestion =="What is the total area of ${Questions.workYourIdentity} apartment in square meters?" && widget.CheckQuestion == "Total area in sq m")
        {
          //Question No 19
          return workcalculationContainer("","Work","What is the total monthly cost of ${Questions.workYourIdentity} entire apartment including utilities?","Total housing costs",220.0,"calculation","",[]);
        }

        //Answer No 19
        else if(widget.CheckCompleteQuestion =="What is the total monthly cost of ${Questions.workYourIdentity} entire apartment including utilities?" && widget.CheckQuestion == "Total housing costs")
        {
          //Question No 20
          //Yaha container change hoga
          return workdateContainer("","Work","For which period of time did ${Questions.workYouIdentity} use the home office?","Time period home office",220.0,"","",[]);

        }

        //Answer No 20
        else if(widget.CheckCompleteQuestion =="For which period of time did ${Questions.workYouIdentity} use the home office?" && widget.CheckQuestion == "Time period home office")
        {
          //Question No 21
          return workyesnoContainer("","Work","The cost share of ${Questions.workYourIdentity} home office in proportion to ${Questions.workYourIdentity} total housting cost was €25.00.Is this correct?","Proportional cost",220.0,"","",[]);
        }


        //Answer No 21
        else if(widget.CheckCompleteQuestion =="The cost share of ${Questions.workYourIdentity} home office in proportion to ${Questions.workYourIdentity} total housting cost was €25.00.Is this correct?" && widget.CheckQuestion == "Proportional cost")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 22
            return workcalculationContainer("","Work","What was the proportional cost of ${Questions.workYourIdentity} home office?","Corrected proportional cost",220.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 23
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office?","Office equipment",220.0,"","",[]);
          }

        }

        //Answer No 22
        else if(widget.CheckCompleteQuestion =="What was the proportional cost of ${Questions.workYourIdentity} home office?" && widget.CheckQuestion == "Corrected proportional cost")
        {
          //Question No 23
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office?","Office equipment",220.0,"","",[]);
        }


        //Answer no 23
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office?" && widget.CheckQuestion == "Office equipment")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            Questions.homeOfficeFurniture = false;
            // Question No 24
            return workcalculationContainer("","Work","How many more home offices would ${Questions.workYouIdentity} like enter?","Number of home offices",220.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            Questions.homeOfficeFurniture = true;
            //Question no 34
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }

        }

        //Answer No 24
        else if(widget.CheckCompleteQuestion =="How many more home offices would ${Questions.workYouIdentity} like enter?" && widget.CheckQuestion == "Number of home offices")
        {
          Questions.homeOfficeFurniture = false;
          //Question no 25
          return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?","${Questions.homeOfficeLength}. type of usage",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"",Questions.homeOfficeText,[]);
        }

        //Answer No 25
        else if(widget.CheckCompleteQuestion =="Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?" && widget.CheckQuestion == "${Questions.homeOfficeLength}. type of usage")
        {

          if(widget.CheckAnswer[0] == "Sometimes for work (e.g. home office possibility)")
          {
            //Question No 33
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office? ","Office equipment",220.0,"",Questions.homeOfficeText,[]);
          }

          else
          {
            //Question No 26
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have the opportunity to carry out these tasks at ${Questions.workYourIdentity} employer's office? ","Possible at employer?",220.0,"",Questions.homeOfficeText,[]);
          }

        }

        //Answer No 26
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have the opportunity to carry out these tasks at ${Questions.workYourIdentity} employer's office? " && widget.CheckQuestion == "Possible at employer?")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 27
            return workcalculationContainer("","Work","What is the area of ${Questions.workYourIdentity} home office in sq m?","Area home office",220.0,"",Questions.homeOfficeText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 33
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office? ","Office equipment",220.0,"",Questions.homeOfficeText,[]);
          }

        }

        //Answer No 27
        else if(widget.CheckCompleteQuestion =="What is the area of ${Questions.workYourIdentity} home office in sq m?" && widget.CheckQuestion == "Area home office")
        {
          //QuestionNo 28
          return workcalculationContainer("","Work","What is the total area of ${Questions.workYourIdentity} apartment in square meters?","Total area sq m",220.0,"",Questions.homeOfficeText,[]);
        }

        //Answer No 28
        else if(widget.CheckCompleteQuestion =="What is the total area of ${Questions.workYourIdentity} apartment in square meters?" && widget.CheckQuestion == "Total area sq m")
        {
          //Question No 29
          return workcalculationContainer("","Work","What is the total monthly cost of ${Questions.workYourIdentity} entire apartment including utilities? ","Total housing costs",220.0,"calculation",Questions.homeOfficeText,[]);
        }

        //Answer No 29
        else if(widget.CheckCompleteQuestion =="What is the total monthly cost of ${Questions.workYourIdentity} entire apartment including utilities? " && widget.CheckQuestion == "Total housing costs")
        {
          //Question No 30
          //Yaha container change hoga
          return workdateContainer("","Work","For which period of time did ${Questions.workYouIdentity} use the home office?","Time period",220.0,"",Questions.homeOfficeText,[]);

        }

        //Answer No 30
        else if(widget.CheckCompleteQuestion =="For which period of time did ${Questions.workYouIdentity} use the home office?" && widget.CheckQuestion == "Time period")
        {
          //Question No 31
          return workyesnoContainer("","Work","The cost share of ${Questions.workYourIdentity} home office in proportion to ${Questions.workYourIdentity} total housting cost was €25.00.Is this correct? ","Proportional cost",220.0,"",Questions.homeOfficeText,[]);
        }


        //Answer No 31
        else if(widget.CheckCompleteQuestion =="The cost share of ${Questions.workYourIdentity} home office in proportion to ${Questions.workYourIdentity} total housting cost was €25.00.Is this correct? " && widget.CheckQuestion == "Proportional cost")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 32
            return workcalculationContainer("","Work","How much was the cost share of ${Questions.workYourIdentity} home office in relation to the total housing costs of ${Questions.workYourIdentity} apartment?","Corrected proportional cost",220.0,"calculation",Questions.homeOfficeText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 33
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office? ","Office equipment",220.0,"",Questions.homeOfficeText,[]);
          }

        }

        //Answer No 32
        else if(widget.CheckCompleteQuestion =="How much was the cost share of ${Questions.workYourIdentity} home office in relation to the total housing costs of ${Questions.workYourIdentity} apartment?" && widget.CheckQuestion == "Corrected proportional cost")
        {
          //Question No 33
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office? ","Office equipment",220.0,"",Questions.homeOfficeText,[]);
        }

        //Answer No 33
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} buy any furniture or equipment for ${Questions.workYourIdentity} home office? " && widget.CheckQuestion == "Office equipment")
        {
          if(widget.CheckAnswer[0] == "No")
          {
            if(Questions.homeOfficeLength <= Questions.totalHomeOffice)
              {
                //Question no 25
                return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?","${Questions.homeOfficeLength}. type of usage",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"",Questions.homeOfficeText,[]);
              }
              else
                {
                //furniture wala
                  //Question No 67
                  return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} bought any of the following work equipment items for ${Questions.workYourIdentity} job(s) in 2019?","Purchases in the tax year",["Office furniture","Computer / laptop","Computer accessories","Mobile phone / Smartphone","Document shredder","Tools","Clothing","Briefcase","Specialist literature","Stationery","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
            }
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question no 34
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);


          }
        }


        //Answer No 34
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on any piece of home office equipment?" && widget.CheckQuestion == "< 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 35
            return workcalculationContainer("","Work","How many items cost more than 488 EUR?","Quantity",430.0,"calculation",Questions.homeOfficeText,[]);
          }

        }

        //Answer No 35
        else if(widget.CheckCompleteQuestion =="How many items cost more than 488 EUR?" && widget.CheckQuestion == "Quantity")
        {
          //Question No 36
          return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 36
        else if(widget.CheckCompleteQuestion =="What furniture/equipment did ${Questions.workYouIdentity} buy?" && widget.CheckQuestion == "Piece of furniture")
        {

          if(widget.CheckAnswer[0] == "Desk")
          {
            //Question No 37
            return workcalculationContainer("","Work","How much was the desk?","Amount desk",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Office chair")
          {
             //Question No 42
            return workcalculationContainer("","Work","How much was the office chair?","Amount chair",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Bookshelf")
          {
            //Question No 46
            return workcalculationContainer("","Work","How much was the bookshelf?","Amount bookshelf",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Lamp")
          {
            //Question No 50
            return workcalculationContainer("","Work","How much was the lamp?","Amount lamp",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Filing cabinet")
          {
            //Question No 54
            return workcalculationContainer("","Work","How much was the filing cabinet?","Amount",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Carpet")
          {
            //Question No 58
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on the carpet?","Amount carpet",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Other")
          {
           //Question No 62
            return workcalculationContainer("","Work","What kind of furniture/equipment did ${Questions.workYouIdentity} buy?","Type",220.0,"",Questions.workFurnitureText,[]);
          }

        }

        // ====== Desk Starts ====== //
        //Answer No 37
        else if(widget.CheckCompleteQuestion =="How much was the desk?" && widget.CheckQuestion == "Amount desk")
        {
          //Question No 38
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the desk?","Purchase date desk",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 38
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the desk?" && widget.CheckQuestion == "Purchase date desk")
        {
          //Question No 39
          return workyesnoContainer("","Work","The desk will be depreciated over a period of 13 years. Do you agree?","Usual depreciation",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 39
        else if(widget.CheckCompleteQuestion =="The desk will be depreciated over a period of 13 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 40
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the desk for?","Usage desk",220.0,"",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
            {
              //Question No 36
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
            }
            else
            {
              //Question No 41
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
            }
          }

        }

        //Answer No 40
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the desk for?" && widget.CheckQuestion == "Usage desk")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }



        // ====== Desk Ends ====== //



        // ====== Office chair Starts ====== //


        //Answer No 42
        else if(widget.CheckCompleteQuestion =="How much was the office chair?" && widget.CheckQuestion == "Amount chair")
        {
          //Question No 43
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the chair?","Purchase date",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 43
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the chair?" && widget.CheckQuestion == "Purchase date")
        {
          //Question No 44
          return workyesnoContainer("","Work","The office chair will be depreciated over a period of 13 years. Do you agree?","Usual depreciation",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 44
        else if(widget.CheckCompleteQuestion =="The office chair will be depreciated over a period of 13 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 45
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the office chair for?","Usage office chair",220.0,"",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
            {
              //Question No 36
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
            }
            else
            {
              //Question No 41
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
            }
          }

        }

        //Answer No 45
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the office chair for?" && widget.CheckQuestion == "Usage office chair")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }




        // ====== Office chair Ends ====== //




        // ====== Bookshelf Starts ====== //

        //Answer No 46
        else if(widget.CheckCompleteQuestion =="How much was the bookshelf?" && widget.CheckQuestion == "Amount bookshelf")
        {
          //Question No 47
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the bookshelf?","Purchase date bookshelf",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 47
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the bookshelf?" && widget.CheckQuestion == "Purchase date bookshelf")
        {
          //Question No 48
          return workyesnoContainer("","Work","The bookshelf will be depreciated over a period of 13 years. Do you agree?","Usual depreciation",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 48
        else if(widget.CheckCompleteQuestion =="The bookshelf will be depreciated over a period of 13 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 49
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the shelf for?","Bookshelf usage",220.0,"",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
            {
              //Question No 36
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
            }
            else
            {
              //Question No 41
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
            }
          }

        }

        //Answer No 49
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the shelf for?" && widget.CheckQuestion == "Bookshelf usage")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }


        // ====== Bookshelf Ends ====== //




        // ====== Lamp Starts ====== //

        //Answer No 50
        else if(widget.CheckCompleteQuestion =="How much was the lamp?" && widget.CheckQuestion == "Amount lamp")
        {
          //Question No 51
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the lamp?","Purchase date lamp",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 51
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the lamp?" && widget.CheckQuestion == "Purchase date lamp")
        {
          //Question No 52
          return workyesnoContainer("","Work","The lamp will be depreciated over a period of 13 years. Do you agree?","Usual depreciation",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 52
        else if(widget.CheckCompleteQuestion =="The lamp will be depreciated over a period of 13 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 53
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the lamp for?","Usage lamp",220.0,"",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
            {
              //Question No 36
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
            }
            else
            {
              //Question No 41
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
            }
          }

        }

        //Answer No 53
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the lamp for?" && widget.CheckQuestion == "Usage lamp")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }


        // ====== Lamp Ends ====== //



        // ====== Filing Cabinet Starts ====== //

        //Answer No 54
        else if(widget.CheckCompleteQuestion =="How much was the filing cabinet?" && widget.CheckQuestion == "Amount")
        {
          //Question No 55
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the filing cabinet?","Purchase date cabinet",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 55
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the filing cabinet?" && widget.CheckQuestion == "Purchase date cabinet")
        {
          //Question No 56
          return workyesnoContainer("","Work","The filing cabinet will be depreciated over a period of 13 years. Do you agree?","Usual depreciation",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 56
        else if(widget.CheckCompleteQuestion =="The filing cabinet will be depreciated over a period of 13 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 57
            return workcalculationContainer("","Work","How many years are ${Questions.workYouIdentity} going to use the filing cabinet for?","Usage filing cabinet",220.0,"",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
            {
              //Question No 36
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
            }
            else
            {
              //Question No 41
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
            }
          }

        }

        //Answer No 57
        else if(widget.CheckCompleteQuestion =="How many years are ${Questions.workYouIdentity} going to use the filing cabinet for?" && widget.CheckQuestion == "Usage filing cabinet")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }


        // ====== Filing Cabinet Ends ====== //





        // ====== Carpet Starts ====== //

        //Answer No 58
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on the carpet?" && widget.CheckQuestion == "Amount carpet")
        {
          //Question No 59
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the carpet?","Purchase date",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 59
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the carpet?" && widget.CheckQuestion == "Purchase date")
        {
          //Question No 60
          return workyesnoContainer("","Work","The carpet will depreciate over 8 years. Do you agree to this depreciation period?","Usual depreciation period",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 60
        else if(widget.CheckCompleteQuestion =="The carpet will depreciate over 8 years. Do you agree to this depreciation period?" && widget.CheckQuestion == "Usual depreciation period")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 61
            return workcalculationContainer("","Work","For how many years will ${Questions.workYouIdentity} use the carpet?","Other depreciation period",220.0,"",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
            {
              //Question No 36
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
            }
            else
            {
              //Question No 41
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
            }
          }

        }

        //Answer No 61
        else if(widget.CheckCompleteQuestion =="For how many years will ${Questions.workYouIdentity} use the carpet?" && widget.CheckQuestion == "Other depreciation period")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }


        // ====== Carpet Ends ====== //




        // ====== Other Starts ====== //

        //Answer No 62
        else if(widget.CheckCompleteQuestion =="What kind of furniture/equipment did ${Questions.workYouIdentity} buy?" && widget.CheckQuestion == "Type")
        {
          //Question No 63
          return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on the ${Questions.otherFurniture}?","Amount",220.0,"calculation",Questions.workFurnitureText,[]);
        }

        //Answer No 63
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on the ${Questions.otherFurniture}?" && widget.CheckQuestion == "Amount")
        {
          //Question No 64
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the ${Questions.otherFurniture}?","Purchase date",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 64
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the ${Questions.otherFurniture}?" && widget.CheckQuestion == "Purchase date")
        {
          //Question No 65
          return workcalculationContainer("","Work","For how many years will ${Questions.workYouIdentity} use the ${Questions.otherFurniture}?","Depreciation period",220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 65
        else if(widget.CheckCompleteQuestion =="For how many years will ${Questions.workYouIdentity} use the ${Questions.otherFurniture}?" && widget.CheckQuestion == "Depreciation period")
        {

          if(Questions.workFurnitureLength <= Questions.totalWorkFurniture)
          {
            //Question No 36
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.workYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
          }
          else
          {
            //Question No 41
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?","< 952 EUR",220.0,"",Questions.homeOfficeText,[]);
          }


        }


        // ====== Other Ends ====== //



        //Answer No 41
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of home office equipment?" && widget.CheckQuestion == "< 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            if(Questions.homeOfficeLength <= Questions.totalHomeOffice && Questions.totalWorkFurniture > 0)
            {
              //Question no 25
              return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?","${Questions.homeOfficeLength}. type of usage",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"",Questions.homeOfficeText,[]);
            }

            else if(Questions.homeOfficeFurniture == true)
              {
                // Question No 24
                return workcalculationContainer("","Work","How many more home offices would ${Questions.workYouIdentity} like enter?","Number of home offices",220.0,"","",[]);
              }

            else
            {
              //Question No 67
              return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} bought any of the following work equipment items for ${Questions.workYourIdentity} job(s) in 2019?","Purchases in the tax year",["Office furniture","Computer / laptop","Computer accessories","Mobile phone / Smartphone","Document shredder","Tools","Clothing","Briefcase","Specialist literature","Stationery","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
            }
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
           //Question No 66
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on these items in total?","Total amount",220.0,"",Questions.workFurnitureText,[]);
          }

        }

       //Answer No 66
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on these items in total?" && widget.CheckQuestion == "Total amount")
        {
          if(Questions.homeOfficeLength <= Questions.totalHomeOffice && Questions.totalWorkFurniture > 0)
          {
            //Question no 25
            return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?","${Questions.homeOfficeLength}. type of usage",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"",Questions.homeOfficeText,[]);
          }

          else if(Questions.homeOfficeFurniture == true)
          {
            // Question No 24
            return workcalculationContainer("","Work","How many more home offices would ${Questions.workYouIdentity} like enter?","Number of home offices",220.0,"","",[]);
          }

          else
          {
            //furniture wala
            //Question No 67
            return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} bought any of the following work equipment items for ${Questions.workYourIdentity} job(s) in 2019?","Purchases in the tax year",["Office furniture","Computer / laptop","Computer accessories","Mobile phone / Smartphone","Document shredder","Tools","Clothing","Briefcase","Specialist literature","Stationery","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }
        }


        // Business trips Starts

        //Answer No 68
    else if(widget.CheckCompleteQuestion == "Have ${Questions.workYouIdentity} had costs during ${Questions.workYourIdentity} business trip for which ${Questions.workYouIdentity} were not reimbursed by ${Questions.workYourIdentity} employer?" && widget.CheckQuestion == "Costs not reimbursed")
    {


    if(widget.CheckAnswer[0] == "No")
    {
    //Question No 69
      return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive reimbursements from ${Questions.workYourIdentity} employer for daily allowances?","Reimbursement daily allowances",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[0] == "Yes")
    {
          //Question No 92
      return workcalculationContainer("","Work","How many business trips did ${Questions.workYouIdentity} take in 2019?","Number of business trips",280.0,"","",[]);

    }

    }


    //Answer No 69
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} receive reimbursements from ${Questions.workYourIdentity} employer for daily allowances?" && widget.CheckQuestion == "Reimbursement daily allowances")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 70
           return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} also travel abroad?","Travelled abroad",220.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question no 89
            return workyesnoContainer("","Work","Were ${Questions.workYouIdentity} fully reimbursed for daily allowances?","Fully reimbursed",220.0,"","",[]);
          }

        }


        //Answer No 70
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} also travel abroad?" && widget.CheckQuestion == "Travelled abroad")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 71
            //For No  and 24 hours 370.0
            //For Rest 270.0
            return workmultithreeContainer("","Work","Do any of the mentioned absences apply to ${Questions.workYouIdentity} while ${Questions.workYouIdentity} were on a business trip?","Absence business trips",["More than 8 hours","24 hours due to overnight stays","Arrival/departure due to overnight stays","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);

          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
           //Question No 80
            return workcalculationContainer("","Work","How many countries did ${Questions.workYouIdentity} travel to due to business trips?","Number of countries",280.0,"loop","",[]);
          }

        }


        // Travel Abroad No Starts

        //Answer No 71
        else if(widget.CheckCompleteQuestion =="Do any of the mentioned absences apply to ${Questions.workYouIdentity} while ${Questions.workYouIdentity} were on a business trip?" && widget.CheckQuestion == "Absence business trips")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "More than 8 hours")
            {
              //Question No 72
              return workcalculationbigContainer("","Work","How many day trips did ${Questions.workYouIdentity} take? (exclude those already stated in external activities)","One day trips",370.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "24 hours due to overnight stays")
            {
              //Question No 74
              return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received any free meals?","Complimentary meals",["Free breakfast","Free lunch","Free dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);

            }

            else if(widget.CheckAnswer[m] == "Arrival/departure due to overnight stays")
            {
              //Question No 73

              return workcalculationbigContainer("","Work","How many departure and arrival days did ${Questions.workYouIdentity} have for business trips with overnight stays? (exclude those already stated in external activities)?","Departure / arrival days",370.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {
              //Question No 74
              return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received any free meals?","Complimentary meals",["Free breakfast","Free lunch","Free dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);

            }

          }
        }


        //Answer No 72
        else if(widget.CheckCompleteQuestion =="How many day trips did ${Questions.workYouIdentity} take? (exclude those already stated in external activities)" && widget.CheckQuestion == "One day trips")
        {
          //Question No 74
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received any free meals?","Complimentary meals",["Free breakfast","Free lunch","Free dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        //Answer No 73
        else if(widget.CheckCompleteQuestion =="How many departure and arrival days did ${Questions.workYouIdentity} have for business trips with overnight stays? (exclude those already stated in external activities)?" && widget.CheckQuestion == "Departure / arrival days")
        {
          //Question No 74
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received any free meals?","Complimentary meals",["Free breakfast","Free lunch","Free dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        //Answer No 74
        else if(widget.CheckCompleteQuestion =="Have ${Questions.workYouIdentity} received any free meals?" && widget.CheckQuestion == "Complimentary meals")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Free breakfast")
            {
              //Question No 75
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} receive complimentary breakfast?","Complimentary breakfast",220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Free lunch")
            {

              //Question No 76
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary lunch?","Free lunch",220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Free dinner")
            {
              //Question No 77
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary dinner?","Free dinner",220.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {
             //Question No 78
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);

            }

          }
        }


        //Answer No 75
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} receive complimentary breakfast?" && widget.CheckQuestion == "Complimentary breakfast")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }

        //Answer No 76
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary lunch?" && widget.CheckQuestion == "Free lunch")
        {
           //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }


        //Answer No 77
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary dinner?" && widget.CheckQuestion == "Free dinner")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }


        //Answer No 78
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?" && widget.CheckQuestion == "Passport or visa")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 3
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);

          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 79
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on that?","Passport & visa costs",220.0,"calculation","",[]);
          }

        }


        //Answer No 79
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on that?" && widget.CheckQuestion == "Passport & visa costs")
        {
          //Question No 3
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
        }



        // Travel Abroad No Ends



        //Travel Abroad Yes Starts

        //Answer No 80
        else if(widget.CheckCompleteQuestion == "How many countries did ${Questions.workYouIdentity} travel to due to business trips?" && widget.CheckQuestion == "Number of countries")
        {
          //Question No 81
          return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
        }


        //Answer No 81
        else if(widget.CheckCompleteQuestion =="What was ${Questions.healthYourIdentity} destination?" && widget.CheckQuestion == "Destination ${Questions.workBusTripLength}")
        {

          if(widget.CheckAnswer[0] == "Germany")
          {
            //Question No 82
            //For No  and 24 hours 370.0
            //For Rest 270.0
            return workmultithreeContainer("","Work","Do any of these kind of absences apply to ${Questions.workYouIdentity} while ${Questions.workYouIdentity} on business trip no. ${Questions.workBusTripLength}?","Absence ${Questions.workBusTripLength}",["More than 8 hours","24 hours due to overnight stay","Arrival/departure due to overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.workBusTripText,[]);

          }

          else if(widget.CheckAnswer[0] == "Abroad")
          {
            //Question No 82
            //For No  and 24 hours 370.0
            //For Rest 270.0
            return workmultithreeContainer("","Work","Do any of these kind of absences apply to ${Questions.workYouIdentity} while ${Questions.workYouIdentity} on business trip no. ${Questions.workBusTripLength}?","Absence ${Questions.workBusTripLength}",["More than 8 hours","24 hours due to overnight stay","Arrival/departure due to overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.workBusTripText,[]);
          }

        }


        //Answer No 82
        else if(widget.CheckCompleteQuestion =="Do any of these kind of absences apply to ${Questions.workYouIdentity} while ${Questions.workYouIdentity} on business trip no. ${Questions.workBusTripLength}?" && widget.CheckQuestion == "Absence ${Questions.workBusTripLength}")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "More than 8 hours")
            {
              //Question No 83
              return workcalculationContainer("","Work","How many days have ${Questions.workYouIdentity} been away for more than 8 hours for destination ${Questions.workBusTripLength}?","Days >8h",370.0,"",Questions.workBusTripText,[]);
            }

            else if(widget.CheckAnswer[m] == "24 hours due to overnight stay")
            {
              if(Questions.workBusTripLength <= Questions.totalWorkBusTrip)
              {
                //Question No 81
                return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
              }
              else
              {
                //Question No 3
                return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
              }

            }

            else if(widget.CheckAnswer[m] == "Arrival/departure due to overnight stay")
            {
              //Question No 84
              return workcalculationContainer("","Work","How many days did ${Questions.workYouIdentity} depart or arrive due to overnight stays to destination no. ${Questions.workBusTripLength}?","Departure / arrival days",370.0,"",Questions.workBusTripText,[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {

              if(Questions.workBusTripLength <= Questions.totalWorkBusTrip)
              {
                //Question No 81
                return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
              }
              else
              {
                //Question No 3
                return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
              }

            }

          }
        }


        //Answer No 83
        else if(widget.CheckCompleteQuestion =="How many days have ${Questions.workYouIdentity} been away for more than 8 hours for destination ${Questions.workBusTripLength}?" && widget.CheckQuestion == "Days >8h")
        {
            //Question No 85
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received any free meals? ","Complimentary meals",["Free breakfast","Free Lunch","Free Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.workBusTripText,[]);

        }


        //Answer No 84
        else if(widget.CheckCompleteQuestion =="How many days did ${Questions.workYouIdentity} depart or arrive due to overnight stays to destination no. ${Questions.workBusTripLength}?" && widget.CheckQuestion == "Departure / arrival days")
        {
          //Question No 85
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received any free meals? ","Complimentary meals",["Free breakfast","Free Lunch","Free Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.workBusTripText,[]);
        }

        //Answer No 85
        else if(widget.CheckCompleteQuestion =="Have ${Questions.workYouIdentity} received any free meals? " && widget.CheckQuestion == "Complimentary meals")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Free breakfast")
            {
              //Question No 86
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} receive complimentary breakfast? ","Complimentary breakfast",220.0,"",Questions.workBusTripText,[]);
            }

            else if(widget.CheckAnswer[m] == "Free Lunch")
            {

              //Question No 87
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary lunch? ","Free lunch",220.0,"",Questions.workBusTripText,[]);
            }

            else if(widget.CheckAnswer[m] == "Free Dinner")
            {
              //Question No 88
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary dinner? ","Free dinner",220.0,"",Questions.workBusTripText,[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {
              if(Questions.workBusTripLength <= Questions.totalWorkBusTrip)
              {
                //Question No 81
                return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
              }
              else
              {
                //Question No 3
                return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
              }
            }

          }
        }


        //Answer No 86
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} receive complimentary breakfast? " && widget.CheckQuestion == "Complimentary breakfast")
        {

          if(Questions.workBusTripLength <= Questions.totalWorkBusTrip)
            {
              //Question No 81
              return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
            }
            else
              {
                //Question No 3
                return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
              }


        }

        //Answer No 87
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary lunch? " && widget.CheckQuestion == "Free lunch")
        {
          if(Questions.workBusTripLength <= Questions.totalWorkBusTrip)
          {
            //Question No 81
            return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
          }
          else
          {
            //Question No 3
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
          }

        }


        //Answer No 88
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary dinner? " && widget.CheckQuestion == "Free dinner")
        {
          if(Questions.workBusTripLength <= Questions.totalWorkBusTrip)
          {
            //Question No 81
            return worktwooptionContainer("","Work","What was ${Questions.healthYourIdentity} destination?","Destination ${Questions.workBusTripLength}",["Germany","Abroad"],370.0,"",Questions.workBusTripText,[]);
          }
          else
          {
            //Question No 3
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have an accident during your commute in 2019?","Accident",220.0,"","",[]);
          }

        }


        //Travel Abroad Yes Ends



       // ====== Receive Reimbursements Yes Starts ===== //



        //Answer No 89
        else if(widget.CheckCompleteQuestion =="Were ${Questions.workYouIdentity} fully reimbursed for daily allowances?" && widget.CheckQuestion == "Fully reimbursed")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 90
            return workcalculationbigContainer("","Work","What was the total reimbursement for daily allowances ${Questions.workYouIdentity} received from ${Questions.workYourIdentity} employer (not included in your payslip) in 2019?","Reimbursement daily allowances",220.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
                //Question No 91
            return workyesnoContainer("","Work","Is this reimbursement shown in ${Questions.workYourIdentity} payslip in line 20?","In payslip",220.0,"","",[]);
          }

        }

        //Answer No 90
        else if(widget.CheckCompleteQuestion =="What was the total reimbursement for daily allowances ${Questions.workYouIdentity} received from ${Questions.workYourIdentity} employer (not included in your payslip) in 2019?" && widget.CheckQuestion == "Reimbursement daily allowances")
        {
          //Question No 70
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} also travel abroad?","Travelled abroad",220.0,"","",[]);
        }


        //Answer No 91
        else if(widget.CheckCompleteQuestion =="Is this reimbursement shown in ${Questions.workYourIdentity} payslip in line 20?" && widget.CheckQuestion == "In payslip")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 78
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);

          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 70
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} also travel abroad?","Travelled abroad",220.0,"","",[]);
          }

        }

        // ====== Receive Reimbursements Yes Ends ===== //


        // ====== Costs During Business trips Starts ====== //

          //Answer No 92
        else if(widget.CheckCompleteQuestion =="How many business trips did ${Questions.workYouIdentity} take in 2019?" && widget.CheckQuestion == "Number of business trips")
        {
          //Question No 93
          return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} travelled to on this trip?","Destination trip ${Questions.workBusCostLength}",["Germany","Abroad"],430.0,"",Questions.workBusCostText,[]);
        }

        //Answer No 93
        else if(widget.CheckCompleteQuestion =="Where have ${Questions.workYouIdentity} travelled to on this trip?" && widget.CheckQuestion == "Destination trip ${Questions.workBusCostLength}")
        {

          if(widget.CheckAnswer[0] == "Germany")
          {
          //Question No 94
            return workmultipleoptionsContainer("","Work","Which modes of transport did ${Questions.workYouIdentity} use for this business trip?","Means of transport",["By car","Bus / train","Airplane","Company car","Company transport"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.workBusCostText,[]);

          }

          else if(widget.CheckAnswer[0] == "Abroad")
          {
//Question No 94
            return workmultipleoptionsContainer("","Work","Which modes of transport did ${Questions.workYouIdentity} use for this business trip?","Means of transport",["By car","Bus / train","Airplane","Company car","Company transport"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.workBusCostText,[]);
          }

        }


        //Answer No 94
        else if(widget.CheckCompleteQuestion =="Which modes of transport did ${Questions.workYouIdentity} use for this business trip?" && widget.CheckQuestion == "Means of transport")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "By car")
            {
              //Question No 95
              //Ya container change hoga
              return workcalculationContainer("","Work","From where to where did ${Questions.workYouIdentity} go by car for trip no. ${Questions.workBusCostLength}?","Distance ${Questions.workBusCostLength}",220.0,"",Questions.workBusCostText,[]);

            }

            else if(widget.CheckAnswer[m] == "Bus / train")
            {
             //Question No 109
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} pay in total for travels by train on business trip no. ${Questions.workBusCostLength}?","Travel costs",220.0,"calculation",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Airplane")
            {
             //Question No 111
              return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on flight tickets?","Air fares",220.0,"calculation",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Company car")
            {
               //Question No 110
              return workdateContainer("","Work","From when to when did ${Questions.workYouIdentity} travel for business trip no. ${Questions.workBusCostLength}?","Period ${Questions.workBusCostLength}",220.0,"",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Company transport")
            {
              //Question No 110
              return workdateContainer("","Work","From when to when did ${Questions.workYouIdentity} travel for business trip no. ${Questions.workBusCostLength}?","Period ${Questions.workBusCostLength}",220.0,"",Questions.workBusCostText,[]);
            }

          }
        }


        //Car starts


        //Answer No 95
        else if(widget.CheckCompleteQuestion =="From where to where did ${Questions.workYouIdentity} go by car for trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Distance ${Questions.workBusCostLength}")
        {
          //Question No 96
          return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} take this route?","Number of drives",370.0,"loop",Questions.workBusCostText,[]);

        }



        //Answer No 96
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} take this route?" && widget.CheckQuestion == "Number of drives")
        {
          //Question No 97
          return workmultithreeContainer("","Work","Do any of the following absences apply to the trip no. ${Questions.workBusCostLength}?","Absence",["More than 8 hours","Arrival/departure due to overnight stay","Full days","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);

        }
        //Car ends


      //Bus/Train Starts
//Answer No 109
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} pay in total for travels by train on business trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Travel costs")
        {
          //Question No 110
          return workdateContainer("","Work","From when to when did ${Questions.workYouIdentity} travel for business trip no. ${Questions.workBusCostLength}?","Period ${Questions.workBusCostLength}",220.0,"",Questions.workBusCostText,[]);

        }
        //Bus/Train Ends


        // Airplane Starts

        //Answer No 111
        else if(widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent on flight tickets?" && widget.CheckQuestion == "Air fares")
        {
          //Question No 110
          return workdateContainer("","Work","From when to when did ${Questions.workYouIdentity} travel for business trip no. ${Questions.workBusCostLength}?","Period ${Questions.workBusCostLength}",220.0,"",Questions.workBusCostText,[]);

        }


        //Airplane ends



        //Answer No 110
        else if(widget.CheckCompleteQuestion =="From when to when did ${Questions.workYouIdentity} travel for business trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Period ${Questions.workBusCostLength}")
        {
          //Question No 101
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received free meals?  ","Complimentary meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);

        }






        //Answer No 97
        else if(widget.CheckCompleteQuestion =="Do any of the following absences apply to the trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Absence")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "More than 8 hours")
            {
             //Question No 99
              return workcalculationContainer("","Work","How often have ${Questions.workYouIdentity} been away for more than 8 hours on business trip no. ${Questions.workBusCostLength}?","Days >8 hours",370.0,"",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Arrival/departure due to overnight stay")
            {
               //Question No 100
              return workcalculationContainer("","Work","How many days did ${Questions.workYouIdentity} arrive and depart on trip no. ${Questions.workBusCostLength}?","Arrival/Departure days",370.0,"",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Full days")
            {
              //Question No 98
              return workmultithreeContainer("","Work","What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?","Reimbursement ${Questions.workBusCostLength}",["Travel costs","Accommodation costs","Daily allowances","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None",Questions.workBusCostText,[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {

              //Question No 98
              return workmultithreeContainer("","Work","What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?","Reimbursement ${Questions.workBusCostLength}",["Travel costs","Accommodation costs","Daily allowances","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None",Questions.workBusCostText,[]);
            }

          }
        }


        //Answer No 99
        else if(widget.CheckCompleteQuestion =="How often have ${Questions.workYouIdentity} been away for more than 8 hours on business trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Days >8 hours")
        {
          //Question No 101
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received free meals?  ","Complimentary meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }

        //Answer No 100
        else if(widget.CheckCompleteQuestion =="How many days did ${Questions.workYouIdentity} arrive and depart on trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Arrival/Departure days")
        {
         //Question No 101
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} received free meals?  ","Complimentary meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        //Answer No 101

        else if(widget.CheckCompleteQuestion =="Have ${Questions.workYouIdentity} received free meals?  " && widget.CheckQuestion == "Complimentary meals")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Breakfast")
            {
              //Question No 102
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} receive complimentary breakfast?  ","Complimentary breakfast",370.0,"",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Lunch")
            {
              //Question No 103
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary lunch?  ","Free Lunch",370.0,"",Questions.workBusCostText,[]);

            }

            else if(widget.CheckAnswer[m] == "Dinner")
            {
              //Question No 104
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary dinner?  ","Free Dinner",370.0,"",Questions.workBusCostText,[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {
              //Question No 98
              return workmultithreeContainer("","Work","What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?","Reimbursement ${Questions.workBusCostLength}",["Travel costs","Accommodation costs","Daily allowances","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None",Questions.workBusCostText,[]);
            }

          }
        }


        //Answer No 102
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} receive complimentary breakfast?  " && widget.CheckQuestion == "Complimentary breakfast")
        {
          //Question No 98
          return workmultithreeContainer("","Work","What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?","Reimbursement ${Questions.workBusCostLength}",["Travel costs","Accommodation costs","Daily allowances","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None",Questions.workBusCostText,[]);
        }


        //Answer No 103
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary lunch?  " && widget.CheckQuestion == "Free Lunch")
        {
//Question No 98
          return workmultithreeContainer("","Work","What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?","Reimbursement ${Questions.workBusCostLength}",["Travel costs","Accommodation costs","Daily allowances","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None",Questions.workBusCostText,[]);
        }



    //Answer No 104
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary dinner?  " && widget.CheckQuestion == "Free Dinner")
        {
//Question No 98
          return workmultithreeContainer("","Work","What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?","Reimbursement ${Questions.workBusCostLength}",["Travel costs","Accommodation costs","Daily allowances","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None",Questions.workBusCostText,[]);
        }


        //Answer No 98
        else if(widget.CheckCompleteQuestion =="What costs were you reimbursed for on business trip no. ${Questions.workBusCostLength}?" && widget.CheckQuestion == "Reimbursement ${Questions.workBusCostLength}")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Travel costs")
            {
             //Question No 105
              return workcalculationContainer("","Work","How much of the travel expenses from ${Questions.workYourIdentity} business trip were ${Questions.workYouIdentity} reimbursed by ${Questions.workYourIdentity} employer?","Reimbursement travel costs",220.0,"calculation",Questions.workBusCostText,[]);
            }

            else if(widget.CheckAnswer[m] == "Accommodation costs")
            {
             //Question No 106
              return workcalculationContainer("","Work","How much was reimbursed for accommodation by ${Questions.workYourIdentity} employer?","Reimbursement accommodation",220.0,"calculation",Questions.workBusCostText,[]);

            }

            else if(widget.CheckAnswer[m] == "Daily allowances")
            {
            //Question No 107
              return workcalculationContainer("","Work","How much was the total amount reimbursed for meals and expenses during ${Questions.workYourIdentity} business trip?","Reimbursement amount",220.0,"calculation",Questions.workBusCostText,[]);

            }

            else if(widget.CheckAnswer[m] == "None")
            {
              if(Questions.workBusCostLength <= Questions.totalWorkBusCost)
              {
                //Question No 93
                return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} travelled to on this trip?","Destination trip ${Questions.workBusCostLength}",["Germany","Abroad"],430.0,"",Questions.workBusCostText,[]);
              }
              else{
                //Question No 108
                return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any further costs during ${Questions.workYourIdentity} business trip?","Additional travel costs",["Baggage fees","Business calls","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
              }
            }

          }
        }


        //Answer No 105
        else if(widget.CheckCompleteQuestion =="How much of the travel expenses from ${Questions.workYourIdentity} business trip were ${Questions.workYouIdentity} reimbursed by ${Questions.workYourIdentity} employer?" && widget.CheckQuestion == "Reimbursement travel costs")
        {
          if(Questions.workBusCostLength <= Questions.totalWorkBusCost)
            {
              //Question No 93
              return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} travelled to on this trip?","Destination trip ${Questions.workBusCostLength}",["Germany","Abroad"],430.0,"",Questions.workBusCostText,[]);
            }
            else{
              //Question No 108
            return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any further costs during ${Questions.workYourIdentity} business trip?","Additional travel costs",["Baggage fees","Business calls","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }
        }


        //Answer No 106
        else if(widget.CheckCompleteQuestion =="How much was reimbursed for accommodation by ${Questions.workYourIdentity} employer?" && widget.CheckQuestion == "Reimbursement accommodation")
        {
          if(Questions.workBusCostLength <= Questions.totalWorkBusCost)
          {
            //Question No 93
            return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} travelled to on this trip?","Destination trip ${Questions.workBusCostLength}",["Germany","Abroad"],430.0,"",Questions.workBusCostText,[]);
          }
          else{
            //Question No 108
            return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any further costs during ${Questions.workYourIdentity} business trip?","Additional travel costs",["Baggage fees","Business calls","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }
        }

        //Answer No 107
        else if(widget.CheckCompleteQuestion =="How much was the total amount reimbursed for meals and expenses during ${Questions.workYourIdentity} business trip?" && widget.CheckQuestion == "Reimbursement amount")
        {
          if(Questions.workBusCostLength <= Questions.totalWorkBusCost)
          {
            //Question No 93
            return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} travelled to on this trip?","Destination trip ${Questions.workBusCostLength}",["Germany","Abroad"],430.0,"",Questions.workBusCostText,[]);
          }
          else{
            //Question No 108
            return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any further costs during ${Questions.workYourIdentity} business trip?","Additional travel costs",["Baggage fees","Business calls","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }
        }
        // ====== Costs During Business trips Ends ====== //


        // ====== Additional Travel Costs Starts ====== //
        //Answer No 108
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have any further costs during ${Questions.workYourIdentity} business trip?" && widget.CheckQuestion == "Additional travel costs")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Baggage fees")
            {
              //Question No 112
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on baggage storage?","Baggage fees",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Business calls")
            {
              //Question No 113
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on business calls?","Business calls",220.0,"calculation","",[]);

            }

            else if(widget.CheckAnswer[m] == "Toll charges")
            {
              //Question No 114
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on toll charges?","Toll charges",220.0,"calculation","",[]);

            }

            else if(widget.CheckAnswer[m] == "Parking fees")
            {
              //Question No 115
              return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on parking fees?","Parking fees",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Other costs")
            {
              //Question No 116
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on other travel expenses?","Other travel expenses",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "No")
            {
             //Question No 78
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
            }

          }
        }

        //Answer No 112
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on baggage storage?" && widget.CheckQuestion == "Baggage fees")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }

        //Answer No 113
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on business calls?" && widget.CheckQuestion == "Business calls")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }

        //Answer No 114
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on toll charges?" && widget.CheckQuestion == "Toll charges")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }

        //Answer No 115
        else if(widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent on parking fees?" && widget.CheckQuestion == "Parking fees")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }


        //Answer No 116
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on other travel expenses?" && widget.CheckQuestion == "Other travel expenses")
        {
          //Question No 78
          return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} apply for a passport or visa for a business trip?","Passport or visa",220.0,"","",[]);
        }



        // ====== Additional Travel Costs Ends ====== //

        // Business trips Ends


        // ====== Work Equipment Items Starts ====== //

        //Answer No 67


        else if(widget.CheckCompleteQuestion =="Have ${Questions.workYouIdentity} bought any of the following work equipment items for ${Questions.workYourIdentity} job(s) in 2019?" && widget.CheckQuestion == "Purchases in the tax year")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Office furniture")
            {
              //Question No 149
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on any piece of office furniture?","> 952 EUR",220.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "Computer / laptop")
            {

              //Question No 118
              return workcalculationContainer("","Work","How much was the computer?","Amount computer",370.0,"calculation","",[]);


            }

            else if(widget.CheckAnswer[m] == "Computer accessories")
            {
             //Question No 119
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on any computer accessory?","Accessory over 952 EUR",220.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "Mobile phone / Smartphone")
            {
             //Question No 123
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on a mobile phone?","Mobile phone over 952 EUR",220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Document shredder")
            {
              //Question No 127
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on a paper shredder?","Shredder over 952 EUR",220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Tools")
            {
              //Question no 131
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on any work tool?","Tools over 952 EUR",220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Clothing")
            {
              //Question no 137
              return workmultipleoptionsContainer("","Work","Which kind of work clothes did ${Questions.workYouIdentity} buy?","Kind of clothes",["Protective clothing (e.g. helmet, coat)","Uniform (e.g. police)","Clothing with permanent company logo","Official robes (e.g. as a judge)","White clothes (e.g. for medical professions)","Other that excludes a private usage","None of them"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None of them","",[]);
            }

            else if(widget.CheckAnswer[m] == "Briefcase")
            {
               //Question No 141
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than 952 EUR on a briefcase?","Briefcase over 952 EUR",220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Specialist literature")
            {
              //Question no 147
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on specialist literature?","Amount literature",370.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Stationery")
            {
              //Question no 148
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on stationery?","Amount stationery",370.0,"calculation","",[]);
            }



            else if(widget.CheckAnswer[m] == "No")
            {
              //Question No 117
              return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
            }

          }
        }


        // ===== Office furniture Starts ======

        //Answer No 149
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on any piece of office furniture?" && widget.CheckQuestion == "> 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
           //Question No 150
            return workcalculationContainer("","Work","How many pieces of furniture ${Questions.workYouIdentity} bought were over 488 EUR?","Quantity",430.0,"","",[]);

          }

        }

        //Answer No 150
        else if(widget.CheckCompleteQuestion =="How many pieces of furniture ${Questions.workYouIdentity} bought were over 488 EUR?" && widget.CheckQuestion == "Quantity")
        {
          //Question No 151
          return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 151
        else if(widget.CheckCompleteQuestion =="What furniture did ${Questions.workYouIdentity} buy?" && widget.CheckQuestion == "Furniture")
        {

          if(widget.CheckAnswer[0] == "Desk")
          {
           //Question No 152
            return workcalculationContainer("","Work","How much was the desk? ","Amount desk",220.0,"calculation",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Office chair")
          {
           //Question No 157
            return workcalculationContainer("","Work","How much was the office chair? ","Amount office chair",220.0,"calculation",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Bookshelf")
          {
//Question No 161
            return workcalculationContainer("","Work","How much was the bookshelf? ","Amount Bookshelf",220.0,"calculation",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Lamp")
          {
   //Question No 165
            return workcalculationContainer("","Work","How much was the lamp? ","Amount lamp",220.0,"calculation",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Filing cabinet")
          {
       //Question No 169
            return workcalculationContainer("","Work","How much was the filing cabinet? ","Amount",220.0,"calculation",Questions.officeFurnitureText,[]);
          }


          else if(widget.CheckAnswer[0] == "Other")
          {
           //Question No 173
            return workcalculationContainer("","Work","What kind of furniture did you buy? ","Type",220.0,"",Questions.officeFurnitureText,[]);
          }

        }



        // ====== Desk Starts ======

         //Answer No 152
        else if(widget.CheckCompleteQuestion =="How much was the desk? " && widget.CheckQuestion == "Amount desk")
        {
          //Question No 153
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the desk? ","Purchase date desk",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 153
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the desk? " && widget.CheckQuestion == "Purchase date desk")
        {
          //Question No 154
          return workyesnoContainer("","Work","The desk will be depreciated over a period of 13 years. Do you agree? ","Usual depreciation",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 154
        else if(widget.CheckCompleteQuestion =="The desk will be depreciated over a period of 13 years. Do you agree? " && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 155
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the desk for? ","Usage desk",220.0,"",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
            {
              //Question No 151
              return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
            }
            else
            {
              //Question No 156
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
            }
          }

        }

        //Answer No 155
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the desk for? " && widget.CheckQuestion == "Usage desk")
        {

          if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
          {
            //Question No 151
            return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
          }
          else
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }


        }

        // ====== Desk Ends ======



       // ======= Office chair Starts ====== //


        //Answer No 157
        else if(widget.CheckCompleteQuestion =="How much was the office chair? " && widget.CheckQuestion == "Amount office chair")
        {
          //Question No 158
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the office chair? ","Purchase date office chair",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 158
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the office chair? " && widget.CheckQuestion == "Purchase date office chair")
        {
          //Question No 159
          return workyesnoContainer("","Work","The office chair will be depreciated over a period of 13 years. Do you agree? ","Usual depreciation",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 159
        else if(widget.CheckCompleteQuestion =="The office chair will be depreciated over a period of 13 years. Do you agree? " && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 160
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the office chair for? ","Usage office chair",220.0,"",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
            {
              //Question No 151
              return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
            }
            else
            {
              //Question No 156
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
            }
          }

        }

        //Answer No 160
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the office chair for? " && widget.CheckQuestion == "Usage office chair")
        {

          if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
          {
            //Question No 151
            return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
          }
          else
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }


        }


        // ====== Office chair Ends ======= //

          // ======= Bookshelf Starts ====== //

        //Answer No 161
        else if(widget.CheckCompleteQuestion =="How much was the bookshelf? " && widget.CheckQuestion == "Amount Bookshelf")
        {
          //Question No 162
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the bookshelf? ","Purchase date bookshelf",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 162
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the bookshelf? " && widget.CheckQuestion == "Purchase date bookshelf")
        {
          //Question No 163
          return workyesnoContainer("","Work","The bookshelf will be depreciated over a period of 13 years. Do you agree? ","Usual depreciation",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 163
        else if(widget.CheckCompleteQuestion =="The bookshelf will be depreciated over a period of 13 years. Do you agree? " && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 164
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the shelf for? ","Usage Bookshelf",220.0,"",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
            {
              //Question No 151
              return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
            }
            else
            {
              //Question No 156
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
            }
          }

        }

        //Answer No 164
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the shelf for? " && widget.CheckQuestion == "Usage Bookshelf")
        {

          if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
          {
            //Question No 151
            return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
          }
          else
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }


        }

        // ======= Bookshelf Ends ====== //


        // ===== Lamp Starts ===== //

        //Answer No 165
        else if(widget.CheckCompleteQuestion =="How much was the lamp? " && widget.CheckQuestion == "Amount lamp")
        {
          //Question No 166
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the lamp? ","Purchase date lamp",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 166
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the lamp? " && widget.CheckQuestion == "Purchase date lamp")
        {
          //Question No 167
          return workyesnoContainer("","Work","The lamp will be depreciated over a period of 13 years. Do you agree? ","Usual depreciation",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 167
        else if(widget.CheckCompleteQuestion =="The lamp will be depreciated over a period of 13 years. Do you agree? " && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 168
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the lamp for? ","Usage lamp",220.0,"",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
            {
              //Question No 151
              return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
            }
            else
            {
              //Question No 156
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
            }
          }

        }

        //Answer No 168
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the lamp for? " && widget.CheckQuestion == "Usage lamp")
        {

          if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
          {
            //Question No 151
            return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
          }
          else
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }


        }




        // ===== Lamp Ends ===== //



        // ====== Filing cabinet Starts ====== //

        //Answer No 169
        else if(widget.CheckCompleteQuestion =="How much was the filing cabinet? " && widget.CheckQuestion == "Amount")
        {
          //Question No 170
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the filing cabinet? ","Purchase date",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 170
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the filing cabinet? " && widget.CheckQuestion == "Purchase date")
        {
          //Question No 171
          return workyesnoContainer("","Work","The filing cabinet will be depreciated over a period of 13 years. Do you agree? ","Usual depreciation",220.0,"",Questions.officeFurnitureText,[]);
        }

        //Answer No 171
        else if(widget.CheckCompleteQuestion =="The filing cabinet will be depreciated over a period of 13 years. Do you agree? " && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            // Question No 172
            return workcalculationContainer("","Work","How many years are ${Questions.workYouIdentity} going to use the filing cabinet for? ","Amount",220.0,"",Questions.officeFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
            {
              //Question No 151
              return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
            }
            else
            {
              //Question No 156
              return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
            }
          }

        }

        //Answer No 172
        else if(widget.CheckCompleteQuestion =="How many years are ${Questions.workYouIdentity} going to use the filing cabinet for? " && widget.CheckQuestion == "Amount")
        {

          if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
          {
            //Question No 151
            return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
          }
          else
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }


        }
        // ====== Filing cabinet Ends ====== //


        // ===== Other Starts ===== //

        //Answer No 173
        else if(widget.CheckCompleteQuestion =="What kind of furniture did you buy? " && widget.CheckQuestion == "Type")
        {
          //Question No 174
          return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on the ${Questions.otherOfficeFurniture}? ","Amount",220.0,"calculation",Questions.officeFurnitureText,[]);
        }

//Answer No 174
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on the ${Questions.otherOfficeFurniture}? " && widget.CheckQuestion == "Amount")
        {
          //Question No 175
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the ${Questions.otherOfficeFurniture}? ","Purchase date",220.0,"",Questions.officeFurnitureText,[]);
        }


        //Answer No 175
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the ${Questions.otherOfficeFurniture}? " && widget.CheckQuestion == "Purchase date")
        {
          // Question No 176
          return workcalculationContainer("","Work","For how many years will ${Questions.workYouIdentity} use the ${Questions.otherOfficeFurniture}? ","Depreciation period",220.0,"",Questions.officeFurnitureText,[]);
        }


        //Answer No 176
        else if(widget.CheckCompleteQuestion =="For how many years will ${Questions.workYouIdentity} use the ${Questions.otherOfficeFurniture}? " && widget.CheckQuestion == "Depreciation period")
        {

          if(Questions.officeFurnitureLength <= Questions.totalOfficeFurniture)
          {
            //Question No 151
            return workdifferentoptionContainer("","Work","What furniture did ${Questions.workYouIdentity} buy?","Furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.officeFurnitureText,[]);
          }
          else
          {
            //Question No 156
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"","",[]);
          }


        }


        // ===== Other Ends ===== //


        //Answer No 156

        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend less than 952 EUR on any piece of office furniture?" && widget.CheckQuestion == "< 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 117
            return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 177
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on these items in total?","Amount office furniture",220.0,"calculation","",[]);

          }

        }

        //Answer No 177

        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on these items in total?" && widget.CheckQuestion == "Amount office furniture")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ===== Office furniture Ends ======




        // ====== Computer / laptop Starts ====== //

         //Answer no 118
        else if(widget.CheckCompleteQuestion =="How much was the computer?" && widget.CheckQuestion == "Amount computer")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }



        // ====== Computer / laptop Ends ====== //


        // ====== Computer accessories Starts ===== //

        //Answer No 119

        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on any computer accessory?" && widget.CheckQuestion == "Accessory over 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 120
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on computer accessories?","Amount accessories",370.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 121
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on computer accessories? ","Amount accessories",220.0,"calculation","",[]);
          }

        }


        //Answer No 120
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on computer accessories?" && widget.CheckQuestion == "Amount accessories")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }

        //Answer No 121
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on computer accessories? " && widget.CheckQuestion == "Amount accessories")
        {
          //Question No 122
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the computer accessories?","Purchase date of accessories",220.0,"","",[]);
        }

        //Answer No 122
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the computer accessories?" && widget.CheckQuestion == "Purchase date of accessories")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ====== Computer accessories Ends ===== //





        // ====== Mobile phone / Smartphone Starts ======= //

    //Answer No 123
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on a mobile phone?" && widget.CheckQuestion == "Mobile phone over 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 124
            return workcalculationContainer("","Work","How much was the mobile?","Amount mobile",370.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 125
            return workcalculationContainer("","Work","How much was the phone?","Amount phone",220.0,"calculation","",[]);
          }

        }


        //Answer No 124
        else if(widget.CheckCompleteQuestion =="How much was the mobile?" && widget.CheckQuestion == "Amount mobile")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }

        //Answer No 125
        else if(widget.CheckCompleteQuestion =="How much was the phone?" && widget.CheckQuestion == "Amount phone")
        {
          //Question No 126
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the phone?","Purchase date phone",220.0,"","",[]);
        }

        //Answer No 126
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the phone?" && widget.CheckQuestion == "Purchase date phone")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }



        // ====== Mobile phone / Smartphone Ends ======= //



          // ====== Document shredder Starts ====== //

        //Answer No 127
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on a paper shredder?" && widget.CheckQuestion == "Shredder over 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 128
            return workcalculationContainer("","Work","How much was the document shredder?","Amount shredder",370.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 129
            return workcalculationContainer("","Work","How much was the document shredder? ","Amount shredder",220.0,"calculation","",[]);
          }

        }


        //Answer No 128
        else if(widget.CheckCompleteQuestion =="How much was the document shredder?" && widget.CheckQuestion == "Amount shredder")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }

        //Answer No 129
        else if(widget.CheckCompleteQuestion =="How much was the document shredder? " && widget.CheckQuestion == "Amount shredder")
        {
          //Question No 130
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the document shredder?","Purchase date shredder",220.0,"","",[]);
        }

        //Answer No 130
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the document shredder?" && widget.CheckQuestion == "Purchase date shredder")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }



        // ====== Document shredder Ends ====== //


        // ====== Tools Starts ======

        //Answer No 131
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on any work tool?" && widget.CheckQuestion == "Tools over 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 132
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} pay for other tools?","Amount tool",370.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 133
            return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} pay for this tool?","Amount tools",220.0,"calculation","",[]);
          }

        }


        //Answer No 132
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} pay for other tools?" && widget.CheckQuestion == "Amount tool")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }

        //Answer No 133
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} pay for this tool?" && widget.CheckQuestion == "Amount tools")
        {
          //Question No 134
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the tool?","Purchase date tool",220.0,"","",[]);
        }

        //Answer No 134
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the tool?" && widget.CheckQuestion == "Purchase date tool")
        {
          //Question No 135
          return workyesnoContainer("","Work","The tool will be depreciated over a period of 8 years. Do you agree?","Usual depreciation",220.0,"","",[]);

        }


         //Answer No 135
        else if(widget.CheckCompleteQuestion =="The tool will be depreciated over a period of 8 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 136
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the tool for?","Usage tool",370.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 117
            return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
          }

        }

        //Answer No 136
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the tool for?" && widget.CheckQuestion == "Usage tool")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ====== Tools Ends ======


         // ====== Clothing Starts ====== //

        //Answer No 137
        else if(widget.CheckCompleteQuestion =="Which kind of work clothes did ${Questions.workYouIdentity} buy?" && widget.CheckQuestion == "Kind of clothes")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "None of them")
            {
              //Question No 117
              return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
            }

            else
              {
                //Question No 138
                return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on workwear?","Amount workwear",220.0,"calculation","",[]);
            }
          }
        }

        //Answer No 138
        else if(widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent on workwear?" && widget.CheckQuestion == "Amount workwear")
        {
          //Question No 139
          return workyesnoContainer("","Work","Did ${Questions.workYourIdentity} employer reimburse ${Questions.workYourIdentity} workwear expenses?","Reimbursement workwear",220.0,"","",[]);
        }

        //Answer No 139
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYourIdentity} employer reimburse ${Questions.workYourIdentity} workwear expenses?" && widget.CheckQuestion == "Reimbursement workwear")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 117
            return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 140
            return workcalculationContainer("","Work","How much reimbursement did ${Questions.workYouIdentity} receive?","Amount reimbursed",220.0,"calculation","",[]);
          }

        }

        //Answer No 140
        else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.workYouIdentity} receive?" && widget.CheckQuestion == "Amount reimbursed")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ====== Clothing Ends ====== //


        // ===== Briefcase starts ======

        //Answer No 141
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than 952 EUR on a briefcase?" && widget.CheckQuestion == "Briefcase over 952 EUR")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 142
            return workcalculationContainer("","Work","How much was the briefcase?","Amount briefcase",370.0,"calculation","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 143
            return workcalculationContainer("","Work","How much was the briefcase? ","Amount briefcase",220.0,"calculation","",[]);
          }

        }


        //Answer No 142
        else if(widget.CheckCompleteQuestion =="How much was the briefcase?" && widget.CheckQuestion == "Amount briefcase")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }

        //Answer No 143
        else if(widget.CheckCompleteQuestion =="How much was the briefcase? " && widget.CheckQuestion == "Amount briefcase")
        {
          //Question No 144
          return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy the briefcase?","Purchase date briefcase",220.0,"","",[]);
        }

        //Answer No 144
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy the briefcase?" && widget.CheckQuestion == "Purchase date briefcase")
        {
          //Question No 145
          return workyesnoContainer("","Work","The briefcase will be depreciated over a period of 5 years. Do you agree?","Usual depreciation",220.0,"","",[]);

        }


        //Answer No 145
        else if(widget.CheckCompleteQuestion =="The briefcase will be depreciated over a period of 5 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 146
            return workcalculationContainer("","Work","How long are ${Questions.workYouIdentity} going to use the briefcase for?","Usage briefcase",370.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 117
            return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
          }

        }

        //Answer No 146
        else if(widget.CheckCompleteQuestion =="How long are ${Questions.workYouIdentity} going to use the briefcase for?" && widget.CheckQuestion == "Usage briefcase")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ====== Briefcase ends ====== //

        // ====== Specialist literature Starts ===== //

        //Answer No 147
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on specialist literature?" && widget.CheckQuestion == "Amount literature")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ====== Specialist literature Ends ===== //



        // ====== Stationery Starts ===== //

        //Answer No 148
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on stationery?" && widget.CheckQuestion == "Amount stationery")
        {
          //Question No 117
          return workmultithreeContainer("","Work","Have ${Questions.workYouIdentity} bought any of those items in prior years?","Items bought in previous years",["Computer / laptop","Mobile phone","Other work items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No","",[]);
        }


        // ====== Stationery Ends ===== //



        // ====== Work Equipment Items Ends ====== //



        // ====== Items in prior years Starts ====== //

        //Answer No 117
        else if(widget.CheckCompleteQuestion =="Have ${Questions.workYouIdentity} bought any of those items in prior years?" && widget.CheckQuestion == "Items bought in previous years")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Computer / laptop")
            {
              //Question No 179
              return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy ${Questions.workYourIdentity} computer?","Purchase date",320.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "Mobile phone")
            {
              //Question No 181
              return workdateContainer("","Work","When did ${Questions.workYouIdentity} buy ${Questions.workYourIdentity} mobile phone?","Purchase date",320.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "Other work items")
            {
               //Question no 182
              return workcalculationContainer("","Work","How many items did ${Questions.workYouIdentity} buy?","Quantity",220.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "No")
            {
              //Question No 178
              return workmultitwoContainer("","Work","Did ${Questions.workYouIdentity} have any care or maintenance costs for work clothes or equipment?","Maintenance costs",["Repairs","Cleaning","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/disabilityoption.png"],220.0,"None","",[]);

            }

          }
        }




        //Answer No 179
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy ${Questions.workYourIdentity} computer?" && widget.CheckQuestion == "Purchase date")
        {
          //Question No 178
          return workmultitwoContainer("","Work","Did ${Questions.workYouIdentity} have any care or maintenance costs for work clothes or equipment?","Maintenance costs",["Repairs","Cleaning","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/disabilityoption.png"],220.0,"None","",[]);
        }

        //Answer No 181
        else if(widget.CheckCompleteQuestion =="When did ${Questions.workYouIdentity} buy ${Questions.workYourIdentity} mobile phone?" && widget.CheckQuestion == "Purchase date")
        {
          //Question No 178
          return workmultitwoContainer("","Work","Did ${Questions.workYouIdentity} have any care or maintenance costs for work clothes or equipment?","Maintenance costs",["Repairs","Cleaning","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/disabilityoption.png"],220.0,"None","",[]);
        }


        //Answer No 182
        else if(widget.CheckCompleteQuestion =="How many items did ${Questions.workYouIdentity} buy?" && widget.CheckQuestion == "Quantity")
        {
          //Question No 183
          return workcalculationContainer("","Work","What kind of item is item no. ${Questions.otherItemsLength}?","Item no. ${Questions.otherItemsLength}",220.0,"",Questions.otherItemsText,[]);

        }

        //Answer No 183
        else if(widget.CheckCompleteQuestion =="What kind of item is item no. ${Questions.otherItemsLength}?" && widget.CheckQuestion == "Item no. ${Questions.otherItemsLength}")
        {
          //Question No 184
          return workcalculationContainer("","Work","How much can ${Questions.workYouIdentity} depreciate for the item ${Questions.otherItems} in 2019?","Depreciation amount",220.0,"calculation",Questions.otherItemsText,[]);

        }


        //Answer No 184
        else if(widget.CheckCompleteQuestion =="How much can ${Questions.workYouIdentity} depreciate for the item ${Questions.otherItems} in 2019?" && widget.CheckQuestion == "Depreciation amount")
        {
          if(Questions.otherItemsLength <= Questions.totalOtherItems )
            {
              //Question No 183
              return workcalculationContainer("","Work","What kind of item is item no. ${Questions.otherItemsLength}?","Item no. ${Questions.otherItemsLength}",220.0,"",Questions.otherItemsText,[]);
            }
            else
              {
                //Question No 178
                return workmultitwoContainer("","Work","Did ${Questions.workYouIdentity} have any care or maintenance costs for work clothes or equipment?","Maintenance costs",["Repairs","Cleaning","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/disabilityoption.png"],220.0,"None","",[]);
          }

        }


        // ====== Items in prior years Ends ====== //

        // ====== Maintenance Costs for work Clothes Starts ======//

        //Answer No 178
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have any care or maintenance costs for work clothes or equipment?" && widget.CheckQuestion == "Maintenance costs")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Repairs")
            {
              //Question No 186
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on repairs?","Repair costs",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "Cleaning")
            {
             //Question No 187
              return workmultitwoContainer("","Work","Where did ${Questions.workYouIdentity} clean ${Questions.workYourIdentity} work clothes?","Cleaning locations",["Outside of home","At home"],["images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "None")
            {
              //Question No 185
              return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?","Work expenses",["Telephone costs","Internet costs","Applications","Job interviews","Professional association fees","Legal expenses","Business meals","Gift for customers and business associates","Driving license","Pension allowance (Versorgungszuschlag)","Winter allowance contribution","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);

            }

          }
        }

        // === Repairs Starts ====== //

        //Answer No 186
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on repairs?" && widget.CheckQuestion == "Repair costs")
        {
          //Question No 185
          return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?","Work expenses",["Telephone costs","Internet costs","Applications","Job interviews","Professional association fees","Legal expenses","Business meals","Gift for customers and business associates","Driving license","Pension allowance (Versorgungszuschlag)","Winter allowance contribution","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
        }

        // === Repairs Ends ====== //


    // ====== Cleaning Starts ===== //

    //Answer No 187
        else if(widget.CheckCompleteQuestion =="Where did ${Questions.workYouIdentity} clean ${Questions.workYourIdentity} work clothes?" && widget.CheckQuestion == "Cleaning locations")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Outside of home")
            {
              //Question No 188
              return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on cleaning?","Cleaning costs",220.0,"calculation","",[]);
            }

            else if(widget.CheckAnswer[m] == "At home")
            {
              //Question No 189
              return workmultithreeContainer("","Work","How did ${Questions.workYouIdentity} clean ${Questions.workYourIdentity} work clothes?","Cleaning Method",["In the washing machine","In the dryer","By iron"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"","",[]);

            }


          }
        }

        //Answer No 188
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on cleaning?" && widget.CheckQuestion == "Cleaning costs")
        {
          //Question No 185
          return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?","Work expenses",["Telephone costs","Internet costs","Applications","Job interviews","Professional association fees","Legal expenses","Business meals","Gift for customers and business associates","Driving license","Pension allowance (Versorgungszuschlag)","Winter allowance contribution","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
        }



        //Answer No 189

        else if(widget.CheckCompleteQuestion =="How did ${Questions.workYouIdentity} clean ${Questions.workYourIdentity} work clothes?" && widget.CheckQuestion == "Cleaning Method")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "In the washing machine")
            {
              //Question No 190
              return workthreeoptionContainer("","Work","Which washing machine setting did ${Questions.workYouIdentity} use for cleaning ${Questions.workYourIdentity} work clothes?","Washing Machine Setting",["Cook wash 90 degrees","Colour wash at 60 degrees","Easy-care wash"],220.0,"","",[]);
            }

            else if(widget.CheckAnswer[m] == "In the dryer")
            {

              //Question no 193
              return worktwooptionContainer("","Work","Which kind of dryer did ${Questions.workYouIdentity} use for ${Questions.workYourIdentity} work clothes?","Kind of dryer",["Exhaust air dryer","Condense dryer"],220.0,"","",[]);

            }

            else if(widget.CheckAnswer[m] == "By iron")
            {
              //Question No 196
              return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} iron ${Questions.workYourIdentity} work clothes, on average, per week?","Weekly iron processes",220.0,"","",[]);

            }


          }
        }


        //Answer No 190
        else if(widget.CheckCompleteQuestion =="Which washing machine setting did ${Questions.workYouIdentity} use for cleaning ${Questions.workYourIdentity} work clothes?" && widget.CheckQuestion == "Washing Machine Setting")
        {
          //Question No 191
          return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} wash ${Questions.workYourIdentity} work clothes, on average, per week?","Weekly wash processes",220.0,"","",[]);
        }

        //Answer No 191
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} wash ${Questions.workYourIdentity} work clothes, on average, per week?" && widget.CheckQuestion == "Weekly wash processes")
        {
          //Question No 192
          return workcalculationContainer("","Work","How much kilo of work clothes did one wash contain?","Weight per wash",220.0,"","",[]);
        }


        //Answer No 192
        else if(widget.CheckCompleteQuestion =="How much kilo of work clothes did one wash contain?" && widget.CheckQuestion == "Weight per wash")
        {
          //Question No 185
          return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?","Work expenses",["Telephone costs","Internet costs","Applications","Job interviews","Professional association fees","Legal expenses","Business meals","Gift for customers and business associates","Driving license","Pension allowance (Versorgungszuschlag)","Winter allowance contribution","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
        }


        //Answer No 193
        else if(widget.CheckCompleteQuestion =="Which kind of dryer did ${Questions.workYouIdentity} use for ${Questions.workYourIdentity} work clothes?" && widget.CheckQuestion == "Kind of dryer")
        {
          //Question No 194
          return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} dry ${Questions.workYourIdentity} work clothes, on average, per week?","Weekly dryer processes",220.0,"","",[]);
        }

        //Answer No 194
        else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} dry ${Questions.workYourIdentity} work clothes, on average, per week?" && widget.CheckQuestion == "Weekly dryer processes")
        {
          //Question No 195
          return workcalculationContainer("","Work","How much kilo of work clothes did one dry process contain?","Weight per dry process",220.0,"","",[]);
        }


        //Answer No 195
        else if(widget.CheckCompleteQuestion =="How much kilo of work clothes did one dry process contain?" && widget.CheckQuestion == "Weight per dry process")
        {
          //Question No 185
          return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?","Work expenses",["Telephone costs","Internet costs","Applications","Job interviews","Professional association fees","Legal expenses","Business meals","Gift for customers and business associates","Driving license","Pension allowance (Versorgungszuschlag)","Winter allowance contribution","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
          }


       //Answer No 196
       else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} iron ${Questions.workYourIdentity} work clothes, on average, per week?" && widget.CheckQuestion == "Weekly iron processes")
    {
    //Question No 197
    return workcalculationContainer("","Work","How much kilo of work clothes did ${Questions.workYouIdentity} iron at once?","Weight per iron process",220.0,"","",[]);
    }


  //Answer No 197
  else if(widget.CheckCompleteQuestion =="How much kilo of work clothes did ${Questions.workYouIdentity} iron at once?" && widget.CheckQuestion == "Weight per iron process")
    {
    //Question No 185
    return workmultipleoptionsContainer("","Work","Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?","Work expenses",["Telephone costs","Internet costs","Applications","Job interviews","Professional association fees","Legal expenses","Business meals","Gift for customers and business associates","Driving license","Pension allowance (Versorgungszuschlag)","Winter allowance contribution","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }




        // ====== Cleaning Ends ===== //


        // ====== Maintenance Costs for work Clothes Ends ======//


    // ====== Work-related expenses Starts ====== //

        //For single time move for partner and you
    //Answer no 185
        else if((widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have any other work-related expenses in 2019?" || widget.CheckCompleteQuestion =="Did you have any other work-related expenses in 2019?") && widget.CheckQuestion == "Work expenses")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "Telephone costs")
    {
      //Question No 198
      return workthreeoptionContainer("","Work","How often did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} private cell/smartphone for business purposes?","Share private mobile",["Only for some calls and checking emails","Often","Always"],220.0,"","",[]);

    }

    else if(widget.CheckAnswer[m] == "Internet costs")
    {

     //Question No 201
     return workthreeoptionContainer("","Work","How often did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} private internet connection for work purposes?","Share private internet",["Occasional browsing and checking emails","Very often","I work from home"],220.0,"","",[]);


    }

    else if(widget.CheckAnswer[m] == "Applications")
    {
      //Question No 204
      return workmultithreeContainer("","Work","How did ${Questions.workYouIdentity} send ${Questions.workYourIdentity} job applications?","Type of job applications",["By email / online form","Complete portfolio by mail","Simple cover letter"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"","",[]);

    }

    else if(widget.CheckAnswer[m] == "Job interviews")
    {
      //Question No 210
      return workcalculationContainer("","Work","How many places did ${Questions.workYouIdentity} travel to for job interviews?","Journeys to interviews",320.0,"loop","",[]);
    }

    else if(widget.CheckAnswer[m] == "Professional association fees")
    {
     //Question No 230
     return workcalculationContainer("","Work","To which professional association did ${Questions.workYouIdentity} pay fees?","Professional association",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Legal expenses")
    {
      //Question No 232
      return workcalculationContainer("","Work","How much were ${Questions.workYourIdentity} work-related legal expenses?","Legal expenses",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Business meals")
    {
     //Question No 233
     return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have any expenses due to work-related business meals?","Business meals",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Gift for customers and business associates")
    {
    //Question No 235
    return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on gifts for customers and business partners?","Total spent on gifts",220.0,"","",[]);

    }

    else if(widget.CheckAnswer[m] == "Driving license")
    {
    //Question No 236
    return workmultipleoptionsContainer("","Work","What is the driver's license for?","Reason for driver's license",["Driving a truck","Driving public transport","Driving a taxi","Driving a special vehicle","Being a chauffeur","On employer's request","None of this"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None of this","",[]);
    }

    else if(widget.CheckAnswer[m] == "Pension allowance (Versorgungszuschlag)")
    {
     //Question No 238
     return workcalculationContainer("","Work","How much pension allowance did ${Questions.workYouIdentity} pay?","Total pension allowance",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Winter allowance contribution")
    {
    //Question No 239
    return workcalculationContainer("","Work","How much winter allowance contribution did ${Questions.workYouIdentity} pay?","Total winter allowance contribution",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Other costs")
    {
     //Question No 240
     return workcalculationContainer("","Work","What kind of other costs did ${Questions.workYouIdentity} have (except daily allowances)?","Kind other",220.0,"","",[]);
    }



    else if(widget.CheckAnswer[m] == "No")
    {

      //For Partner
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
      workPartner();
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
      {
      Questions.workPartnerSingleMove = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

      }

    }
    }

    // ====== Telephone costs Starts ====== //

    //Answer No 198
    else if((widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} private cell/smartphone for business purposes?" || widget.CheckCompleteQuestion =="How often did you use your private cell/smartphone for business purposes?") && widget.CheckQuestion == "Share private mobile")
      {

      if(widget.CheckAnswer[0] == "Only for some calls and checking emails")
      {
      //For Partner
      if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
      {
      workPartner();
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      //For single move
      else if(Questions.workPartnerSingleMove == true)
      {
      Questions.workPartnerSingleMove = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      else
      {
      return FinishCategory("Work Category","Education Category");
      }

      }

      else if(widget.CheckAnswer[0] == "Often")
      {
       //Question No 199
       return workcalculationContainer("","Work","We recommend that ${Questions.workYouIdentity} enter 20% of ${Questions.workYourIdentity} phone costs. How much is that?","Amount 20%",220.0,"calculation","",[]);
      }

      else if(widget.CheckAnswer[0] == "Always")
      {
//Question No 200
      return workcalculationContainer("","Work","We recommend that ${Questions.workYouIdentity} enter 50% of ${Questions.workYourIdentity} phone costs. How much is that?","Amount 50%",220.0,"calculation","",[]);
      }

      }

      //Answer No 199
      else if((widget.CheckCompleteQuestion =="We recommend that ${Questions.workYouIdentity} enter 20% of ${Questions.workYourIdentity} phone costs. How much is that?" || widget.CheckCompleteQuestion =="We recommend that you enter 20% of your phone costs. How much is that?") && widget.CheckQuestion == "Amount 20%")
      {
        //print("lets see");
      //return FinishCategory("Work Category","Education Category");
      //For Partner
      if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
      {
      workPartner();
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      //For single move
      else if(Questions.workPartnerSingleMove == true)
      {
      Questions.workPartnerSingleMove = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      //For another single move
      else if(Questions.workPartnerSingleMoveCal == true)
      {
      Questions.workPartnerSingleMoveCal = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      else
      {
      return FinishCategory("Work Category","Education Category");
      }

      }

  //Answer No 200
  else if((widget.CheckCompleteQuestion =="We recommend that ${Questions.workYouIdentity} enter 50% of ${Questions.workYourIdentity} phone costs. How much is that?" || widget.CheckCompleteQuestion =="We recommend that you enter 50% of your phone costs. How much is that?") && widget.CheckQuestion == "Amount 50%")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }


    // ====== Telephone costs Ends ====== //


    // ====== Internet costs Starts ====== //

    //Answer No 201
    else if((widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} private internet connection for work purposes?" || widget.CheckCompleteQuestion =="How often did you use your private internet connection for work purposes?") && widget.CheckQuestion == "Share private internet")
    {

    if(widget.CheckAnswer[0] == "Occasional browsing and checking emails")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }


    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    else if(widget.CheckAnswer[0] == "Very often")
    {
    //Question No 202
    return workcalculationContainer("","Work","We recommend that ${Questions.workYouIdentity} enter 20% of ${Questions.workYourIdentity} internet costs. How much is that?","Amount 20%",220.0,"calculation","",[]);
    }

    else if(widget.CheckAnswer[0] == "I work from home")
    {
//Question No 203
    return workcalculationContainer("","Work","We recommend that ${Questions.workYouIdentity} enter 50% of ${Questions.workYourIdentity} internet costs. How much is that?","Amount 50%",220.0,"calculation","",[]);
    }

    }


  //Answer No 202
  else if((widget.CheckCompleteQuestion =="We recommend that ${Questions.workYouIdentity} enter 20% of ${Questions.workYourIdentity} internet costs. How much is that?" || widget.CheckCompleteQuestion =="We recommend that you enter 20% of your internet costs. How much is that?") && widget.CheckQuestion == "Amount 20%")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    //Answer No 203
    else if((widget.CheckCompleteQuestion =="We recommend that ${Questions.workYouIdentity} enter 50% of ${Questions.workYourIdentity} internet costs. How much is that?" || widget.CheckCompleteQuestion =="We recommend that you enter 50% of your internet costs. How much is that?") && widget.CheckQuestion == "Amount 50%")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    // ====== Internet costs Ends ====== //


      // ======= Applications Starts ======= //

    //Answer No 204
    else if(widget.CheckCompleteQuestion =="How did ${Questions.workYouIdentity} send ${Questions.workYourIdentity} job applications?" && widget.CheckQuestion == "Type of job applications")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "By email / online form")
    {
      Questions.applicationExpense =5.00;
     //Question No 205
     return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} apply for jobs via e-mail or online application form?","Online applications",220.0,"","",[]);

    }

    else if(widget.CheckAnswer[m] == "Complete portfolio by mail")
    {
    Questions.applicationExpense =17.00;
      //Question No 208
      return workcalculationContainer("","Work","How many portfolios did ${Questions.workYouIdentity} send?","Portfolio",220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Simple cover letter")
    {
    Questions.applicationExpense =5.00;
     //Question No 209
     return workcalculationContainer("","Work","How many application letters have ${Questions.workYouIdentity} sent off?","Application letters",220.0,"","",[]);
    }


    }
    }

    // By email / online form Starts

    //Answer no 205
    else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} apply for jobs via e-mail or online application form?" && widget.CheckQuestion == "Online applications")
    {
      //Question No 206
      return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than €${Questions.applicationExpense} in total on job applications?","Application expenses",220.0,"","",[]);
    }

    // By email / online form Ends


    // Complete portfolio by mail Starts

    //Answer no 208
    else if(widget.CheckCompleteQuestion =="How many portfolios did ${Questions.workYouIdentity} send?" && widget.CheckQuestion == "Portfolio")
  {
  //Question No 206
  return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than €${Questions.applicationExpense} in total on job applications?","Application expenses",220.0,"","",[]);
  }

    // Complete portfolio by mail Ends

    // Simple cover letter Starts
//Answer no 209
    else if(widget.CheckCompleteQuestion =="How many application letters have ${Questions.workYouIdentity} sent off?" && widget.CheckQuestion == "Application letters")
    {
    //Question No 206
    return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} spend more than €${Questions.applicationExpense} in total on job applications?","Application expenses",220.0,"","",[]);
    }

    // Simple cover letter Ends

    //Answer No 206
    else if((widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} spend more than €${Questions.applicationExpense} in total on job applications?" || widget.CheckCompleteQuestion =="Did you spend more than €${Questions.applicationExpense} in total on job applications?") && widget.CheckQuestion == "Application expenses")
      {

        if(widget.CheckAnswer[0] == "No")
        {
        if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
        {
        workPartner();
        //Question No 1
        return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
        }

        //For single move
        else if(Questions.workPartnerSingleMove == true)
        {
        Questions.workPartnerSingleMove = false;
        //Question No 1
        return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
        }

        else
        {
        return FinishCategory("Work Category","Education Category");
        }

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
        //Question No 207
        return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on job applications?","Expenses for job applications",220.0,"calculation","",[]);
        }

      }

      //Answer No 207
      else if((widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on job applications?" || widget.CheckCompleteQuestion =="How much did you spend on job applications?") && widget.CheckQuestion == "Expenses for job applications")
      {
      if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
      {
      workPartner();
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      //For single move
      else if(Questions.workPartnerSingleMove == true)
      {
      Questions.workPartnerSingleMove = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      //For another single move
      else if(Questions.workPartnerSingleMoveCal == true)
      {
      Questions.workPartnerSingleMoveCal = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      else
      {
      return FinishCategory("Work Category","Education Category");
      }

      }

      // ======= Applications Ends ======= //


       // ======== Job interviews Starts ======= //

      //Answer No 210
      else if(widget.CheckCompleteQuestion =="How many places did ${Questions.workYouIdentity} travel to for job interviews?" && widget.CheckQuestion == "Journeys to interviews")
    {
     //Question No 211
     return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} traveled to for ${Questions.workYourIdentity} interview?","Place ${Questions.jobInterviewLength}. job interview",["Germany","Abroad"],430.0,"",Questions.jobInterviewText,[]);
    }


    //Answer No 211
    else if(widget.CheckCompleteQuestion =="Where have ${Questions.workYouIdentity} traveled to for ${Questions.workYourIdentity} interview?" && widget.CheckQuestion == "Place ${Questions.jobInterviewLength}. job interview")
    {

    if(widget.CheckAnswer[0] == "Germany")
    {
     //Question No 212
     return workmultipleoptionsContainer("","Work","How did ${Questions.workYouIdentity} travel to this job interview?","Means of transport",["By car","Bus and train","Airplane","Bicycle","On foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.jobInterviewText,[]);
    }

    else if(widget.CheckAnswer[0] == "Abroad")
    {
//Question No 212
    return workmultipleoptionsContainer("","Work","How did ${Questions.workYouIdentity} travel to this job interview?","Means of transport",["By car","Bus and train","Airplane","Bicycle","On foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.jobInterviewText,[]);
    }

    }

    //Answer No 212
    else if(widget.CheckCompleteQuestion =="How did ${Questions.workYouIdentity} travel to this job interview?" && widget.CheckQuestion == "Means of transport")
    {

        for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {
        //Question No 213
        return workcalculationContainer("","Work","Please enter the start and end point of ${Questions.workYourIdentity} route ${Questions.workYouIdentity} went by car.","Distance by car",220.0,"",Questions.jobInterviewText,[]);

        }

        else if(widget.CheckAnswer[m] == "Bus and train")
        {
        //Question No 215
        return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on going there?","Travel costs",220.0,"calculation",Questions.jobInterviewText,[]);
        }

        else if(widget.CheckAnswer[m] == "Airplane")
        {
         //Question No 215
        return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on going there?","Travel costs",220.0,"calculation",Questions.jobInterviewText,[]);
        }

        else if(widget.CheckAnswer[m] == "Bicycle")
        {
         //Question No 214
        return workdateContainer("","Work","How long were ${Questions.workYouIdentity} away for this trip?","Period",220.0,"",Questions.jobInterviewText,[]);
        }
        else if(widget.CheckAnswer[m] == "On foot")
        {
         //Question No 214
        return workdateContainer("","Work","How long were ${Questions.workYouIdentity} away for this trip?","Period",220.0,"",Questions.jobInterviewText,[]);
        }


        }
    }

    // By car starts

    //Answer No 213
    else if(widget.CheckCompleteQuestion =="Please enter the start and end point of ${Questions.workYourIdentity} route ${Questions.workYouIdentity} went by car." && widget.CheckQuestion == "Distance by car")
  {
  //Question No 214
  return workdateContainer("","Work","How long were ${Questions.workYouIdentity} away for this trip?","Period",220.0,"",Questions.jobInterviewText,[]);
  }

    //By card ends


    // Bus and train Starts

    //Answer No 215
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on going there?" && widget.CheckQuestion == "Travel costs")
    {
    //Question No 214
    return workdateContainer("","Work","How long were ${Questions.workYouIdentity} away for this trip?","Period",220.0,"",Questions.jobInterviewText,[]);
    }

    // Bus and train Ends

    // Answer No 214
    else if(widget.CheckCompleteQuestion =="How long were ${Questions.workYouIdentity} away for this trip?" && widget.CheckQuestion == "Period")
    {
      //Question No 216
      return workmultithreeContainer("","Work","Where did ${Questions.workYouIdentity} stay overnight?","Accommodation cost",["Hotel","Guest house","Friends and family"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"",Questions.jobInterviewText,[]);
    }

    //Answer No 216
    else if(widget.CheckCompleteQuestion =="Where did ${Questions.workYouIdentity} stay overnight?" && widget.CheckQuestion == "Accommodation cost")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "Hotel")
    {
    //Question No 217
    return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on the accommodation?","Cost accommodation",220.0,"calculation","",[]);
    }

    else if(widget.CheckAnswer[m] == "Guest house")
    {
//Question No 217
    return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on the accommodation?","Cost accommodation",220.0,"calculation","",[]);

    }

    else if(widget.CheckAnswer[m] == "Friends and family")
    {
    //Question No 218
    return workmultithreeContainer("","Work","Did ${Questions.workYouIdentity} receive any complimentary meals?","Complimentary meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.jobInterviewText,[]);

    }



    }
    }

    //Answer No 217
    else if(widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent on the accommodation?" && widget.CheckQuestion == "Cost accommodation")
  {
    //Question No 218
    return workmultithreeContainer("","Work","Did ${Questions.workYouIdentity} receive any complimentary meals?","Complimentary meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.jobInterviewText,[]);
  }


  //Answer No 218

  else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} receive any complimentary meals?" && widget.CheckQuestion == "Complimentary meals")
  {

  for(int m=0;m<widget.CheckAnswer.length;m++) {

  if(widget.CheckAnswer[m] == "Breakfast")
  {
  //Question No 220
  return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} receive free breakfast?","Free breakfast",420.0,"",Questions.jobInterviewText,[]);
  }

  else if(widget.CheckAnswer[m] == "Lunch")
  {
  //Question No 221
  return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get complimentary lunch?","Free lunch",420.0,"",Questions.jobInterviewText,[]);

  }

  else if(widget.CheckAnswer[m] == "Dinner")
  {
  //Question No 222
  return workcalculationContainer("","Work","How often did ${Questions.workYouIdentity} get free dinner?","Free Dinner",420.0,"",Questions.jobInterviewText,[]);

  }

  else if(widget.CheckAnswer[m] == "No")
  {
 //Question No 219
 return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} had any further costs on ${Questions.workYourIdentity} way to the interview?","Other expenses",["Baggage fees","Telephone charges","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.jobInterviewText,[]);
  }

  }
  }

  //Answer No 220
  else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} receive free breakfast?" && widget.CheckQuestion == "Free breakfast")
  {
  //Question No 219
  return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} had any further costs on ${Questions.workYourIdentity} way to the interview?","Other expenses",["Baggage fees","Telephone charges","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.jobInterviewText,[]);
  }

  //Answer No 221
  else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get complimentary lunch?" && widget.CheckQuestion == "Free lunch")
    {
//Question No 219
    return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} had any further costs on ${Questions.workYourIdentity} way to the interview?","Other expenses",["Baggage fees","Telephone charges","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.jobInterviewText,[]);
    }

  //Answer No 222
  else if(widget.CheckCompleteQuestion =="How often did ${Questions.workYouIdentity} get free dinner?" && widget.CheckQuestion == "Free Dinner")
    {
//Question No 219
    return workmultipleoptionsContainer("","Work","Have ${Questions.workYouIdentity} had any further costs on ${Questions.workYourIdentity} way to the interview?","Other expenses",["Baggage fees","Telephone charges","Toll charges","Parking fees","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.jobInterviewText,[]);
    }


    //Answer No 219
    else if(widget.CheckCompleteQuestion =="Have ${Questions.workYouIdentity} had any further costs on ${Questions.workYourIdentity} way to the interview?" && widget.CheckQuestion == "Other expenses")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "Baggage fees")
    {
    //Question No 224
    return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on baggage storage? ","Baggage fees",220.0,"calculation",Questions.jobInterviewText,[]);
    }

    else if(widget.CheckAnswer[m] == "Telephone charges")
    {
    //Question No 225
    return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on business calls? ","Business calls",220.0,"calculation",Questions.jobInterviewText,[]);

    }

    else if(widget.CheckAnswer[m] == "Toll charges")
    {
    //Question No 226
    return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on toll charges? ","Toll charges",220.0,"calculation",Questions.jobInterviewText,[]);

    }

    else if(widget.CheckAnswer[m] == "Parking fees")
    {
    //Question No 227
    return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent on parking fees? ","Parking fees",220.0,"calculation",Questions.jobInterviewText,[]);
    }

    else if(widget.CheckAnswer[m] == "Other costs")
    {
    //Question No 228
    return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on other travel expenses? ","Other travel expenses",220.0,"calculation",Questions.jobInterviewText,[]);
    }

    else if(widget.CheckAnswer[m] == "No")
    {
    //Question No 223
    return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?","Amount of reimbursement",220.0,"",Questions.jobInterviewText,[]);
    }

    }
    }


    //Answer No 224
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on baggage storage? " && widget.CheckQuestion == "Baggage fees")
  {
  //Question No 223
  return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?","Amount of reimbursement",220.0,"",Questions.jobInterviewText,[]);
  }

    //Answer No 225
    else if(widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent on business calls? " && widget.CheckQuestion == "Business calls")
    {
    //Question No 223
    return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?","Amount of reimbursement",220.0,"",Questions.jobInterviewText,[]);
    }

    //Answer No 226
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on toll charges? " && widget.CheckQuestion == "Toll charges")
    {
    //Question No 223
    return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?","Amount of reimbursement",220.0,"",Questions.jobInterviewText,[]);
    }

  //Answer No 227
  else if(widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent on parking fees? " && widget.CheckQuestion == "Parking fees")
    {
    //Question No 223
    return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?","Amount of reimbursement",220.0,"",Questions.jobInterviewText,[]);
    }

    //Answer No 228
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on other travel expenses? " && widget.CheckQuestion == "Other travel expenses")
    {
    //Question No 223
    return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?","Amount of reimbursement",220.0,"",Questions.jobInterviewText,[]);
    }


    //Answer No 223
    else if((widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} receive any reimbursements for the trip to the interview?" || widget.CheckCompleteQuestion =="Did you receive any reimbursements for the trip to the interview?") && widget.CheckQuestion == "Amount of reimbursement")
  {

  if(widget.CheckAnswer[0] == "No")
  {
     if(Questions.jobInterviewLength <= Questions.totalJobInterview)
       {
       //Question No 211
       return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} traveled to for ${Questions.workYourIdentity} interview?","Place ${Questions.jobInterviewLength}. job interview",["Germany","Abroad"],430.0,"",Questions.jobInterviewText,[]);
       }
       else
         {

  if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
  {
  workPartner();
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For single move
  else if(Questions.workPartnerSingleMove == true)
  {
  Questions.workPartnerSingleMove = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }


  else
  {
  return FinishCategory("Work Category","Education Category");
  }

  }
  }

  else if(widget.CheckAnswer[0] == "Yes")
  {
  //Question No 229
  return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} receive?","Amount",220.0,"calculation",Questions.jobInterviewText,[]);

  }

  }

  //Answer No 229
  else if((widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} receive?" || widget.CheckCompleteQuestion =="How much did you receive?") && widget.CheckQuestion == "Amount")
  {
  if(Questions.jobInterviewLength <= Questions.totalJobInterview)
  {
  //Question No 211
  return worktwooptionContainer("","Work","Where have ${Questions.workYouIdentity} traveled to for ${Questions.workYourIdentity} interview?","Place ${Questions.jobInterviewLength}. job interview",["Germany","Abroad"],430.0,"",Questions.jobInterviewText,[]);
  }
  else{
  if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
  {
  workPartner();
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For single move
  else if(Questions.workPartnerSingleMove == true)
  {
  Questions.workPartnerSingleMove = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For another single move
  else if(Questions.workPartnerSingleMoveCal == true)
  {
  Questions.workPartnerSingleMoveCal = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  else
  {
  return FinishCategory("Work Category","Education Category");
  }

  }
  }


    // ======== Job interviews Ends ======= //

       // ======= Professional association fees Starts ====== //

    //Answer No 230
    else if(widget.CheckCompleteQuestion =="To which professional association did ${Questions.workYouIdentity} pay fees?" && widget.CheckQuestion == "Professional association")
  {
    //Question No 231
    return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on that?","Amount professional association",220.0,"calculation","",[]);
  }

  //Answer No 231
  else if((widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on that?" || widget.CheckCompleteQuestion =="How much did you spend on that?") && widget.CheckQuestion == "Amount professional association")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }


    // ======= Professional association fees Ends ====== //

   // ======= Legal expenses Starts ===== //

//Answer No 232
    else if((widget.CheckCompleteQuestion =="How much were ${Questions.workYourIdentity} work-related legal expenses?" || widget.CheckCompleteQuestion =="How much were your work-related legal expenses?") && widget.CheckQuestion == "Legal expenses")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    // ======= Legal expenses Ends ===== //


  // ======== Business meals Starts ===== //

    //Answer No 233
    else if((widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have any expenses due to work-related business meals?" || widget.CheckCompleteQuestion =="Did you have any expenses due to work-related business meals?") && widget.CheckQuestion == "Business meals")
  {

      if(widget.CheckAnswer[0] == "No")
      {
      if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
      {
      workPartner();
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      //For single move
      else if(Questions.workPartnerSingleMove == true)
      {
      Questions.workPartnerSingleMove = false;
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
      }

      else
      {
      return FinishCategory("Work Category","Education Category");
      }

      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
      //Question No 234
      return workcalculationContainer("","Work","How much have ${Questions.workYouIdentity} spent?","Total cost of business meals",220.0,"calculation","",[]);

      }

  }


    //Answer No 234
    else if((widget.CheckCompleteQuestion =="How much have ${Questions.workYouIdentity} spent?" || widget.CheckCompleteQuestion =="How much have you spent?" ) && widget.CheckQuestion == "Total cost of business meals")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    // ======== Business meals Ends ===== //

    // ======= Gift for customers and business associates Starts ======= //

    //Answer No 235
    else if((widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on gifts for customers and business partners?" || widget.CheckCompleteQuestion =="How much did you spend on gifts for customers and business partners?") && widget.CheckQuestion == "Total spent on gifts")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }


    // ======= Gift for customers and business associates Ends ======= //


    // ======= Driving license Starts ======= //

    //Answer No 236
    else if(widget.CheckCompleteQuestion =="What is the driver's license for?" && widget.CheckQuestion == "Reason for driver's license")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "None of this")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }


    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    else
      {
        //Question No 237
        return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on ${Questions.workYourIdentity} driving license?","Total spent on driving license",220.0,"calculation","",[]);
      }


    }
    }

    //Answer No 237
   else if((widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on ${Questions.workYourIdentity} driving license?" || widget.CheckCompleteQuestion =="How much did you spend on your driving license?") && widget.CheckQuestion == "Total spent on driving license")
  {
  if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
  {
  workPartner();
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For single move
  else if(Questions.workPartnerSingleMove == true)
  {
  Questions.workPartnerSingleMove = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For another single move
  else if(Questions.workPartnerSingleMoveCal == true)
  {
  Questions.workPartnerSingleMoveCal = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  else
  {
  return FinishCategory("Work Category","Education Category");
  }

  }


    // ======= Driving license Ends ======= //



   // ======== Pension allowance (Versorgungszuschlag) Starts ======== //

//Answer No 238
  else if((widget.CheckCompleteQuestion =="How much pension allowance did ${Questions.workYouIdentity} pay?" || widget.CheckCompleteQuestion =="How much pension allowance did you pay?") && widget.CheckQuestion == "Total pension allowance")
  {
  if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
  {
  workPartner();
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For single move
  else if(Questions.workPartnerSingleMove == true)
  {
  Questions.workPartnerSingleMove = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For another single move
  else if(Questions.workPartnerSingleMoveCal == true)
  {
  Questions.workPartnerSingleMoveCal = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  else
  {
  return FinishCategory("Work Category","Education Category");
  }


  }


    // ======== Pension allowance (Versorgungszuschlag) Ends ======== //

    // ========= Winter allowance contribution Starts ========= //

//Answer No 239
    else if((widget.CheckCompleteQuestion =="How much winter allowance contribution did ${Questions.workYouIdentity} pay?" || widget.CheckCompleteQuestion =="How much winter allowance contribution did you pay?") && widget.CheckQuestion == "Total winter allowance contribution")
    {
    if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
    {
    workPartner();
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For single move
    else if(Questions.workPartnerSingleMove == true)
    {
    Questions.workPartnerSingleMove = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    //For another single move
    else if(Questions.workPartnerSingleMoveCal == true)
    {
    Questions.workPartnerSingleMoveCal = false;
    //Question No 1
    return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
    }

    else
    {
    return FinishCategory("Work Category","Education Category");
    }

    }

    // ========= Winter allowance contribution Ends ========= //


    // ======= Other Costs Starts ====== //

    //Answer No 240
    else if(widget.CheckCompleteQuestion =="What kind of other costs did ${Questions.workYouIdentity} have (except daily allowances)?" && widget.CheckQuestion == "Kind other")
    {
    //Question No 241
    return workcalculationContainer("","Work","How much did ${Questions.workYouIdentity} spend on ${Questions.otherCostExpense}?","Amount other costs",220.0,"calculation","",[]);
    }

    //Answer No 241
    else if((widget.CheckCompleteQuestion =="How much did ${Questions.workYouIdentity} spend on ${Questions.otherCostExpense}?" || widget.CheckCompleteQuestion =="How much did you spend on ${Questions.otherCostExpense}?") && widget.CheckQuestion == "Amount other costs")
  {

  if((Questions.LivingCheck == 2 || Questions.LivingCheck == 3) && Questions.workPartner == true)
  {
  workPartner();
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For single move
  else if(Questions.workPartnerSingleMove == true)
  {
  Questions.workPartnerSingleMove = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  //For another single move
  else if(Questions.workPartnerSingleMoveCal == true)
  {
  Questions.workPartnerSingleMoveCal = false;
  //Question No 1
  return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);
  }

  else
  {
  return FinishCategory("Work Category","Education Category");
  }


  }


    // ======= Other Costs Ends ====== //

    // ====== Work-related expenses Ends ====== //


      }
  }


  Widget workcalculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkCalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workyesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkYesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workmultipleoptionsContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkMultipleOptionsContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:430.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workthreeoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion )
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkThreeOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:340.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workdateContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkDateContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);

  }

  Widget workdifferentoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkDifferentOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:420.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workmultithreeContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData , List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkMultiThreeContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:370.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workcalculationbigContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkCalculationBigContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:270.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget worktwooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData,  List Suggestion )
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkTwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:280.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget workmultitwoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.workAnimatedContainer = animatedcontainer;
    return WorkMultiTwoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:320.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  void workPartner()
  {

    qu.WorkAddAnswer("Partner", "","","", [], 60.0);
    Questions.workPartner=false;

    Questions.workYouIdentity = "your partner";
    Questions.workYourIdentity = "your partner";

                        Questions.homeOfficeLength = 0;
                        Questions.totalHomeOffice = 0;
                        Questions.homeOfficeText = "";
                        Questions.workFurnitureLength = 0;
                        Questions.totalWorkFurniture = 0;
                        Questions.workFurnitureText = "";
                        Questions.otherFurniture = "";
                        Questions.homeOfficeFurniture = false;
                        Questions.workBusTripLength = 0;
                        Questions.totalWorkBusTrip = 0;
                        Questions.workBusTripText = "";
                        Questions.workBusCostLength = 0;
                        Questions.totalWorkBusCost = 0;
                        Questions.workBusCostText = "";
                        Questions.officeFurnitureLength = 0;
                        Questions.totalOfficeFurniture = 0;
                        Questions.officeFurnitureText = "";
                        Questions.otherOfficeFurniture = "";
                        Questions.otherItemsLength = 0;
                        Questions.totalOtherItems = 0;
                        Questions.otherItemsText = "";
                        Questions.otherItems ="";
                        Questions.applicationExpense;
                        Questions.jobInterviewLength = 0;
                        Questions.totalJobInterview = 0;
                        Questions.jobInterviewText = "";
                        Questions.otherCostExpense = "";
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
            Questions.workAnswerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WorkMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
            }));
          }

          else {
            answerSubList = Questions.workAnswerShow.sublist(0, currentIndex);
            print("Answer sub list:$answerSubList");
            Questions.workAnswerShow = [];
            Questions.workAnswerShow.addAll(answerSubList);

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WorkMainQuestions(CheckCompleteQuestion : Questions.workAnswerShow[currentIndex-1]['completequestion'],CheckQuestion : Questions.workAnswerShow[currentIndex-1]['question'],CheckAnswer : [Questions.workAnswerShow[currentIndex-1]['answer'][0]]);
            }));
          }





        },
        child:Container(
          margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
          height: Questions.workAnswerShow[currentIndex]['containerheight'],
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
                      child:AutoSizeText(Questions.workAnswerShow[currentIndex]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ),
                  Row(children: <Widget>[
                    //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                    Container(
                        width: 140.0,
                        // color:Colors.blue,
                        child:AutoSizeText(Questions.workAnswerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

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
            Questions.workAnswerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WorkMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
            }));
          }

          else {
            answerSubList = Questions.workAnswerShow.sublist(0, currentIndex);
            print("Answer sub list:$answerSubList");
            Questions.workAnswerShow = [];
            Questions.workAnswerShow.addAll(answerSubList);

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return WorkMainQuestions(CheckCompleteQuestion : Questions.workAnswerShow[currentIndex-1]['completequestion'],CheckQuestion : Questions.workAnswerShow[currentIndex-1]['question'],CheckAnswer : [Questions.workAnswerShow[currentIndex-1]['answer'][0]]);
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
                        child:AutoSizeText(Questions.workAnswerShow[currentIndex]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ),
                    Row(children: <Widget>[
                      //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                      Container(
                          width: 140.0,
                          // color:Colors.blue,
                          child:AutoSizeText(Questions.workAnswerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

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






