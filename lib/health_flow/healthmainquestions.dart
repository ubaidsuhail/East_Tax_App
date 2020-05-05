import 'package:easy_taxx/livingsituation_flow/container1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_taxx/health_flow/healthmultithreecontainer.dart';
import 'package:easy_taxx/health_flow/healthyesnocontainer.dart';
import 'package:easy_taxx/health_flow/healthcalculationcontainer.dart';
import 'package:easy_taxx/health_flow/healthmultipleoptionscontainer.dart';
import 'package:easy_taxx/health_flow/healthmultitwocontainer.dart';
import 'package:easy_taxx/health_flow/healthaddresscontainer.dart';
import 'package:easy_taxx/health_flow/healthtwooptioncontainer.dart';




class HealthMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  HealthMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _HealthMainQuestionsState createState() => _HealthMainQuestionsState();
}

class _HealthMainQuestionsState extends State<HealthMainQuestions> {
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
    print("question length:" + Questions.healthAnswerShow.length.toString());

    for (k = l; k < Questions.healthAnswerShow.length; k++) {
      print("how manysdsdsd");
      screenHeightbig = 0.0;
      if (Questions.healthAnswerShow[k]['identity'] == "You" ||
          Questions.healthAnswerShow[k]['identity'] == "You & Partner" ||
          Questions.healthAnswerShow[k]['identity'] == "Partner") {
        screenHeight = screenHeight + 70.0;
      }
      else if (Questions.healthAnswerShow[k]['details'] == "") {
        screenHeight = screenHeight + 60.0;
        detail = true;
      }
      else {
        detailsHeight = Questions.healthAnswerShow[k]['details'];

        for (l = k; l < Questions.healthAnswerShow.length; l++) {
          if (Questions.healthAnswerShow[l]['details'] == detailsHeight) {
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
    screenHeight = screenHeight + Questions.healthAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:" + screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;
  }


  void DynamicContainer() {
    hlength = 0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i = j; i < Questions.healthAnswerShow.length; i++) {
      print("value oif i is:" + i.toString());


      print("dat is:" + i.toString());
      //You and your and your partner identity
      if (Questions.healthAnswerShow[i]['identity'] == "You" ||
          Questions.healthAnswerShow[i]['identity'] == "You & Partner" ||
          Questions.healthAnswerShow[i]['identity'] == "Partner") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: Questions.healthAnswerShow[i]['containerheight'],
              width: 450.0,
              child: Text(Questions.healthAnswerShow[i]['identity'],
                  style: TextStyle(fontSize: 40.0)),
            )
        );
      }
      else if (Questions.healthAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(
                  top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.healthAnswerShow[i]['containerheight'],
              width: 450.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Text(Questions.answerShow[i]['question']),
                      Text(Questions.healthAnswerShow[i]['question'],
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Text(Questions.healthAnswerShow[i]['answer'][0]),
                        SizedBox(width: 10.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                          color: Colors.lightBlue,)
                      ],)
                    ],)),
            ));
      }

      //data that contains long container
      else {
        detailOption = Questions.healthAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for (co = i; co < Questions.healthAnswerShow.length; co++) {
          if (Questions.healthAnswerShow[co]['details'] == detailOption) {
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
          if (Questions.healthAnswerShow[j]['details'] == detailOption &&
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
                          Text(Questions.healthAnswerShow[i]['details'],
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
          if (Questions.healthAnswerShow[j]['details'] == detailOption &&
              detail == false) {
            dynamicContainerbig.add(
              Container(
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
                              child: AutoSizeText(
                                Questions.healthAnswerShow[j]['question'],
                                style: TextStyle(color: Colors.grey),
                                minFontSize: 14.0,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,)
                          ),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Container(
                              width: 140.0,
                              // color:Colors.blue,
                              child: AutoSizeText(
                                Questions.healthAnswerShow[j]['answer'][0],
                                textAlign: TextAlign.end,
                                minFontSize: 14.0,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,),),
                            SizedBox(width: 5.0,),
                            Icon(Icons.arrow_forward_ios, size: 12.0,
                              color: Colors.lightBlue,)
                          ],)
                        ],))),

            );

//For last line

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
                    borderRadius: BorderRadius.circular(7.0),
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
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back, color: Colors.lightBlue, size: 18.0,)
          ),
          title: Text(
            'Health', style: TextStyle(color: Colors.black, fontSize: 14.0),),
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
                          HealthChangeContainer(),

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


  Widget HealthChangeContainer()
  {
    if(Questions.healthAnswerShow.length == 0)
    {
      //Question No 1
      //For Statutory 220.0
      //For Private 220.0
      //For Family 430.0
      //For None 430.0
      return healthmultithreeContainer("","Health","What kind of basic health insurance did ${Questions.healthYouIdentity} have in 2019?","Kind of health insurance",["Statutory","Private","Family","None of them"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"None of them","","");
    }

    else
      {
    //Answer No 1
    if(widget.CheckCompleteQuestion =="What kind of basic health insurance did ${Questions.healthYouIdentity} have in 2019?" && widget.CheckQuestion == "Kind of health insurance")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "Statutory")
    {
      //Question No 2
      //For No 430.0
      //For Yes 220.0
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any reimbursement from your health or nursing care insurance?","Statutory health insurance",220.0,"","","");
    }

    else if(widget.CheckAnswer[m] == "Private")
    {
     //Question no 4
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for ${Questions.healthYourIdentity} basic coverage of ${Questions.healthYourIdentity} private health insurance?","Basic health insurance",220.0,"calculation","","");

    }

    else if(widget.CheckAnswer[m] == "Family")
    {
      //Question No 15
      // For Supplementary health insurance 320.0
      // For rest 220.0
      return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
    }

    else if(widget.CheckAnswer[m] == "None of them")
    {
      //Question No 15
      return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
    }

    }
    }


    // ====== Statutory Starts ====== //

    //Answer No 2
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any reimbursement from your health or nursing care insurance?" && widget.CheckQuestion == "Statutory health insurance")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 15
        return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 3
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive?","Amount of reimbursement",430.0,"calculation","","");
      }

    }


    //Answer No 3
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Amount of reimbursement")
    {
      //Question No 15
      return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
    }

    // ====== Statutory Ends ====== //

    // ====== Private Starts ====== //

    //Answer No 4
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for ${Questions.healthYourIdentity} basic coverage of ${Questions.healthYourIdentity} private health insurance?" && widget.CheckQuestion == "Basic health insurance")
    {
      //Question No 5
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} spend on private nursing care insurance?","Nursing care insurance",220.0,"calculation","","");
    }

    //Answer No 5
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on private nursing care insurance?" && widget.CheckQuestion == "Nursing care insurance")
    {
      //Question no 6
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any refunds for payments to ${Questions.healthYourIdentity} private health insurance?","Private insurance refunds",220.0,"","","");

    }


    //Answer No 6
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any refunds for payments to ${Questions.healthYourIdentity} private health insurance?" && widget.CheckQuestion == "Private insurance refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 8
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for health insurance, beyond basic coverage?","Beyond basic coverage",220.0,"calculation","","");

      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 7
        return healthcalculationContainer("","Health","How much reimbursement did  ${Questions.healthYouIdentity} receive?","Amount of reimbursement",220.0,"calculation","","");
      }

    }


    //Answer no 7
    else if(widget.CheckCompleteQuestion =="How much reimbursement did  ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Amount of reimbursement")
    {
      //Question No 8
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for health insurance, beyond basic coverage?","Beyond basic coverage",220.0,"calculation","","");
    }


    //Answer no 8
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for health insurance, beyond basic coverage?" && widget.CheckQuestion == "Beyond basic coverage")
    {
      //Question no 9
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any reimbursements for your contributions that exceed your basic coverage?","Reimbursements",220.0,"","","");

    }


    //Answer No 9
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any reimbursements for your contributions that exceed your basic coverage?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 11
        //For No 430.0
        //For Yes 220.0
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have additional contributions to nursing care insurace, according to the statement?","Additional nursing care",430.0,"","","");

      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 10
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive?","Amount reimbursed",220.0,"calculation","","");
      }

    }


    //Answer No 10
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Amount reimbursed")
    {
      //Question No 11
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have additional contributions to nursing care insurace, according to the statement?","Additional nursing care",430.0,"","","");
    }


    //Answer No 11
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} have additional contributions to nursing care insurace, according to the statement?" && widget.CheckQuestion == "Additional nursing care")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 15
        return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 12
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for supplementary nursing care insurance?","Contribution",220.0,"calculation","","");
      }

    }

    //Answer No 12
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for supplementary nursing care insurance?" && widget.CheckQuestion == "Contribution")
    {
      //Question No 13
      //For No 430.0
      //For Yes 220.0
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any reimbursements related to your additional nursing care insurance contributions?","Reimbursements",430.0,"","","");
    }

    //Answer no 13
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any reimbursements related to your additional nursing care insurance contributions?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 15
        return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 14
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} receive in reimbursements?","Amount reimbursed",430.0,"calculation","","");
      }

    }

    //Answer No 14
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} receive in reimbursements?" && widget.CheckQuestion == "Amount reimbursed")
    {
      //Question No 15
      return healthmultipleoptionsContainer("","Health","Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?","Other health insurance",["Supplementary health insurance","Supplementary nursing care insurance","For my adult child","For my Partner","Foreign health insurance","Travel insurance","Voluntary statutory health insurance","Health insurance for students","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","","");
    }

// ====== Private Ends ====== //


    //Answer No 15

   // ====== Other health insurance Starts ====== //

        else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} have costs for any other health insurance policies?" && widget.CheckQuestion == "Other health insurance")
        {

          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Supplementary health insurance")
            {
             //Question No 16
              return healthmultitwoContainer("","Health","What type of contract is ${Questions.healthYourIdentity} supplementary health insurance policy?","Health insurance",["Additional insurance (statutory)","Additional insurance (private)"],["images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"","","");
            }

            else if(widget.CheckAnswer[m] == "Supplementary nursing care insurance")
            {
            //Question No 24
              return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for private supplementary nursing insurance?","Supplementary nursing care insurance",430.0,"calculation","","");
            }

            else if(widget.CheckAnswer[m] == "For my adult child")
            {
            //Question No 27
              return healthcalculationContainer("","Health","For how many adult children did ${Questions.healthYouIdentity} pay health insurance contributions?","Number of children",220.0,"loop","","");

            }

            else if(widget.CheckAnswer[m] == "For my Partner")
            {
             //Question No 38
              return healthcalculationContainer("","Health","Please enter ${Questions.healthYourIdentity} spouse's first and last name.","Spouse's name",220.0,"","","");
            }

            else if(widget.CheckAnswer[m] == "Foreign health insurance")
            {
              //Question No 47
              return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for foreign health insurance?","Foreign health insurance",220.0,"","","");

            }

            else if(widget.CheckAnswer[m] == "Travel insurance")
            {
              //Question No 55
              return healthcalculationContainer("","Health","What was the annual amount spent on travel insurance?","Travel insurance",220.0,"","","");
            }

            else if(widget.CheckAnswer[m] == "Voluntary statutory health insurance")
            {
            //Question No 56
              return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for basic health insurance (excluding amounts from the payslip)?","Basic student health insurance",220.0,"","","");
            }

            else if(widget.CheckAnswer[m] == "Health insurance for students")
            {
             //Question No 62
              return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for basic health insurance (Basis-Krankenversicherung)?","Basic health insurance",220.0,"","","");

            }

            else if(widget.CheckAnswer[m] == "No")
            {
             //Question No 20
              return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
            }


          }
        }



        // ====== Supplementary health insurance Starts ====== //

        //Answer No 16
    else if(widget.CheckCompleteQuestion =="What type of contract is ${Questions.healthYourIdentity} supplementary health insurance policy?" && widget.CheckQuestion == "Health insurance")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Additional insurance (statutory)")
        {
           //Question No 17
          return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for supplementary health insurance policies?","Contribution",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Additional insurance (private)")
        {
          //Question No 21
          return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for private supplementary health insurance?","Private supplementary insurance",220.0,"calculation","","");

        }

        }

        }

        // ====== Additional insurance (statutory) Starts ====== //

      //Answer No 17
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for supplementary health insurance policies?" && widget.CheckQuestion == "Contribution")
    {
      //Question No 18
      return healthyesnoContainer("","Health","Have ${Questions.healthYouIdentity} received any reimbursements from these supplementary health insurance policies?","Refunds",220.0,"","","");
    }

//Answer No 18
    else if(widget.CheckCompleteQuestion =="Have ${Questions.healthYouIdentity} received any reimbursements from these supplementary health insurance policies?" && widget.CheckQuestion == "Refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
       //Question No 20
        //For No 430.0
        //For Yes 220.0
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 19
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive?","Refund",220.0,"calculation","","");

      }

    }


    //Answer No 19
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Refund")
    {
      //Question No 20
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
    }

    // ====== Additional insurance (statutory) Ends ====== //


   // ====== Additional insurance (private) Starts ====== //

    //Answer No 21
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for private supplementary health insurance?" && widget.CheckQuestion == "Private supplementary insurance")
    {
      //Question No 22
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any reimbursement for these supplementary insurance policies?","Refunds",220.0,"","","");
    }

    //Answer No 22
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any reimbursement for these supplementary insurance policies?" && widget.CheckQuestion == "Refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 20
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 23
        return healthcalculationContainer("","Health","How much money was reimbursed?","Refund amount",220.0,"calculation","","");

      }

    }


    //Answer No 23
    else if(widget.CheckCompleteQuestion =="How much money was reimbursed?" && widget.CheckQuestion == "Refund amount")
    {
      //Question No 20
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
    }

  // ====== Additional insurance (private) Ends ====== //

  // ====== Supplementary health insurance Ends ====== //


  // ====== Supplementary nursing care insurance Starts ====== //


  //Answer No 24
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for private supplementary nursing insurance?" && widget.CheckQuestion == "Supplementary nursing care insurance")
    {
      //Question No 25
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any reimbursements for these supplementary insurance policies?","Refunds",220.0,"","","");
    }


   //Answer No 25
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any reimbursements for these supplementary insurance policies?" && widget.CheckQuestion == "Refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 20
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 26
        return healthcalculationContainer("","Health","How much money was  reimbursed?","Refund amount",220.0,"calculation","","");

      }

    }


    //Answer No 26
    else if(widget.CheckCompleteQuestion =="How much money was  reimbursed?" && widget.CheckQuestion == "Refund amount")
    {
      //Question No 20
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
    }


  // ====== Supplementary nursing care insurance Ends ====== //


        //For my adult child Starts

    //Answer no 27
    else if(widget.CheckCompleteQuestion =="For how many adult children did ${Questions.healthYouIdentity} pay health insurance contributions?" && widget.CheckQuestion == "Number of children")
    {
      //Question No 28
      return healthcalculationContainer("","Health","What is ${Questions.healthYourIdentity} child's full name?","Your child's name",220.0,"",Questions.healthChildrenText,"");
    }


    //Answer no 28
    else if(widget.CheckCompleteQuestion =="What is ${Questions.healthYourIdentity} child's full name?" && widget.CheckQuestion == "Your child's name")
    {
      //Question No 29
      return healthcalculationContainer("","Health","Enter ${Questions.healthYourIdentity} child's Tax-ID.","Tax-ID child",220.0,"tax",Questions.healthChildrenText,"");
    }



    //Answer no 29
    else if(widget.CheckCompleteQuestion =="Enter ${Questions.healthYourIdentity} child's Tax-ID." && widget.CheckQuestion == "Tax-ID child")
    {
      //Question No 30
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for the basic health insurance of ${Questions.healthYourIdentity} child?","Basic health insurance adult child",220.0,"calculation",Questions.healthChildrenText,"");
    }


    //Answer no 30
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for the basic health insurance of ${Questions.healthYourIdentity} child?" && widget.CheckQuestion == "Basic health insurance adult child")
    {
      //Question No 31
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for the basic nursing care insurance of ${Questions.healthYourIdentity} child?","Basic health insurance adult child",220.0,"calculation",Questions.healthChildrenText,"");
    }


    //Answer no 31
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for the basic nursing care insurance of ${Questions.healthYourIdentity} child?" && widget.CheckQuestion == "Basic health insurance adult child")
    {
      //Question No 32
      return healthyesnoContainer("","Health","Did you get refunds from ${Questions.healthYourIdentity} adult child's health insurance?","Health insurance refunds - child",220.0,"",Questions.healthChildrenText,"");
    }


    //Answer No 32
    else if(widget.CheckCompleteQuestion =="Did you get refunds from ${Questions.healthYourIdentity} adult child's health insurance?" && widget.CheckQuestion == "Health insurance refunds - child")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 34
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for additional health and nursing care insurance for ${Questions.healthYourIdentity} adult child?","Supplementary insurance",220.0,"calculation",Questions.healthChildrenText,"");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 33
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive?","Health insurance refunds - child",220.0,"calculation",Questions.healthChildrenText,"");
      }

    }


    //Answer No 33
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Health insurance refunds - child")
    {
      //Question No 34
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for additional health and nursing care insurance for ${Questions.healthYourIdentity} adult child?","Supplementary insurance",220.0,"calculation",Questions.healthChildrenText,"");
    }



    //Answer No 34
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for additional health and nursing care insurance for ${Questions.healthYourIdentity} adult child?" && widget.CheckQuestion == "Supplementary insurance")
    {
      //Question No 35
      return healthyesnoContainer("","Health","Did you receive any reimbursements from ${Questions.healthYourIdentity} adult child's supplementary health insurance?","Health insurance refunds - child",220.0,"",Questions.healthChildrenText,"");
    }


    //Answer No 35
    else if(widget.CheckCompleteQuestion =="Did you receive any reimbursements from ${Questions.healthYourIdentity} adult child's supplementary health insurance?" && widget.CheckQuestion == "Health insurance refunds - child")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        if(Questions.healthChildrenLength <= Questions.totalHealthChildren)
          {
            //Question No 28
            return healthcalculationContainer("","Health","What is ${Questions.healthYourIdentity} child's full name?","Your child's name",220.0,"",Questions.healthChildrenText,"");
          }
         else
           {
             //Question No 37
             return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
           }

      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 36
        return healthcalculationContainer("","Health","How much were ${Questions.healthYouIdentity} reimbursed?","Health insurance refunds - child",220.0,"calculation",Questions.healthChildrenText,"");
      }

    }

    //Answer No 36
    else if(widget.CheckCompleteQuestion =="How much were ${Questions.healthYouIdentity} reimbursed?" && widget.CheckQuestion == "Health insurance refunds - child")
    {
      if(Questions.healthChildrenLength <= Questions.totalHealthChildren)
      {
       //Question No 28
        return healthcalculationContainer("","Health","What is ${Questions.healthYourIdentity} child's full name?","Your child's name",220.0,"",Questions.healthChildrenText,"");
      }
      else
      {
        //Question No 37
        return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
      }
    }
    //For my adult child Ends





    //For My Partner Starts

        //Answer No 38
    else if(widget.CheckCompleteQuestion =="Please enter ${Questions.healthYourIdentity} spouse's first and last name." && widget.CheckQuestion == "Spouse's name")
    {
      //Question No 39
      return healthcalculationContainer("","Health","What is ${Questions.healthYourIdentity} spouse's tax ID?","Tax ID (partner)",220.0,"tax","","");
    }


    //Answer No 39
    else if(widget.CheckCompleteQuestion =="What is ${Questions.healthYourIdentity} spouse's tax ID?" && widget.CheckQuestion == "Tax ID (partner)")
    {
      //Question No 40
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for the basic health insurance of ${Questions.healthYourIdentity} spouse?","Basic health insurance spouse",220.0,"calculation","","");
    }

    //Answer No 40
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for the basic health insurance of ${Questions.healthYourIdentity} spouse?" && widget.CheckQuestion == "Basic health insurance spouse")
    {
      //Question No 41
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for the basic nursing care insurance of ${Questions.healthYourIdentity} spouse?","Basic nursing care insurance - spouse",220.0,"calculation","","");
    }

    //Answer No 41
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for the basic nursing care insurance of ${Questions.healthYourIdentity} spouse?" && widget.CheckQuestion == "Basic nursing care insurance - spouse")
    {
      //Question No 42
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} get refunds from ${Questions.healthYourIdentity} spouse's health insurance?","Health insurance refunds - spouse",220.0,"","","");
    }


    //Answer No 42
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} get refunds from ${Questions.healthYourIdentity} spouse's health insurance?" && widget.CheckQuestion == "Health insurance refunds - spouse")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 44
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for supplementary private health and nursing care insurance for ${Questions.healthYourIdentity} spouse?","Additional insurance spouse",220.0,"calculation","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 43
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive?","Health insurance refunds - spouse",220.0,"calculation","","");
      }

    }

    //Answer No 43
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Health insurance refunds - spouse")
    {
      //Question No 44
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for supplementary private health and nursing care insurance for ${Questions.healthYourIdentity} spouse?","Additional insurance spouse",220.0,"calculation","","");
    }

    //Answer No 44
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for supplementary private health and nursing care insurance for ${Questions.healthYourIdentity} spouse?" && widget.CheckQuestion == "Additional insurance spouse")
    {
      //Question No 45
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive refunds from ${Questions.healthYourIdentity} spouse's supplementary health insurance?","Health insurance refunds - spouse",220.0,"","","");
    }


    //Answer No 45
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive refunds from ${Questions.healthYourIdentity} spouse's supplementary health insurance?" && widget.CheckQuestion == "Health insurance refunds - spouse")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 37
        return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 46
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive?","Refund amount - spouse",220.0,"calculation","","");
      }

    }

    //Answer No 46
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Refund amount - spouse")
    {
      //Question No 37
      return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
    }

        // For My Partner Ends




    // ====== Foreign health insurance Starts ====== //


    //Answer No 47
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Refund amount - spouse")
    {
      //Question No 48
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for foreign health insurance?","Foreign health insurance",220.0,"calculation","","");
    }

    //Answer No 48
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for foreign health insurance?" && widget.CheckQuestion == "Foreign health insurance")
    {
      //Question No 49
      return healthcalculationContainer("","Health","What share of ${Questions.healthYourIdentity} contribution to foreign health insurance does not entitle ${Questions.healthYouIdentity} to sick pay?","No sick pay",220.0,"calculation","","");
    }


    //Answer No 49
    else if(widget.CheckCompleteQuestion =="What share of ${Questions.healthYourIdentity} contribution to foreign health insurance does not entitle ${Questions.healthYouIdentity} to sick pay?" && widget.CheckQuestion == "No sick pay")
    {
      //Question No 50
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} spend on foreign basic nursing care insurance?","Foreign nursing care insurance",220.0,"calculation","","");
    }


    //Answer No 50
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on foreign basic nursing care insurance?" && widget.CheckQuestion == "Foreign nursing care insurance")
    {
      //Question No 51
      return healthyesnoContainer("","Health","Were ${Questions.healthYouIdentity} reimbursed for contributions from ${Questions.healthYourIdentity} foreign health insurance payments?","Refunds",220.0,"","","");
    }

    //Answer No 51
    else if(widget.CheckCompleteQuestion =="Were ${Questions.healthYouIdentity} reimbursed for contributions from ${Questions.healthYourIdentity} foreign health insurance payments?" && widget.CheckQuestion == "Refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 54
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for foreign supplementary insurance?","Foreign supplementary insurance",220.0,"calculation","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
       //Question No 52
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive from ${Questions.healthYourIdentity} foreign heath insurance?","Refund amount",220.0,"calculation","","");
      }

    }

    //Answer No 52
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive from ${Questions.healthYourIdentity} foreign heath insurance?" && widget.CheckQuestion == "Refund amount")
    {
      //Question No 53
      return healthcalculationContainer("","Health","What share of the reimbursed amount does not entitle ${Questions.healthYouIdentity} to sick pay?","Refund of child sick pay",220.0,"calculation","","");
    }


    //Answer No 53
    else if(widget.CheckCompleteQuestion =="What share of the reimbursed amount does not entitle ${Questions.healthYouIdentity} to sick pay?" && widget.CheckQuestion == "Refund of child sick pay")
    {
      //Question No 54
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for foreign supplementary insurance?","Foreign supplementary insurance",220.0,"calculation","","");
    }


    //Answer No 54
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for foreign supplementary insurance?" && widget.CheckQuestion == "Foreign supplementary insurance")
    {
      //Question No 37
      return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
    }



    // ====== Foreign health insurance Ends ====== //


    // ====== Travel insurance Starts ====== //


//Answer No 55
    else if(widget.CheckCompleteQuestion =="What was the annual amount spent on travel insurance?" && widget.CheckQuestion == "Travel insurance")
    {
      //Question No 20
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
    }


    // ====== Travel insurance Ends ====== //


    // ====== Voluntary statutory health insurance Starts ====== //

//Answer No 56
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for basic health insurance (excluding amounts from the payslip)?" && widget.CheckQuestion == "Basic student health insurance")
    {
      //Question No 57
      return healthcalculationContainer("","Health","How much of ${Questions.healthYourIdentity} premium is available to ${Questions.healthYouIdentity} as sick pay?","Sick pay",220.0,"calculation","","");
    }

    //Answer No 57
    else if(widget.CheckCompleteQuestion =="How much of ${Questions.healthYourIdentity} premium is available to ${Questions.healthYouIdentity} as sick pay?" && widget.CheckQuestion == "Sick pay")
    {
      //Question No 58
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for basic nursing care insurance?","Basic nursing care insurance",220.0,"calculation","","");
    }

    //Answer No 58
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for basic nursing care insurance?" && widget.CheckQuestion == "Basic nursing care insurance")
    {
      //Question No 59
      return healthyesnoContainer("","Health","Were ${Questions.healthYouIdentity} reimbursed for contributions from ${Questions.healthYouIdentity} health insurance payments?","Health insurance refunds",220.0,"","","");
    }


    //Answer No 59
    else if(widget.CheckCompleteQuestion =="Were ${Questions.healthYouIdentity} reimbursed for contributions from ${Questions.healthYouIdentity} health insurance payments?" && widget.CheckQuestion == "Health insurance refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 37
        return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 60
        return healthcalculationContainer("","Health","How much reimbursement did ${Questions.healthYouIdentity} receive from health insurance?","Refund amount health insurance",220.0,"calculation","","");
      }

    }


    //Answer No 60
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.healthYouIdentity} receive from health insurance?" && widget.CheckQuestion == "Refund amount health insurance")
    {
      //Question No 61
      return healthcalculationContainer("","Health","What share of ${Questions.healthYourIdentity} contribution to ${Questions.healthYourIdentity} health insurance entitles ${Questions.healthYouIdentity} to sick pay?","Sick pay",220.0,"calculation","","");
    }


    //Answer No 61
    else if(widget.CheckCompleteQuestion =="What share of ${Questions.healthYourIdentity} contribution to ${Questions.healthYourIdentity} health insurance entitles ${Questions.healthYouIdentity} to sick pay?" && widget.CheckQuestion == "Sick pay")
    {
      //Question No 37
      return healthyesnoContainer("","Health","Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?","Claim for subsidies",220.0,"","","");
    }



    // ====== Voluntary statutory health insurance Ends ====== //




    // ====== Health insurance for students Starts ====== //

    //Answer No 62
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for basic health insurance (Basis-Krankenversicherung)?" && widget.CheckQuestion == "Basic health insurance")
    {
      //Question No 63
      return healthcalculationContainer("","Health","How much of ${Questions.healthYourIdentity} health insurance premium is available to ${Questions.healthYouIdentity} as sick pay?","Thereof claim to sick pay",220.0,"calculation","","");
    }


    //Answer No 63
    else if(widget.CheckCompleteQuestion =="How much of ${Questions.healthYourIdentity} health insurance premium is available to ${Questions.healthYouIdentity} as sick pay?" && widget.CheckQuestion == "Thereof claim to sick pay")
    {
      //Question No 64
      return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} pay for basic nursing care insurance (Basis-Pflegeversicherung)?","Basic nursing care insurance",220.0,"calculation","","");
    }


    //Answer No 64
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for basic nursing care insurance (Basis-Pflegeversicherung)?" && widget.CheckQuestion == "Basic nursing care insurance")
    {
      //Question No 65
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} receive any reimbursement from ${Questions.healthYourIdentity} health insurance?","Health insurance refunds",220.0,"","","");
    }


    //Answer No 65
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive any reimbursement from ${Questions.healthYourIdentity} health insurance?" && widget.CheckQuestion == "Health insurance refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
//Question No 68
        return healthyesnoContainer("","Health","Have ${Questions.healthYouIdentity} received subsidies to ${Questions.healthYourIdentity} health insurance from the BAföG office?","Health insurance subsidies from the BAföG office",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 66
        return healthcalculationContainer("","Health","How much reimbursement  did ${Questions.healthYouIdentity} receive?","Amount reimbursed",220.0,"calculation","","");
      }

    }

    //Answer No 66
    else if(widget.CheckCompleteQuestion =="How much reimbursement  did ${Questions.healthYouIdentity} receive?" && widget.CheckQuestion == "Amount reimbursed")
    {
      //Question No 67
      return healthcalculationContainer("","Health","What share of ${Questions.healthYourIdentity} contribution to ${Questions.healthYourIdentity} health insurance entitles ${Questions.healthYouIdentity} to sick pay?","Thereof claim to sick pay",220.0,"calculation","","");
    }

    //Answer No 67
    else if(widget.CheckCompleteQuestion =="What share of ${Questions.healthYourIdentity} contribution to ${Questions.healthYourIdentity} health insurance entitles ${Questions.healthYouIdentity} to sick pay?" && widget.CheckQuestion == "Thereof claim to sick pay")
    {
      //Question No 68
      return healthyesnoContainer("","Health","Have ${Questions.healthYouIdentity} received subsidies to ${Questions.healthYourIdentity} health insurance from the BAföG office?","Health insurance subsidies from the BAföG office",220.0,"","","");
    }


    //Answer No 68
    else if(widget.CheckCompleteQuestion =="Have ${Questions.healthYouIdentity} received subsidies to ${Questions.healthYourIdentity} health insurance from the BAföG office?" && widget.CheckQuestion == "Health insurance subsidies from the BAföG office")
    {

      if(widget.CheckAnswer[0] == "No")
      {
       //Question No 20
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 69
        return healthcalculationContainer("","Health","How much did ${Questions.healthYouIdentity} receive in BAföG subsidies?","Amount BAföG subsidies",220.0,"calculation","","");
      }

    }


    //Answer No 69
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} receive in BAföG subsidies?" && widget.CheckQuestion == "Amount BAföG subsidies")
    {
      //Question No 20
      return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
    }

    // ====== Health insurance for students Ends ====== //




    //For  adult child and Partner and foreign health insurance and Voluntary statutory health insurance Starts
    //Answer No 37
    else if(widget.CheckCompleteQuestion =="Are ${Questions.healthYouIdentity} entitled to subsidies for ${Questions.healthYourIdentity} health insurance contributions or ${Questions.healthYourIdentity} medical expenses?" && widget.CheckQuestion == "Claim for subsidies")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 20
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 20
        return healthyesnoContainer("","Health","Did ${Questions.healthYouIdentity} have expenses for work-related health issues?","Work-related illness",220.0,"","","");
      }

    }

//For  adult child and Partner and foreign health insurance and Voluntary statutory health insurance Ends

// ====== Other health insurance Ends ====== //


   //Answer No 20
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} have expenses for work-related health issues?" && widget.CheckQuestion == "Work-related illness")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        if(Questions.livingChildrenRelation == "Children")
        {
          //Question No 131
          return healthmultipleoptionsContainer("","Your healthcare costs","What special health costs did ${Questions.healthYouIdentity} have for ${Questions.healthYourIdentity} family?","Medical expenses",["Prescribed medication","Treatment by a doctor","Trips to the doctor or to treatments","Operations","Glasses","Contact lenses","Hearing aid","Dental treatment","Wheelchair / walking aid","Hospital stay","Nursing care","Health course","Other costs","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None","","");
        }
        else{
          //Question No 72
          return healthmultipleoptionsContainer("","Your healthcare costs","Which non work related medical expenses would ${Questions.healthYouIdentity} like to write off?","Treatment costs",["Prescribed medication","Treatment by a doctor","Trips to the doctor or to treatments","Operations","Glasses","Contact lenses","Hearing aid","Dental treatment","Wheelchair / walking aid","Hospital stay","Nursing care","Health course","Other costs","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None","","");
        }
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 70
        //For No 430.0
        //For Yes 220.0
        return healthyesnoContainer("","Health","Did a doctor certify the professional cause of ${Questions.healthYourIdentity} job related health costs?","Certified by doctor",430.0,"","","");
      }

    }


    //Answer No 70
    else if(widget.CheckCompleteQuestion =="Did a doctor certify the professional cause of ${Questions.healthYourIdentity} job related health costs?" && widget.CheckQuestion == "Certified by doctor")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        if(Questions.livingChildrenRelation == "Children")
        {
          //Question No 131
          return healthmultipleoptionsContainer("","Your healthcare costs","What special health costs did ${Questions.healthYouIdentity} have for ${Questions.healthYourIdentity} family?","Medical expenses",["Prescribed medication","Treatment by a doctor","Trips to the doctor or to treatments","Operations","Glasses","Contact lenses","Hearing aid","Dental treatment","Wheelchair / walking aid","Hospital stay","Nursing care","Health course","Other costs","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None","","");
        }
        else{
          //Question No 72
          return healthmultipleoptionsContainer("","Your healthcare costs","Which non work related medical expenses would ${Questions.healthYouIdentity} like to write off?","Treatment costs",["Prescribed medication","Treatment by a doctor","Trips to the doctor or to treatments","Operations","Glasses","Contact lenses","Hearing aid","Dental treatment","Wheelchair / walking aid","Hospital stay","Nursing care","Health course","Other costs","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None","","");
        }
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 71
        return healthcalculationContainer("","Health","How much have ${Questions.healthYouIdentity} spent on work-related health issues?","Work-related healthcare costs",430.0,"calculation","","");
      }

    }

    //Answer No 71
    else if(widget.CheckCompleteQuestion =="How much have ${Questions.healthYouIdentity} spent on work-related health issues?" && widget.CheckQuestion == "Work-related healthcare costs")
    {

      if(Questions.livingChildrenRelation == "Children")
      {
        //Question No 131
        return healthmultipleoptionsContainer("","Your healthcare costs","What special health costs did ${Questions.healthYouIdentity} have for ${Questions.healthYourIdentity} family?","Medical expenses",["Prescribed medication","Treatment by a doctor","Trips to the doctor or to treatments","Operations","Glasses","Contact lenses","Hearing aid","Dental treatment","Wheelchair / walking aid","Hospital stay","Nursing care","Health course","Other costs","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None","","");
      }
      else{
        //Question No 72
        return healthmultipleoptionsContainer("","Your healthcare costs","Which non work related medical expenses would ${Questions.healthYouIdentity} like to write off?","Treatment costs",["Prescribed medication","Treatment by a doctor","Trips to the doctor or to treatments","Operations","Glasses","Contact lenses","Hearing aid","Dental treatment","Wheelchair / walking aid","Hospital stay","Nursing care","Health course","Other costs","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"None","","");
      }

    }

    // ====== Non work related Medical Expense Starts ====== //


    //Answer No 72 and 131
    else if((widget.CheckCompleteQuestion =="Which non work related medical expenses would ${Questions.healthYouIdentity} like to write off?" || widget.CheckCompleteQuestion =="What special health costs did ${Questions.healthYouIdentity} have for ${Questions.healthYourIdentity} family?" ) && (widget.CheckQuestion == "Treatment costs" || widget.CheckQuestion == "Medical expenses"))
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Prescribed medication")
        {
         //Question No 73
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend in total on medication?","Medication costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Treatment by a doctor")
        {
         //Questiion No 77
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend in total for medical treatments?","Treatment costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Trips to the doctor or to treatments")
        {
         //Question No 123
          return healthcalculationContainer("","Your healthcare costs","To how many different doctors did ${Questions.healthYouIdentity} travel?","Doctors",280.0,"calculation","","");

        }

        else if(widget.CheckAnswer[m] == "Operations")
        {
        //Question No 80
          return healthcalculationContainer("","Your healthcare costs","What did ${Questions.healthYouIdentity} spend in total on operations?","Operation costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Glasses")
        {
        //Question No 83
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend on glasses?","Glasses costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Contact lenses")
        {
          //Question No 86
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend on contact lenses?","Cost of contact lenses",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Hearing aid")
        {
          //Question No 89
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend on hearing aids?","Cost of hearing aid",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Dental treatment")
        {
          //Question No 92
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend on dental implants, dentures, etc.?","Cost of dental treatments",220.0,"calculation","","");

        }

        else if(widget.CheckAnswer[m] == "Wheelchair / walking aid")
        {
          //Question No 95
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend overall on wheelchairs or walking aids?","Costs for wheelchair",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Hospital stay")
        {
          //Question No 98
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} pay for your stay in hospital?","Accommodation costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Nursing care")
        {
          //Question No 101
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend on nursing care?","Nursing care costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Health course")
        {
          //Question No 104
          return healthcalculationContainer("","Your healthcare costs","How much have ${Questions.healthYouIdentity} spent on healthcare workshops?","Healthcare workshops",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "Other costs")
        {
          //Question No 107
          return healthcalculationContainer("","Your healthcare costs","What additional costs did ${Questions.healthYouIdentity} have (e.g. physical therapy, naturopathy homeopathy or rehabilitation costs)?","Other costs",220.0,"calculation","","");
        }

        else if(widget.CheckAnswer[m] == "None")
        {
//Question No 76
          return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
        }
      }
    }



    // ====== Prescribed medication Starts ====== //

        //Answer No 73
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend in total on medication?" && widget.CheckQuestion == "Medication costs")
    {
      //Question No 74
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost of medication?","Reimbursements",220.0,"","","");
    }


   //Answer No 74
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost of medication?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 75
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?","Reimbursement amount",220.0,"calculation","","");
      }

    }


    //Answer No 75
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?" && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }
   // ====== Prescribed medication Ends ====== //






  // ====== Treatment by a doctor Starts ====== //

    //Answer No 77
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend in total for medical treatments?" && widget.CheckQuestion == "Treatment costs")
    {
      //Question No 78
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse your treatment costs?","Reimbursements",430.0,"","","");
    }


    //Answer No 78
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse your treatment costs?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 79
        return healthcalculationContainer("","Your healthcare costs"," How much has been reimbursed?","Reimbursement amount",220.0,"calculation","","");
      }

    }


    //Answer No 79
    else if(widget.CheckCompleteQuestion ==" How much has been reimbursed?" && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }

  // ====== Treatment by a doctor Ends ====== //



    // ====== Trips to the doctor or to treatments Starts ====== //
    //Answer No 123
    else if(widget.CheckCompleteQuestion =="To how many different doctors did ${Questions.healthYouIdentity} travel?" && widget.CheckQuestion == "Doctors")
    {
      //Question No 124
      return healthtwooptionContainer("","Your healthcare costs","Where have ${Questions.healthYouIdentity} travelled to?","${Questions.doctorTripLength}. drive to doctor",["Germany","Abroad"],430.0,"",Questions.doctorTripText,"");
    }

    //Answer No 124
    else if(widget.CheckCompleteQuestion =="Where have ${Questions.healthYouIdentity} travelled to?" && widget.CheckQuestion == "${Questions.doctorTripLength}. drive to doctor")
    {

      if(widget.CheckAnswer[0] == "Germany")
      {
        //Question No 125
        return healthmultipleoptionsContainer("","Your healthcare costs","How did ${Questions.healthYouIdentity} get there?","Means of transport",["By car","Bus / train","Airplane","Bicycle","On foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.doctorTripText,"");
      }

      else if(widget.CheckAnswer[0] == "Abroad")
      {
        //Question No 125
        return healthmultipleoptionsContainer("","Your healthcare costs","How did ${Questions.healthYouIdentity} get there?","Means of transport",["By car","Bus / train","Airplane","Bicycle","On foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.doctorTripText,"");
      }

    }

    //Answer No 125
    else if(widget.CheckCompleteQuestion =="How did ${Questions.healthYouIdentity} get there?" && widget.CheckQuestion == "Means of transport")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {
          //Question No 126
          //Ya container baad ma change hoga
          return healthcalculationContainer("","Your healthcare costs","Please enter the start and end point of ${Questions.healthYourIdentity} route that ${Questions.healthYouIdentity} travelled by car.","Distance by car",220.0,"",Questions.doctorTripText,"");
        }

        else if(widget.CheckAnswer[m] == "Bus / train")
        {
          //Bus/train and Airplace goes to same question
         //Question No 130
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend in total on trains to go to doctor no. ${Questions.doctorTripLength}?","Amount",220.0,"calculation",Questions.doctorTripText,"");
        }

        else if(widget.CheckAnswer[m] == "Airplane")
        {
          //Bus/train and Airplace goes to same question
         //Question No 130
          return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend in total on trains to go to doctor no. ${Questions.doctorTripLength}?","Amount",220.0,"calculation",Questions.doctorTripText,"");

        }

        else if(widget.CheckAnswer[m] == "Bicycle")
        {
          if(Questions.doctorTripLength <= Questions.totalDoctorTrip)
          {
            //Question No 124
            return healthtwooptionContainer("","Your healthcare costs","Where have ${Questions.healthYouIdentity} travelled to?","${Questions.doctorTripLength}. drive to doctor",["Germany","Abroad"],430.0,"",Questions.doctorTripText,"");
          }
          else
          {
            //Question No 76
            return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
          }
        }

        else if(widget.CheckAnswer[m] == "On foot")
        {
          if(Questions.doctorTripLength <= Questions.totalDoctorTrip)
          {
            //Question No 124
            return healthtwooptionContainer("","Your healthcare costs","Where have ${Questions.healthYouIdentity} travelled to?","${Questions.doctorTripLength}. drive to doctor",["Germany","Abroad"],430.0,"",Questions.doctorTripText,"");
          }
          else
          {
            //Question No 76
            return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
          }
        }

      }
    }

    //By Car starts //
    //Answer No 126

    else if(widget.CheckCompleteQuestion =="Please enter the start and end point of ${Questions.healthYourIdentity} route that ${Questions.healthYouIdentity} travelled by car." && widget.CheckQuestion == "Distance by car")
    {
      //Question No 127
      return healthcalculationContainer("","Your healthcare costs","How often did ${Questions.healthYouIdentity} take the route to doctor No.${Questions.doctorTripLength} by car?","Number of drives by car",220.0,"",Questions.doctorTripText,"");
    }


    //Answer No 127
    else if(widget.CheckCompleteQuestion =="How often did ${Questions.healthYouIdentity} take the route to doctor No.${Questions.doctorTripLength} by car?" && widget.CheckQuestion == "Number of drives by car")
    {
      //Question No 128
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse ${Questions.healthYourIdentity} travel costs?","Reimbursement of costs",220.0,"",Questions.doctorTripText,"");
    }

    //By Car ends //


    //By Bus/train Starts

//Answer No 130
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend in total on trains to go to doctor no. ${Questions.doctorTripLength}?" && widget.CheckQuestion == "Amount")
    {
      //Question No 128
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse ${Questions.healthYourIdentity} travel costs?","Reimbursement of costs",220.0,"",Questions.doctorTripText,"");
    }

    //By Bus/train Ends




    //Answer No 128
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse ${Questions.healthYourIdentity} travel costs?" && widget.CheckQuestion == "Reimbursement of costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        if(Questions.doctorTripLength <= Questions.totalDoctorTrip)
        {
          //Question No 124
          return healthtwooptionContainer("","Your healthcare costs","Where have ${Questions.healthYouIdentity} travelled to?","${Questions.doctorTripLength}. drive to doctor",["Germany","Abroad"],430.0,"",Questions.doctorTripText,"");
        }
        else
          {
            //Question No 76
            return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
          }
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
      //Question No 129
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?      ","Reimbursement amount",220.0,"calculation",Questions.doctorTripText,"");
      }

    }

    //Answer No 129
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?      " && widget.CheckQuestion == "Reimbursement amount")
    {
      if(Questions.doctorTripLength <= Questions.totalDoctorTrip)
      {
        //Question No 124
        return healthtwooptionContainer("","Your healthcare costs","Where have ${Questions.healthYouIdentity} travelled to?","${Questions.doctorTripLength}. drive to doctor",["Germany","Abroad"],430.0,"",Questions.doctorTripText,"");
      }
      else
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
      }
    }




    // ====== Trips to the doctor or to treatments Ends ====== //




 // ====== Operations Starts ====== //


    //Answer No 80
    else if(widget.CheckCompleteQuestion =="What did ${Questions.healthYouIdentity} spend in total on operations?" && widget.CheckQuestion == "Operation costs")
    {
      //Question No 81
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost of operations?","Reimbursements",220.0,"","","");
    }


    //Answer No 81
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost of operations?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 82
        return healthcalculationContainer("","Your healthcare costs","  How much has been reimbursed?","Reimbursement amount",220.0,"calculation","","");
      }

    }


    //Answer No 82
    else if(widget.CheckCompleteQuestion =="  How much has been reimbursed?" && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }



 // ====== Operations Ends ====== //



  // ====== Glasses Starts ====== //

   //Answer no 83
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on glasses?" && widget.CheckQuestion == "Glasses costs")
    {
      //Question No 84
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost of glasses?","Reimbursements",220.0,"","","");
    }


    //Answer No 84
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost of glasses?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 85
        return healthcalculationContainer("","Your healthcare costs","How much has been  reimbursed?","Reimbursement amount",220.0,"calculation","","");
      }

    }

    //Answer No 85
    else if(widget.CheckCompleteQuestion =="How much has been  reimbursed?" && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }


 // ====== Glasses Ends ====== //


 // ====== Contact lenses Starts ====== //

    //Answer no 86
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on contact lenses?" && widget.CheckQuestion == "Cost of contact lenses")
    {
      //Question No 87
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost of contact lenses?","Reimbursements",220.0,"","","");
    }


    //Answer No 87
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost of contact lenses?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 88
        return healthcalculationContainer("","Your healthcare costs","How much has been reimburse?","Reimbursement amount",220.0,"calculation","","");
      }

    }

    //Answer No 88
    else if(widget.CheckCompleteQuestion =="How much has been reimburse?" && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }


        // ====== Contact lenses Ends ====== //



   // ====== hearing aids Start  ====== //

    //Answer no 89
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on hearing aids?" && widget.CheckQuestion == "Cost of hearing aid")
    {
      //Question No 90
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost of hearing aids?","Reimbursements",220.0,"","","");
    }


    //Answer No 90
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost of hearing aids?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 91
        return healthcalculationContainer("","Your healthcare costs","How much has reimburse?","Reimbursement amount",220.0,"calculation","","");
      }

    }


    //Answer No 91
    else if(widget.CheckCompleteQuestion =="How much has reimburse?" && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }


  // ====== hearing aids Ends  ====== //


  // ====== Dental treatment Starts ====== //

    //Answer no 92
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on dental implants, dentures, etc.?" && widget.CheckQuestion == "Cost of dental treatments")
    {
      //Question No 93
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost dental treatments?","Reimbursements",220.0,"","","");
    }


    //Answer No 93
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost dental treatments?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 94
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed? ","Reimbursement amount",220.0,"calculation","","");
      }

    }

    //Answer No 94
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed? " && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }

    // ====== Dental treatment Ends ====== //



  // ====== Wheelchair / walking aid Starts ====== //

    //Answer no 95
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend overall on wheelchairs or walking aids?" && widget.CheckQuestion == "Costs for wheelchair")
    {
      //Question No 96
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the cost of a wheelchair or walking aid?","Reimbursements",220.0,"","","");
    }


    //Answer No 96
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the cost of a wheelchair or walking aid?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 97
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?  ","Reimbursement amount",220.0,"calculation","","");
      }

    }

    //Answer No 97
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?  " && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }



 // ====== Wheelchair / walking aid Ends ====== //


 // ====== Hospital stay Starts ====== //

    //Answer no 98
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} pay for your stay in hospital?" && widget.CheckQuestion == "Accommodation costs")
    {
      //Question No 99
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse the accommodation costs for your hospital stay?","Healthcare reimbursement",220.0,"","","");
    }

    //Answer No 99
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse the accommodation costs for your hospital stay?" && widget.CheckQuestion == "Healthcare reimbursement")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 100
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?   ","Reimbursement amount",220.0,"calculation","","");
      }

    }


    //Answer No 100
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?   " && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }


 // ====== Hospital stay Ends ====== //


 // ====== Nursing care Starts ====== //

    //Answer no 101
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on nursing care?" && widget.CheckQuestion == "Nursing care costs")
    {
      //Question No 102
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYourIdentity} health insurance reimburse ${Questions.healthYourIdentity} nursing care costs?","Reimbursements",220.0,"","","");
    }


    //Answer No 102
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYourIdentity} health insurance reimburse ${Questions.healthYourIdentity} nursing care costs?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 103
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?    ","Reimbursement amount",220.0,"calculation","","");
      }

    }

    //Answer No 103
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?    " && widget.CheckQuestion == "Reimbursement amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }

 // ====== Nursing care Ends ====== //



 // ====== Health course Starts ====== //

    //Answer no 104
    else if(widget.CheckCompleteQuestion =="How much have ${Questions.healthYouIdentity} spent on healthcare workshops?" && widget.CheckQuestion == "Healthcare workshops")
    {
      //Question No 105
      return healthyesnoContainer("","Your healthcare costs","Has ${Questions.healthYourIdentity} health insurance reimbursed ${Questions.healthYourIdentity} healthcare workshop costs?","Reimbursements",220.0,"","","");
    }

   //Answer no 105
    else if(widget.CheckCompleteQuestion =="Has ${Questions.healthYourIdentity} health insurance reimbursed ${Questions.healthYourIdentity} healthcare workshop costs?" && widget.CheckQuestion == "Reimbursements")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 106
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?     ","Refund amount",220.0,"calculation","","");
      }

    }

    //Answer No 106
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?     " && widget.CheckQuestion == "Refund amount")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }


 // ====== Health course Ends ====== //


   // ======= Other costs Starts ====== //

    //Answer no 107
    else if(widget.CheckCompleteQuestion =="What additional costs did ${Questions.healthYouIdentity} have (e.g. physical therapy, naturopathy homeopathy or rehabilitation costs)?" && widget.CheckQuestion == "Other costs")
    {
      //Question No 108
      return healthcalculationContainer("","Your healthcare costs","How much did ${Questions.healthYouIdentity} spend on other costs?","Amount of other costs",220.0,"calculation","","");
    }

    //Answer no 108
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on other costs?" && widget.CheckQuestion == "Amount of other costs")
    {
      //Question No 109
      return healthyesnoContainer("","Your healthcare costs","Did ${Questions.healthYouIdentity} receive reimbursement for this from ${Questions.healthYourIdentity} health insurance?","Reimbursement of costs from health insurance",220.0,"","","");
    }

    //Answer no 109
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive reimbursement for this from ${Questions.healthYourIdentity} health insurance?" && widget.CheckQuestion == "Reimbursement of costs from health insurance")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 76
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 110
        return healthcalculationContainer("","Your healthcare costs","How much has been reimbursed?","Health insurance reimbursement",220.0,"calculation","","");
      }

    }

    //Answer No 110
    else if(widget.CheckCompleteQuestion =="How much has been reimbursed?" && widget.CheckQuestion == "Health insurance reimbursement")
    {
      //Question No 76
      return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} nurse another person at home without payment?","Free care of others",430.0,"","","");
    }


        // ======= Other costs Ends ====== //

   // ====== Non work related Medical Expense Ends ====== //



  //Answer No 76
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} nurse another person at home without payment?" && widget.CheckQuestion == "Free care of others")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 119
        return healthyesnoContainer("","Costs funeral","Did ${Questions.healthYouIdentity} have any funeral costs?","Funeral costs",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 111
        return healthyesnoContainer("","Care of others","Did ${Questions.healthYouIdentity} care for more than one person?","Care for multiple persons",220.0,"","","");
      }

    }


    //Answer No 111
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} care for more than one person?" && widget.CheckQuestion == "Care for multiple persons")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 114
        return healthcalculationContainer("","Care of others","What is the full name of the person ${Questions.healthYouIdentity} cared for?","Name of the person",220.0,"","","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
       //Question No 112
        return healthcalculationContainer("","Care of others","How many people did ${Questions.healthYouIdentity} take care of?","Number of people cared for",220.0,"loop","","");
      }

    }

    //Answer No 112
    else if(widget.CheckCompleteQuestion =="How many people did ${Questions.healthYouIdentity} take care of?" && widget.CheckQuestion == "Number of people cared for")
    {
      //Question No 113
      return healthcalculationContainer("","Care of others","What is the full name of the person that has been cared for?","Name of the person",220.0,"",Questions.peopleCareText,"");
    }


    //Answer no 113 and Answer No 114
    else if((widget.CheckCompleteQuestion =="What is the full name of the person that has been cared for?" ||  widget.CheckCompleteQuestion =="What is the full name of the person ${Questions.healthYouIdentity} cared for?") && widget.CheckQuestion == "Name of the person")
    {
      //Question No 115
      return healthaddressContainer("","Care of others","What is the address of the person ${Questions.healthYouIdentity} cared for?","Address of the person",220.0,"",Questions.peopleCareText,"");
    }

    //Answer no 115
    else if(widget.CheckCompleteQuestion =="What is the address of the person ${Questions.healthYouIdentity} cared for?" && widget.CheckQuestion == "Address of the person")
    {
      //Question No 116
      return healthcalculationContainer("","Care of others","What kind of relationship is there to the person nursed?","Relationship to this person",220.0,"",Questions.peopleCareText,"");
    }

    //Answer no 116
    else if(widget.CheckCompleteQuestion =="What kind of relationship is there to the person nursed?" && widget.CheckQuestion == "Relationship to this person")
    {
      //Question No 117
      return healthyesnoContainer("","Care of others","Did other people help ${Questions.healthYouIdentity} to care for this person?","Other carers",220.0,"",Questions.peopleCareText,"");
    }

    //Answer No 117
    else if(widget.CheckCompleteQuestion =="Did other people help ${Questions.healthYouIdentity} to care for this person?" && widget.CheckQuestion == "Other carers")
    {

      if(widget.CheckAnswer[0] == "No")
      {
       if(Questions.peopleCareLength <= Questions.totalPeopleCare && Questions.totalPeopleCare > 0)
         {
           //Question No 113
           return healthcalculationContainer("","Care of others","What is the full name of the person that has been cared for?","Name of the person",220.0,"",Questions.peopleCareText,"");
         }
         else
           {
             //Question No 119
             return healthyesnoContainer("","Costs funeral","Did ${Questions.healthYouIdentity} have any funeral costs?","Funeral costs",220.0,"","","");
       }
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 118
        return healthcalculationContainer("","Care of others","How many other carers were there?","Number of carers",220.0,"",Questions.peopleCareText,"");
      }

    }


    //Answer no 118
    else if(widget.CheckCompleteQuestion =="How many other carers were there?" && widget.CheckQuestion == "Number of carers")
    {
      if(Questions.peopleCareLength <= Questions.totalPeopleCare && Questions.totalPeopleCare > 0)
      {
        //Question No 113
        return healthcalculationContainer("","Care of others","What is the full name of the person that has been cared for?","Name of the person",220.0,"",Questions.peopleCareText,"");
      }
      else
      {
        //Question No 119
        return healthyesnoContainer("","Costs funeral","Did ${Questions.healthYouIdentity} have any funeral costs?","Funeral costs",220.0,"","","");
      }
    }

    //Answer No 119
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} have any funeral costs?" && widget.CheckQuestion == "Funeral costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
       return FinishCategory("Health Category","Finance Category");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 120
        return healthcalculationContainer("","Costs funeral","How much did ${Questions.healthYouIdentity} spend on the funeral?","Amount of funeral costs",220.0,"calculation","","");
      }

    }

    //Answer No 120
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.healthYouIdentity} spend on the funeral?" && widget.CheckQuestion == "Amount of funeral costs")
    {
      //Question No 121
      return healthyesnoContainer("","Costs funeral","Did ${Questions.healthYouIdentity} receive an inheritance?","Inheritance",220.0,"","","");
    }


    //Answer No 121
    else if(widget.CheckCompleteQuestion =="Did ${Questions.healthYouIdentity} receive an inheritance?" && widget.CheckQuestion == "Inheritance")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        return FinishCategory("Health Category","Finance Category");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 122
        return healthcalculationContainer("","Costs funeral","What was the total tax value of the inheritance?","Value of inheritance",220.0,"calculation","","");
      }

    }

    //Answer No 122
    else if(widget.CheckCompleteQuestion =="What was the total tax value of the inheritance?" && widget.CheckQuestion == "Value of inheritance")
    {
      return FinishCategory("Health Category","Finance Category");
    }

      }

  }


  Widget healthmultithreeContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData , String Suggestion)
  {
    Questions.healthAnimatedContainer = animatedcontainer;
    return HealthMultiThreeContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:370.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }


  Widget healthyesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, String Suggestion)
  {
    Questions.healthAnimatedContainer = animatedcontainer;
    return HealthYesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }


  Widget healthcalculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, String Suggestion)
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return HealthCalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget healthmultipleoptionsContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData, String Suggestion)
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return HealthMultipleOptionsContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:430.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget healthmultitwoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData, String Suggestion)
  {
    Questions.healthAnimatedContainer = animatedcontainer;
    return HealthMultiTwoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:320.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget healthaddressContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, String Suggestion)
  {
    Questions.healthAnimatedContainer = animatedcontainer;
    return HealthAddressContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:210.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);

  }

  Widget healthtwooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData,  String Suggestion )
  {
    Questions.healthAnimatedContainer = animatedcontainer;
    return HealthTwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:280.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

}