import 'package:easy_taxx/livingsituation_flow/container1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:easy_taxx/finance_flow/financemultipleoptionscontainer.dart';
import 'package:easy_taxx/finance_flow/financecalculationcontainer.dart';
import 'package:easy_taxx/finance_flow/financeyesnocontainer.dart';
import 'package:easy_taxx/finance_flow/financetwooptioncontainer.dart';
import 'package:easy_taxx/finance_flow/financemultitwocontainer.dart';
import 'package:easy_taxx/finance_flow/financedifferentoptioncontainer.dart';
import 'package:easy_taxx/finance_flow/financedatecontainer.dart';




class FinanceMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  FinanceMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _FinanceMainQuestionsState createState() => _FinanceMainQuestionsState();
}

class _FinanceMainQuestionsState extends State<FinanceMainQuestions> {
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
    print("question length:" + Questions.financeAnswerShow.length.toString());

    for (k = l; k < Questions.financeAnswerShow.length; k++) {
      print("how manysdsdsd");
      screenHeightbig = 0.0;
      if (Questions.financeAnswerShow[k]['identity'] == "You" ||
          Questions.financeAnswerShow[k]['identity'] == "You & Partner" ||
          Questions.financeAnswerShow[k]['identity'] == "Partner") {
        screenHeight = screenHeight + 70.0;
      }
      else if (Questions.financeAnswerShow[k]['details'] == "") {
        screenHeight = screenHeight + 60.0;
        detail = true;
      }
      else {
        detailsHeight = Questions.financeAnswerShow[k]['details'];

        for (l = k; l < Questions.financeAnswerShow.length; l++) {
          if (Questions.financeAnswerShow[l]['details'] == detailsHeight) {
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
    screenHeight = screenHeight + Questions.financeAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:" + screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;
  }


  void DynamicContainer() {
    hlength = 0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i = j; i < Questions.financeAnswerShow.length; i++) {
      print("value oif i is:" + i.toString());


      print("dat is:" + i.toString());
      //You and your and your partner identity
      if (Questions.financeAnswerShow[i]['identity'] == "You" ||
          Questions.financeAnswerShow[i]['identity'] == "You & Partner" ||
          Questions.financeAnswerShow[i]['identity'] == "Partner") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: Questions.financeAnswerShow[i]['containerheight'],
              width: 450.0,
              child: Text(Questions.financeAnswerShow[i]['identity'],
                  style: TextStyle(fontSize: 40.0)),
            )
        );
      }
      else if (Questions.financeAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(
                  top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.financeAnswerShow[i]['containerheight'],
              width: 450.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(
                      width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
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
                          child:AutoSizeText(Questions.financeAnswerShow[i]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                      ),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Container(
                            width: 140.0,
                            // color:Colors.blue,
                            child:AutoSizeText(Questions.financeAnswerShow[i]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

                        ),
                        SizedBox(width: 5.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                            color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF))
                      ],)
                    ],
                  )),
            ));
      }

      //data that contains long container
      else {
        detailOption = Questions.financeAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for (co = i; co < Questions.financeAnswerShow.length; co++) {
          if (Questions.financeAnswerShow[co]['details'] == detailOption) {
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
          if (Questions.financeAnswerShow[j]['details'] == detailOption &&
              detail == true) {
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
                          Text(Questions.financeAnswerShow[i]['details'],
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
          if (Questions.financeAnswerShow[j]['details'] == detailOption &&
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
                              child:AutoSizeText(Questions.financeAnswerShow[j]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                          ),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Container(
                                width: 140.0,
                                // color:Colors.blue,
                                child:AutoSizeText(Questions.financeAnswerShow[j]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

                            ),
                            SizedBox(width: 5.0,),
                            Icon(Icons.arrow_forward_ios, size: 12.0,
                              color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),)
                          ],)
                        ],
                      ))
              ),

            );

//For last line

            dynamicContainerbig.add(
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Container(
                      margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
                      height: j == countLongContainer - 1 ? 0.0 : 1.0,
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
                    border: Border.all(width: 1.0,
                        color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
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
              child:Icon(Icons.arrow_back_ios,color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),size: 20.0)
          ),
            title: Text('Finances',style: TextStyle(color: Colors.black,fontSize: 14.0),),
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
                          FinanceChangeContainer(),

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


  Widget FinanceChangeContainer()
  {
    if(Questions.financeAnswerShow.length == 0)
    {
      //Question No 1
      //For 'Riester' pension and No 430.0
      //For Private pension with capital voting rights 280.0
      //For rest 220.0
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any of the insurances listed here?","Pensions/Life insurances",["'Riester' pension","Rürup pension","Private pension with capital voting rights","Private pension without capital voting rights","Endowment insurance","Life insurance","Additional contribution statutory pension","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);

    }

    else{

      //Answer No 1
    if(widget.CheckCompleteQuestion =="Did ${Questions.financeYouIdentity} have costs for any of the insurances listed here?" && widget.CheckQuestion == "Pensions/Life insurances")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "'Riester' pension")
    {
     //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);

    }

    else if(widget.CheckAnswer[m] == "Rürup pension")
    {
    //Question No 3
      return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay into ${Questions.financeYourIdentity} Rürup contract?","Rürup contribution",220.0,"calculation","",[]);
    }

    else if(widget.CheckAnswer[m] == "Private pension with capital voting rights")
    {
      //Question No 6
      //For Before 01.01.2005 220.0
      // For After 31.12.2004 430.0
      return financetwooptionContainer("","Finances","When did ${Questions.financeYourIdentity} pension with capital voting rights begin and when did ${Questions.financeYouIdentity} make the first payment?","Pension start date",["Before 01.01.2005","After 31.12.2004"],220.0,"","",[]);

    }

    else if(widget.CheckAnswer[m] == "Private pension without capital voting rights")
    {
      //Question No 10
      //For Before 01.01.2005 220.0
      // For After 31.12.2004 430.0
      return financetwooptionContainer("","Finances","When did ${Questions.financeYourIdentity} pension without capital voting rights begin and when did ${Questions.financeYouIdentity} make the first payment?","Policy start date",["Before 01.01.2005","After 31.12.2004"],220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Endowment insurance")
    {
      //Question No 14
      //For Before 01.01.2005 220.0
      // For After 31.12.2004 430.0
      return financetwooptionContainer("","Finances","When does ${Questions.financeYourIdentity} endowment insurance policy begin?","Life insurance contract",["Before 01.01.2005","After 31.12.2004"],220.0,"","",[]);
    }

    else if(widget.CheckAnswer[m] == "Life insurance")
    {
     //Question No 18
      return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay into ${Questions.financeYourIdentity} life insurance policy?","Contributions",220.0,"calculation","",[]);

    }

    else if(widget.CheckAnswer[m] == "Additional contribution statutory pension")
    {
      //Question No 19
      return financecalculationContainer("","Finances","How much were ${Questions.financeYourIdentity} additional contributions to the statutory pension scheme (excluding amounts from the payslip)?","Voluntary pension contributions",220.0,"calculation","",[]);
    }

    else if(widget.CheckAnswer[m] == "No")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


    }
    }


 // ====== Insurances listed here Starts ====== //


 // ====== Rürup pension Starts ====== //

 //Answer No 3
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay into ${Questions.financeYourIdentity} Rürup contract?" && widget.CheckQuestion == "Rürup contribution")
    {
      //Question No 4
      //For No 430.0
      //For Yes 220.0
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} received any reimbursements from ${Questions.financeYourIdentity} Rürup pension?","Rürup refunds",220.0,"","",[]);
    }


 //Answer No 4
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} received any reimbursements from ${Questions.financeYourIdentity} Rürup pension?" && widget.CheckQuestion == "Rürup refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 5
        return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} receive?","Refund amount Rürup",430.0,"calculation","",[]);

      }

    }


    //Answer No 5
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} receive?" && widget.CheckQuestion == "Refund amount Rürup")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


// ====== Rürup pension Ends ====== //




// ====== Private pension with capital voting rights Starts ======

    //Answer No 6
    else if(widget.CheckCompleteQuestion =="When did ${Questions.financeYourIdentity} pension with capital voting rights begin and when did ${Questions.financeYouIdentity} make the first payment?" && widget.CheckQuestion == "Pension start date")
    {

      if(widget.CheckAnswer[0] == "Before 01.01.2005")
      {
        //Question No 7
        return financecalculationContainer("","Finances","What contribution did ${Questions.financeYouIdentity} pay for ${Questions.financeYourIdentity} pension with capital voting rights?","Contributions",220.0,"calculation","",[]);
      }

      else if(widget.CheckAnswer[0] == "After 31.12.2004")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

    }


    //Answer No 7
    else if(widget.CheckCompleteQuestion =="What contribution did ${Questions.financeYouIdentity} pay for ${Questions.financeYourIdentity} pension with capital voting rights?" && widget.CheckQuestion == "Contributions")
    {
      //Question No 8
      //For No 430.0
      //For Yes 220.0
      return financeyesnoContainer("","Finances","Did ${Questions.financeYouIdentity} receive any reimbursement?","Reimbursement",220.0,"","",[]);
    }


    //Answer No 8
    else if(widget.CheckCompleteQuestion =="Did ${Questions.financeYouIdentity} receive any reimbursement?" && widget.CheckQuestion == "Reimbursement")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 9
        return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} receive?","Refund amount",430.0,"calculation","",[]);

      }

    }

    //Answer No 9
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} receive?" && widget.CheckQuestion == "Refund amount")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


// ====== Private pension with capital voting rights Ends ======

    // ====== Private pension without capital voting rights Starts ======
    //Answer No 10
    else if(widget.CheckCompleteQuestion =="When did ${Questions.financeYourIdentity} pension without capital voting rights begin and when did ${Questions.financeYouIdentity} make the first payment?" && widget.CheckQuestion == "Policy start date")
    {

      if(widget.CheckAnswer[0] == "Before 01.01.2005")
      {
        //Question No 11
        return financecalculationContainer("","Finances","What contribution did ${Questions.financeYouIdentity} pay for ${Questions.financeYourIdentity} pension without capital voting rights?","Contribution Riester",220.0,"calculation","",[]);
      }

      else if(widget.CheckAnswer[0] == "After 31.12.2004")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

    }


    //Answer No 11
    else if(widget.CheckCompleteQuestion =="What contribution did ${Questions.financeYouIdentity} pay for ${Questions.financeYourIdentity} pension without capital voting rights?" && widget.CheckQuestion == "Contribution Riester")
    {
      //Question No 12
      //For No 430.0
      //For Yes 220.0
      return financeyesnoContainer("","Finances","Did ${Questions.financeYouIdentity} receive any reimbursement?","Refund",220.0,"","",[]);
    }



    //Answer No 12
    else if(widget.CheckCompleteQuestion =="Did ${Questions.financeYouIdentity} receive any reimbursement?" && widget.CheckQuestion == "Refund")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 13
        return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} receive?","Amount of reimbursement",430.0,"calculation","",[]);

      }

    }


    //Answer No 13
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} receive?" && widget.CheckQuestion == "Amount of reimbursement")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


// ====== Private pension without capital voting rights Ends ======



// ====== Endowment insurance Starts ====== //





    //Answer No 14
    else if(widget.CheckCompleteQuestion =="When does ${Questions.financeYourIdentity} endowment insurance policy begin?" && widget.CheckQuestion == "Life insurance contract")
    {

      if(widget.CheckAnswer[0] == "Before 01.01.2005")
      {
        //Question No 15
        return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay into ${Questions.financeYourIdentity} endowment insurance policy?","Contribution",220.0,"calculation","",[]);
      }

      else if(widget.CheckAnswer[0] == "After 31.12.2004")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

    }

    //Answer No 15
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay into ${Questions.financeYourIdentity} endowment insurance policy?" && widget.CheckQuestion == "Contribution")
    {
      //Question No 16
      //For No 430.0
      //For Yes 220.0
      return financeyesnoContainer("","Finances","Did you receive any refunds from ${Questions.financeYourIdentity} endowment insurance?","Endowment insurance refund",220.0,"","",[]);
    }


    //Answer No 16
    else if(widget.CheckCompleteQuestion =="Did you receive any refunds from ${Questions.financeYourIdentity} endowment insurance?" && widget.CheckQuestion == "Endowment insurance refund")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 17
        return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} receive in refunds from your endowment insurance?","Refunds",430.0,"calculation","",[]);

      }

    }

    //Answer No 17
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} receive in refunds from your endowment insurance?" && widget.CheckQuestion == "Refunds")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


      // ====== Endowment insurance Ends ====== //




  // ====== Life insurance Starts ====== //


    //Answer No 18
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay into ${Questions.financeYourIdentity} life insurance policy?" && widget.CheckQuestion == "Contributions")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


  // ====== Life insurance Ends ====== //


 // ====== Additional contribution statutory pension Starts ====== //


    //Answer No 19
    else if(widget.CheckCompleteQuestion =="How much were ${Questions.financeYourIdentity} additional contributions to the statutory pension scheme (excluding amounts from the payslip)?" && widget.CheckQuestion == "Voluntary pension contributions")
    {
      //Question No 20
      //For No 430.0
      //For Yes 220.0
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} received any reimbursement for contributions from ${Questions.financeYourIdentity} statutory pension payments?","Pension refunds",220.0,"","",[]);
    }


    //Answer No 20
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} received any reimbursement for contributions from ${Questions.financeYourIdentity} statutory pension payments?" && widget.CheckQuestion == "Pension refunds")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 2
        return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 21
        return financecalculationContainer("","Finances","How much reimbursement did ${Questions.financeYouIdentity} receive?","Amount received (state pension)",430.0,"calculation","",[]);

      }

    }


    //Answer No 21
    else if(widget.CheckCompleteQuestion =="How much reimbursement did ${Questions.financeYouIdentity} receive?" && widget.CheckQuestion == "Amount received (state pension)")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


      // ====== Additional contribution statutory pension Ends ====== //


      // ====== Insurances listed here Ends ====== //


      // ====== Any Other Insurance Policies Starts ====== //

        //Answer No 2
    if(widget.CheckCompleteQuestion =="Did ${Questions.financeYouIdentity} have costs for any other insurance policies?" && widget.CheckQuestion == "Other contracts")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Additional unemployment insurance")
        {
         //Question No 22
          return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay for additional unemployment insurance?","Contribution",220.0,"calculation","",[]);

        }

        else if(widget.CheckAnswer[m] == "Occupational disability")
        {
          //Question No 24
          return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay for disability insurance?","Contribution",220.0,"calculation","",[]);
        }

        else if(widget.CheckAnswer[m] == "Car liability insurance")
        {
           //Question No 25
          return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} spend on liability car insurance?","Amount",220.0,"calculation","",[]);

        }

        else if(widget.CheckAnswer[m] == "Liability")
        {
          //Question No 26
          return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay for liability insurance?","Amount",220.0,"calculation","",[]);
        }

        else if(widget.CheckAnswer[m] == "Legal protection")
        {
         //Question No 27
          return financemultitwoContainer("","Finances","What risks does ${Questions.financeYourIdentity} legal expenses insurance cover?","Covered risks",["Professional risks","Other risks"],["images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"","",[]);
        }

        else if(widget.CheckAnswer[m] == "Professional liability")
        {
          //Question No 29
          return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} pay for professional liability insurance?","Amount",220.0,"calculation","",[]);
        }

        else if(widget.CheckAnswer[m] == "Accident insurance")
        {
         //Question No 30
          return financecalculationContainer("","Finances","How much have ${Questions.financeYouIdentity} spent on accident insurance?","Amount accident insurance",220.0,"calculation","",[]);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          //Question No 23
          return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
        }


      }
    }


   // ======  Additional unemployment insurance Starts =======


    //Answer No 22
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay for additional unemployment insurance?" && widget.CheckQuestion == "Contribution")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }



  // ======  Additional unemployment insurance Ends =======



   // ======  Occupational disability Starts ======

   //Answer No 24
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay for disability insurance?" && widget.CheckQuestion == "Contribution")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }

  // ======  Occupational disability Ends ======



      // ====== Car liability insurance Starts ======

    //Answer No 25
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} spend on liability car insurance?" && widget.CheckQuestion == "Amount")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }


      // ====== Car liability insurance Ends ======



      // ====== Liability Starts ======



    //Answer No 26
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay for liability insurance?" && widget.CheckQuestion == "Amount")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }


      // ====== Liability Ends ======


    // ====== Legal protection Starts ======


      //Answer No 27

    else if(widget.CheckCompleteQuestion =="What risks does ${Questions.financeYourIdentity} legal expenses insurance cover?" && widget.CheckQuestion == "Covered risks")
    {

      if(widget.CheckAnswer[0] == "Professional risks")
      {
       //Question No 28
        return financecalculationContainer("","Finances","How much did ${Questions.financeYouIdentity} spend on professional liability insurance?","Professional risks",430.0,"calculation","",[]);
      }

      else if(widget.CheckAnswer[0] == "Other risks")
      {
        //Question No 23
        return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);

      }

    }


    //Answer No 28
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} spend on professional liability insurance?" && widget.CheckQuestion == "Professional risks")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }


    // ====== Legal protection Ends ======




   // ====== Professional liability Starts ======

    //Answer No 29
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} pay for professional liability insurance?" && widget.CheckQuestion == "Amount")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }



      // ====== Professional liability Ends ======


      // ====== Accident insurance Starts ======


    //Answer No 30
    else if(widget.CheckCompleteQuestion =="How much have ${Questions.financeYouIdentity} spent on accident insurance?" && widget.CheckQuestion == "Amount accident insurance")
    {
      //Question No 23
      return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} been a member of a church in 2019?","Church membership {tax_year}",220.0,"","",[]);
    }


      // ====== Accident insurance Ends ======

      // ====== Any Other Insurance Policies Ends ====== //



      //Answer No 23
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} been a member of a church in 2019?" && widget.CheckQuestion == "Church membership {tax_year}")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 31
        return financeyesnoContainer("","Finances","Have ${Questions.financeYouIdentity} ever been a member of a church?","Church membership",430.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
       //Question No 33
        return financedifferentoptionContainer("","Finances","What church did ${Questions.financeYouIdentity} belong to in 2019?","Church tax",["evangelisch","römisch-katholisch","altkatholisch","evangelisch-reformiert","französisch-reformiert","freie Religionsgemeinschaft Alzey","freireligiöse Gemeinde Offenbach","Kirchensteuer der Freireligiösen Landesgemeinde Baden","freireligöse Landesgemeinde Pfalz","Kirchensteuer der Israelitischen Religionsgemeinschaft Baden","Jüdische Kultusgemeinden Bad Kreuznach und Koblenz","Kirchensteur der Israelitischen Religionsgemeinschaft Württemberg","Saarland: israelitisch","Jüdische Gemeinde Frankfurt","Jüdische Gemeinde Hamburg","israelitische Kultussteuer der Kultusberechtigten Gemeinden","Landesverband der israelitischen Kultusgemeinden in Bayern","Nordrhein-Westfalen: israelitisch (jüdisch)","Evangelisch-Reformiert (Bückeberg)","Evangelisch-Reformiert (Stadthagen)","Other"],220.0,"","",[]);

      }

    }


    //Answer No 31
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} ever been a member of a church?" && widget.CheckQuestion == "Church membership")
    {

      if(widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes")
      {
        //Question No 32
        return financemultipleoptionsContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} made a donation?","Donations",["National charities","Charitable institutions (EU/EEA)","Religious community","Political party","Voter group","Other tax privileged organizations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

    }

    //Answer No 33
    else if(widget.CheckCompleteQuestion =="What church did ${Questions.financeYouIdentity} belong to in 2019?" && widget.CheckQuestion == "Church tax")
    {
      //Question No 34
      return financeyesnoContainer("","Finances","Did anything regarding ${Questions.financeYourIdentity} church membership change in 2019?","Change of church membership",430.0,"","",[]);
    }


    //Answer No 34
    else if(widget.CheckCompleteQuestion =="Did anything regarding ${Questions.financeYourIdentity} church membership change in 2019?" && widget.CheckQuestion == "Change of church membership")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 32
        return financemultipleoptionsContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} made a donation?","Donations",["National charities","Charitable institutions (EU/EEA)","Religious community","Political party","Voter group","Other tax privileged organizations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
         //Question No 35
        return financedateContainer("","Finances","When did ${Questions.financeYouIdentity} change religion in 2019?","Change of religion",220.0,"","",[]);
      }

    }

    //Answer No 35
    else if(widget.CheckCompleteQuestion =="When did ${Questions.financeYouIdentity} change religion in 2019?" && widget.CheckQuestion == "Change of religion")
    {
      //Question No 32
      return financemultipleoptionsContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} made a donation?","Donations",["National charities","Charitable institutions (EU/EEA)","Religious community","Political party","Voter group","Other tax privileged organizations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
    }


  }


  }


  Widget financemultipleoptionsContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceMultipleOptionsContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:430.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }


  Widget financecalculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceCalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget financeyesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceYesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget financetwooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData,  List Suggestion )
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceTwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:280.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget financemultitwoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceMultiTwoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:320.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget financedifferentoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceDifferentOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:420.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
  }

  Widget financedateContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion)
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceDateContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);

  }
}