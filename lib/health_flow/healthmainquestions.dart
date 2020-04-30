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
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)
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

            dynamicContainerbig.add(
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                      height: 1.0,
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
                    border: Border.all(width: 1.0, color: Colors.lightBlue)
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
            }

            else if(widget.CheckAnswer[m] == "For my Partner")
            {

            }

            else if(widget.CheckAnswer[m] == "Foreign health insurance")
            {


            }

            else if(widget.CheckAnswer[m] == "Travel insurance")
            {

            }

            else if(widget.CheckAnswer[m] == "Voluntary statutory health insurance")
            {

            }

            else if(widget.CheckAnswer[m] == "Health insurance for students")
            {


            }

            else if(widget.CheckAnswer[m] == "No")
            {

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
        return healthyesnoContainer("","Health","Did you have expenses for work-related health issues?","Work-related illness",220.0,"","","");
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
      return healthyesnoContainer("","Health","Did you have expenses for work-related health issues?","Work-related illness",220.0,"","","");
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
        return healthyesnoContainer("","Health","Did you have expenses for work-related health issues?","Work-related illness",220.0,"","","");
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
      return healthyesnoContainer("","Health","Did you have expenses for work-related health issues?","Work-related illness",220.0,"","","");
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
        return healthyesnoContainer("","Health","Did you have expenses for work-related health issues?","Work-related illness",220.0,"","","");
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
      return healthyesnoContainer("","Health","Did you have expenses for work-related health issues?","Work-related illness",220.0,"","","");
    }


  // ====== Supplementary nursing care insurance Ends ====== //





        // ====== Other health insurance Ends ====== //




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

}