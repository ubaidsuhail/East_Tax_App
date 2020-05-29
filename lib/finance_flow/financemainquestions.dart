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
import 'package:easy_taxx/finance_flow/financethreeoptioncontainer.dart';




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
            SingleSmallContainer(currentIndex : i)
//            Container(
//              margin: EdgeInsets.only(
//                  top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
//              height: Questions.financeAnswerShow[i]['containerheight'],
//              width: 450.0,
//              decoration: BoxDecoration(
//                  borderRadius: BorderRadius.circular(7.0),
//                  border: Border.all(
//                      width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
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
//                          child:AutoSizeText(Questions.financeAnswerShow[i]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                      ),
//                      Row(children: <Widget>[
//                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                        Container(
//                            width: 140.0,
//                            // color:Colors.blue,
//                            child:AutoSizeText(Questions.financeAnswerShow[i]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)
//
//                        ),
//                        SizedBox(width: 5.0,),
//                        Icon(Icons.arrow_forward_ios, size: 12.0,
//                            color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF))
//                      ],)
//                    ],
//                  )),
//            )
        );
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
                MultipleBigContainer(currentIndex : j)
//              Container(
//                  color: Colors.white,
//                  height: 55.0,
//                  width: 450.0,
//                  child: Padding(
//                      padding: EdgeInsets.only(left: 10.0, right: 10.0),
//                      child: Row(
//                        crossAxisAlignment: CrossAxisAlignment.center,
//                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                        children: <Widget>[
//                          //Text(Questions.answerShow[i]['question']),
//                          Container(
//                              width: 155.0,
//                              //color: Colors.purple,
//                              child:AutoSizeText(Questions.financeAnswerShow[j]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                          ),
//                          Row(children: <Widget>[
//                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                            Container(
//                                width: 140.0,
//                                // color:Colors.blue,
//                                child:AutoSizeText(Questions.financeAnswerShow[j]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)
//
//                            ),
//                            SizedBox(width: 5.0,),
//                            Icon(Icons.arrow_forward_ios, size: 12.0,
//                              color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),)
//                          ],)
//                        ],
//                      ))
//              ),

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
                Navigator.pushReplacementNamed(context, 'allCategoryScreen');
                //Navigator.pop(context);
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

//      if(Questions.occupationMiniJobFinance == "Minijob")
//      {
//        //Question No 76
//        return financedifferentoptionContainer("","Finances","Does ${Questions.financeYourIdentity} job meet one of the following criteria?","Specialist activity",["Official","Managing director","Judge","Intern","Soldier","No"],220.0,"","",[]);
//      }
//      else
//        {
      //Question No 1
      //For 'Riester' pension and No 430.0
      //For Private pension with capital voting rights 280.0
      //For rest 220.0
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any of the insurances listed here?","Pensions/Life insurances",["'Riester' pension","Rürup pension","Private pension with capital voting rights","Private pension without capital voting rights","Endowment insurance","Life insurance","Additional contribution statutory pension","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
      //}
    }

    else{

      //Answer No 1
    if(widget.CheckCompleteQuestion =="Did ${Questions.financeYouIdentity} have costs for any of the insurances listed here?" && widget.CheckQuestion == "Pensions/Life insurances")
    {

    for(int m=0;m<widget.CheckAnswer.length;m++) {

    if(widget.CheckAnswer[m] == "'Riester' pension")
    {
     //Agar living situation ki category ka occupation ma Studying select hoa to phir Question No 72 ai ga wrna wasa hi chalta rhega
      if(Questions.occupationStudyingFinance == "Studying")
      {
        //Question No 72
        return financecalculationContainer("","Finances","What was the sum of all contributions ${Questions.financeYouIdentity} have paid for all Riester contracts?","Total contribution",220.0,"calculation","",[]);
      }

      else
        {
          //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);

      }
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
    else if(widget.CheckCompleteQuestion =="Did ${Questions.financeYouIdentity} have costs for any other insurance policies?" && widget.CheckQuestion == "Other contracts")
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


    // ====== Donations and membership fees Starts ======= //


    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} made a donation?" && widget.CheckQuestion == "Donations")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "National charities")
        {
         //Question No 36
          //For No 340.0
          //For Yes 220.0
          return financeyesnoContainer("","Donations and membership fees","Did ${Questions.financeYourIdentity} donations go to multiple charitable institutions in Germany?","Multiple organizations",220.0,"","",[]);

        }

        else if(widget.CheckAnswer[m] == "Charitable institutions (EU/EEA)")
        {
         //Question No 42
          return financeyesnoContainer("","Donations and membership fees","Did ${Questions.financeYourIdentity} donations go to multiple charitable institutions in the EU?","Multiple organizations",220.0,"","",[]);
        }

        else if(widget.CheckAnswer[m] == "Religious community")
        {
         //Question No 47
          return financeyesnoContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} donated to several religious organizations?","Several religious organizations",220.0,"","",[]);

        }

        else if(widget.CheckAnswer[m] == "Political party")
        {
          //Question No 53
          return financeyesnoContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} donated to several political parties?","Multiple parties",220.0,"","",[]);
        }

        else if(widget.CheckAnswer[m] == "Voter group")
        {
          //Question No 60
          return financeyesnoContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} donated to more than one voters association?","Multiple organizations",220.0,"","",[]);
        }

        else if(widget.CheckAnswer[m] == "Other tax privileged organizations")
        {
          //Question No 66
          return financeyesnoContainer("","Donations and membership fees","Have ${Questions.financeYouIdentity} donated to multiple projects?","Multiple Projects",220.0,"","",[]);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          return FinishCategory("Finances Category","End Categories");
        }


      }
    }



    // ====== National charities Starts ======

      //Answer No 36
    else if(widget.CheckCompleteQuestion =="Did ${Questions.financeYourIdentity} donations go to multiple charitable institutions in Germany?" && widget.CheckQuestion == "Multiple organizations")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 39
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?","Confirmation",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
       //Question No 37
        return financecalculationContainer("","Donations and membership fees","How many tax exempt organizations in Germany did ${Questions.financeYouIdentity} donate to?","Number of organizations",340.0,"loop","",[]);
      }

    }

    //Answer No 37
    else if(widget.CheckCompleteQuestion =="How many tax exempt organizations in Germany did ${Questions.financeYouIdentity} donate to?" && widget.CheckQuestion == "Number of organizations")
    {
      //Question No 38
      return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?","Donation confirmation no. ${Questions.financeOrganizationLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeOrganizationText,[]);
    }


    //Answer No 38 and Answer No 39
    else if(widget.CheckCompleteQuestion =="What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?" && (widget.CheckQuestion == "Donation confirmation no. ${Questions.financeOrganizationLength}" || widget.CheckQuestion == "Confirmation"))
    {
      if(widget.CheckAnswer[0] == "Donation receipt" || widget.CheckAnswer[0] == "Account statement (in the case of donations up to 200EUR)" )
      {
       //Question No 40
        return financecalculationContainer("","Donations and membership fees","What is the name of this non-profit organization?","Non-profit organization",220.0,"",Questions.financeOrganizationText,[]);

      }

      else if(widget.CheckAnswer[0] == "Information was transmitted electronically")
      {
        //Question No 41
        //mgar isma agar 40 ka baad 41 aya to wo 41 iswala 41 sa alag khulega
        return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate to this non-profit organization?","Donation amount",220.0,"calculation",Questions.financeOrganizationText,[]);
      }
    }


    //Answer No 40
    else if(widget.CheckCompleteQuestion =="What is the name of this non-profit organization?" && widget.CheckQuestion == "Non-profit organization")
    {
      //Question No 41
      return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate to this non-profit organization?","Donation amount",220.0,"calculation",Questions.financeOrganizationText,[]);
    }


    //Answer No 41
    else if(widget.CheckCompleteQuestion =="How much money did ${Questions.financeYouIdentity} donate to this non-profit organization?" && widget.CheckQuestion == "Donation amount")
    {

      if(Questions.financeOrganizationLength <= Questions.totalFinanceOrganization && Questions.totalFinanceOrganization > 0)
        {
          //Question No 38
          return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?","Donation confirmation no. ${Questions.financeOrganizationLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeOrganizationText,[]);
        }
        else
          {
            return FinishCategory("Finances Category","End Categories");
          }

    }


   // ====== National charities Ends ======



   // ====== Charitable institutions (EU/EEA) Starts ======


    //Answer No 42
    else if(widget.CheckCompleteQuestion =="Did ${Questions.financeYourIdentity} donations go to multiple charitable institutions in the EU?" && widget.CheckQuestion == "Multiple organizations")
    {

      if(widget.CheckAnswer[0] == "No")
      {
//Question No 45
        return financecalculationContainer("","Donations and membership fees","What is the name of the European organization?","EU organization name",220.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 43
        return financecalculationContainer("","Donations and membership fees","How many organizations did ${Questions.financeYouIdentity} donate to?","Number of organizations",220.0,"loop","",[]);

      }

    }

    //Answer No 43
    else if(widget.CheckCompleteQuestion =="How many organizations did ${Questions.financeYouIdentity} donate to?" && widget.CheckQuestion == "Number of organizations")
    {
      //Question No 44
      return financecalculationContainer("","Donations and membership fees","What is the name of the European organization?","${Questions.financeEuOrganizationLength}. European organizations",220.0,"",Questions.financeEuOrganizationText,[]);
    }


    //Answer No 44 and Answer No 45
    else if(widget.CheckCompleteQuestion =="What is the name of the European organization?" && (widget.CheckQuestion == "${Questions.financeEuOrganizationLength}. European organizations" || widget.CheckQuestion == "EU organization name"))
    {
     //Question No 46
      return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate to this organization?","Donated amount",220.0,"calculation",Questions.financeEuOrganizationText,[]);
    }

    //Answer No 46
    else if(widget.CheckCompleteQuestion =="How much money did ${Questions.financeYouIdentity} donate to this organization?" && widget.CheckQuestion == "Donated amount")
    {

      if(Questions.financeEuOrganizationLength <= Questions.totalFinanceEuOrganization && Questions.totalFinanceEuOrganization > 0)
      {
        //Question No 44
        return financecalculationContainer("","Donations and membership fees","What is the name of the European organization?","${Questions.financeEuOrganizationLength}. European organizations",220.0,"",Questions.financeEuOrganizationText,[]);
      }
      else
      {
        return FinishCategory("Finances Category","End Categories");
      }

    }



      // ====== Charitable institutions (EU/EEA) Ends ======


      // ====== Religious community Starts ====== //

      //Answer No 47
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} donated to several religious organizations?" && widget.CheckQuestion == "Several religious organizations")
    {

      if(widget.CheckAnswer[0] == "No")
      {
//Question No 50
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation? ","Confirmation of donation",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 48
        return financecalculationContainer("","Donations and membership fees","How many religious organizations did ${Questions.financeYouIdentity} donate to?","Number of organizations",340.0,"loop","",[]);
      }

    }

    //Answer No 48
    else if(widget.CheckCompleteQuestion =="How many religious organizations did ${Questions.financeYouIdentity} donate to?" && widget.CheckQuestion == "Number of organizations")
    {
      //Question No 49
      return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation? ","Donation confirmation no. ${Questions.financeReligiousLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeReligiousText,[]);
      }


   //Answer No 49 and Answer No 50

    else if(widget.CheckCompleteQuestion =="What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation? " && (widget.CheckQuestion == "Donation confirmation no. ${Questions.financeReligiousLength}" || widget.CheckQuestion == "Confirmation of donation"))
    {
      if(widget.CheckAnswer[0] == "Donation receipt" || widget.CheckAnswer[0] == "Account statement (in the case of donations up to 200EUR)" )
      {
        //Question No 51
        return financecalculationContainer("","Donations and membership fees","What is the name of the religious community?","Religious community",220.0,"",Questions.financeReligiousText,[]);

      }

      else if(widget.CheckAnswer[0] == "Information was transmitted electronically")
      {
        //Question No 52
        //mgar isma agar 51 ka baad 52 aya to wo 51 iswala 52 sa alag khulega
        return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate?","Donated amount",220.0,"calculation",Questions.financeReligiousText,[]);

      }
    }

    //Answer No 51
    else if(widget.CheckCompleteQuestion =="What is the name of the religious community?" && widget.CheckQuestion == "Religious community")
    {
      //Question No 52
      return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate?","Donated amount",220.0,"calculation",Questions.financeReligiousText,[]);
    }


    //Answer No 52
    else if(widget.CheckCompleteQuestion =="How much money did ${Questions.financeYouIdentity} donate?" && widget.CheckQuestion == "Donated amount")
    {

      if(Questions.financeReligiousLength <= Questions.totalFinanceReligious && Questions.totalFinanceReligious > 0)
      {
        //Question No 49
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation? ","Donation confirmation no. ${Questions.financeReligiousLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeReligiousText,[]);
      }
      else
      {
        return FinishCategory("Finances Category","End Categories");
      }

    }




      // ====== Religious community Ends ====== //




      // ====== Political party Starts ====== //
    //Answer No 53

    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} donated to several political parties?" && widget.CheckQuestion == "Multiple parties")
    {

      if(widget.CheckAnswer[0] == "No")
      {
//Question No 56
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?  ","Confirmation of donation",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 54
        return financecalculationContainer("","Donations and membership fees","How many parties did ${Questions.financeYouIdentity} donate to?","Number of party donations",340.0,"loop","",[]);
      }

    }

    //Answer No 54

    else if(widget.CheckCompleteQuestion =="How many parties did ${Questions.financeYouIdentity} donate to?" && widget.CheckQuestion == "Number of party donations")
    {
      //Question No 55
      return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?  ","Donation confirmation no. ${Questions.financePartyLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financePartyText,[]);
    }


    //Answer No 55 And Answer No 56
    else if(widget.CheckCompleteQuestion =="What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?  " && (widget.CheckQuestion == "Donation confirmation no. ${Questions.financePartyLength}" || widget.CheckQuestion == "Confirmation of donation"))
    {
      if(widget.CheckAnswer[0] == "Donation receipt" || widget.CheckAnswer[0] == "Account statement (in the case of donations up to 200EUR)" )
      {

        //Question No 57
        return financedifferentoptionContainer("","Donations and membership fees","What is the name of this party?","Name of the party",["CDU","SPD","DIE LINKE","GRÜNE","CSU","FDP","FREIE WAHLER","PIRATEN","OTHER"],220.0,"",Questions.financePartyText,[]);

      }

      else if(widget.CheckAnswer[0] == "Information was transmitted electronically")
      {

//Question No 59
        return financecalculationContainer("","Donations and membership fees","How much did ${Questions.financeYouIdentity} donate to this party?","Donated amount",220.0,"calculation",Questions.financePartyText,[]);

      }
    }


   //Answer No 57

    else if(widget.CheckCompleteQuestion =="What is the name of this party?" && widget.CheckQuestion == "Name of the party")
    {

      if(widget.CheckAnswer[0] == "OTHER")
      {
//Question No 58
        return financecalculationContainer("","Donations and membership fees","What is the name of the other party?","Name of the party",220.0,"",Questions.financePartyText,[]);

      }

      else
      {
        //Question No 59
        return financecalculationContainer("","Donations and membership fees","How much did ${Questions.financeYouIdentity} donate to this party?","Donated amount",220.0,"calculation",Questions.financePartyText,[]);
      }

    }

    //Answer No 58
    else if(widget.CheckCompleteQuestion =="What is the name of the other party?" && widget.CheckQuestion == "Name of the party")
    {
      //Question No 59
      return financecalculationContainer("","Donations and membership fees","How much did ${Questions.financeYouIdentity} donate to this party?","Donated amount",220.0,"calculation",Questions.financePartyText,[]);
    }

//Answer No 59
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} donate to this party?" && widget.CheckQuestion == "Donated amount")
    {

      if(Questions.financePartyLength <= Questions.totalFinanceParty && Questions.totalFinanceParty > 0)
      {
        //Question No 55
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?  ","Donation confirmation no. ${Questions.financePartyLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financePartyText,[]);
      }
      else
      {
        return FinishCategory("Finances Category","End Categories");
      }

    }

      // ====== Political party Ends ====== //

      // ====== Voter Group Starts ====== //

    //Answer No 60
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} donated to more than one voters association?" && widget.CheckQuestion == "Multiple organizations")
    {

      if(widget.CheckAnswer[0] == "No")
      {
       //Question No 63
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?   ","Confirmation of Donation",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 61
        return financecalculationContainer("","Donations and membership fees","How many voters' associations did ${Questions.financeYouIdentity} donate to?","Number of voter groups",340.0,"loop","",[]);
      }

    }

    //Answer No 61
    else if(widget.CheckCompleteQuestion =="How many voters' associations did ${Questions.financeYouIdentity} donate to?" && widget.CheckQuestion == "Number of voter groups")
    {
      //Question No 62
      return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?   ","Donation confirmation no. ${Questions.financeVoterLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeVoterText,[]);
    }


    //Answer No 62 and Answer No 63

    else if(widget.CheckCompleteQuestion =="What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?   " && (widget.CheckQuestion == "Donation confirmation no. ${Questions.financeVoterLength}" || widget.CheckQuestion == "Confirmation of donation"))
    {
      if(widget.CheckAnswer[0] == "Donation receipt" || widget.CheckAnswer[0] == "Account statement (in the case of donations up to 200EUR)" )
      {
        //Question No 64
        return financecalculationContainer("","Donations and membership fees","What is the name of the voters' association?","Name of voter group",220.0,"",Questions.financeVoterText,[]);

      }

      else if(widget.CheckAnswer[0] == "Information was transmitted electronically")
      {
        //Question No 65
        return financecalculationContainer("","Donations and membership fees","How much did ${Questions.financeYouIdentity} donate to the voters' association?","Donated amount",220.0,"calculation",Questions.financeVoterText,[]);

      }
    }


    //Answer No 64
    else if(widget.CheckCompleteQuestion =="What is the name of the voters' association?" && widget.CheckQuestion == "Name of voter group" )
    {
      //Question No 65
      return financecalculationContainer("","Donations and membership fees","How much did ${Questions.financeYouIdentity} donate to the voters' association?","Donated amount",220.0,"calculation",Questions.financeVoterText,[]);
    }


    //Answer No 65
    else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} donate to the voters' association?" && widget.CheckQuestion == "Donated amount")
    {

      if(Questions.financeVoterLength <= Questions.totalFinanceVoter && Questions.totalFinanceVoter > 0)
      {
        //Question No 62
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?   ","Donation confirmation no. ${Questions.financeVoterLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeVoterText,[]);
      }
      else
      {
        return FinishCategory("Finances Category","End Categories");
      }

    }


      // ====== Voter Group Ends ====== //



      // ====== Other tax privileged organizations Starts ====== //
      //Answer No 66
    else if(widget.CheckCompleteQuestion =="Have ${Questions.financeYouIdentity} donated to multiple projects?" && widget.CheckQuestion == "Multiple Projects")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 69
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?    ","Confirmation of donation",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"","",[]);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 67
        return financecalculationContainer("","Donations and membership fees","How many other projects did ${Questions.financeYouIdentity} donate to?","Number of projects",340.0,"loop","",[]);
      }

    }

    //Answer No 67
    else if(widget.CheckCompleteQuestion =="How many other projects did ${Questions.financeYouIdentity} donate to?" && widget.CheckQuestion == "Number of projects")
    {
      //Question No 68
      return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?    ","Donation confirmation no. ${Questions.financeProjectLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeProjectText,[]);
    }



    //Answer No 68 and Answer No 69
    else if(widget.CheckCompleteQuestion =="What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?    " && (widget.CheckQuestion == "Donation confirmation no. ${Questions.financeProjectLength}" || widget.CheckQuestion == "Confirmation of donation"))
    {
      if(widget.CheckAnswer[0] == "Donation receipt" || widget.CheckAnswer[0] == "Account statement (in the case of donations up to 200EUR)" )
      {
        //Question No 70
        return financecalculationContainer("","Donations and membership fees","What is the name of this non-profit organization? ","Name of organization",220.0,"",Questions.financeProjectText,[]);

      }

      else if(widget.CheckAnswer[0] == "Information was transmitted electronically")
      {
        //Question No 71
        return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate to this organization? ","Donated amount",220.0,"calculation",Questions.financeProjectText,[]);

      }
    }


    //Answer No 70
    else if(widget.CheckCompleteQuestion =="What is the name of this non-profit organization? " && widget.CheckQuestion == "Name of organization" )
    {
      //Question No 71
      return financecalculationContainer("","Donations and membership fees","How much money did ${Questions.financeYouIdentity} donate to this organization? ","Donated amount",220.0,"calculation",Questions.financeProjectText,[]);
    }


    //Answer No 71
    else if(widget.CheckCompleteQuestion =="How much money did ${Questions.financeYouIdentity} donate to this organization? " && widget.CheckQuestion == "Donated amount")
    {

      if(Questions.financeProjectLength <= Questions.totalFinanceProject && Questions.totalFinanceProject > 0)
      {
        //Question No 68
        return financethreeoptionContainer("","Donations and membership fees","What evidence do ${Questions.financeYouIdentity} have for ${Questions.financeYourIdentity} donation?    ","Donation confirmation no. ${Questions.financeProjectLength}",["Donation receipt","Account statement (in the case of donations up to 200EUR)","Information was transmitted electronically"],220.0,"",Questions.financeProjectText,[]);
      }
      else
      {
        return FinishCategory("Finances Category","End Categories");
      }

    }


      // ====== Other tax privileged organizations Ends ====== //






      // ====== Donations and membership fees Ends ======= //


      //Studying 'Riester' Pension (Relation) Starts

     //Answer No 72
    else if(widget.CheckCompleteQuestion =="What was the sum of all contributions ${Questions.financeYouIdentity} have paid for all Riester contracts?" && widget.CheckQuestion == "Total contribution")
    {

     //Question No 73
      return financecalculationContainer("","Finances","What was ${Questions.financeYourIdentity} total annual salary in ${2019 - 1}?","Salary in ${2019 - 1}",220.0,"calculation","",[]);


        }

    //Answer No 73
    else if(widget.CheckCompleteQuestion =="What was ${Questions.financeYourIdentity} total annual salary in ${2019 - 1}?" && widget.CheckQuestion == "Salary in ${2019 - 1}")
    {
      //Question No 74
      return financecalculationContainer("","Finances","If ${Questions.financeYouIdentity} received income replacement benefits in ${2019 - 1}, what was the total amount of these?","Compensation pay in ${2019 - 1}",280.0,"calculation","",[]);
    }


    //Answer no 74
    else if(widget.CheckCompleteQuestion =="If ${Questions.financeYouIdentity} received income replacement benefits in ${2019 - 1}, what was the total amount of these?" && widget.CheckQuestion == "Compensation pay in ${2019 - 1}")
    {
      //Question No 75
      return financetwooptionContainer("","Finances","For whom was the monthly child support assessed?","Child support receiver",["Me","The other parent"],430.0,"","",[]);

    }

    //Answer No 75
    else if(widget.CheckCompleteQuestion =="For whom was the monthly child support assessed?" && widget.CheckQuestion == "Child support receiver")
    {
      //Question No 2
      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any other insurance policies?","Other contracts",["Additional unemployment insurance","Occupational disability","Car liability insurance","Liability","Legal protection","Professional liability","Accident insurance","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);

    }

      //Studying 'Riester' Pension (Relation) Ends


      //Occupation Minijob Specialist Activity (Relation) Starts

//      //Answer No 76
//    else if(widget.CheckCompleteQuestion =="Does ${Questions.financeYourIdentity} job meet one of the following criteria?" && widget.CheckQuestion == "Specialist activity")
//    {
//      //Question No 77
//      return financeyesnoContainer("","Finances","Are ${Questions.financeYouIdentity} exempted from statutory pension insurance?","Pension insurance exemption",220.0,"","",[]);
//
//    }
//
//    //Answer No 77
//    else if(widget.CheckCompleteQuestion =="Are ${Questions.financeYouIdentity} exempted from statutory pension insurance?" && widget.CheckQuestion == "Pension insurance exemption")
//    {
//
////      if(widget.CheckAnswer[0] == "No")
////      {
////
////
////      }
////
////      else if(widget.CheckAnswer[0] == "Yes")
////      {
////        //Question No 79
////
////      }
//
//      //Question No 78
////        return financecalculationContainer("","Finances","How much salary as an official have ${Questions.financeYouIdentity} received in ${2019 - 1}?","",220.0,"calculation","",[]);
//      //Question No 1
//      return financemultipleoptionsContainer("","Finances","Did ${Questions.financeYouIdentity} have costs for any of the insurances listed here?","Pensions/Life insurances",["'Riester' pension","Rürup pension","Private pension with capital voting rights","Private pension without capital voting rights","Endowment insurance","Life insurance","Additional contribution statutory pension","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"No","",[]);
//
//    }
//
//
//
//
//    //Answer No 78
//    else if(widget.CheckCompleteQuestion =="How much salary as an official have ${Questions.financeYouIdentity} received in ${2019 - 1}?" && widget.CheckQuestion == "Salary in ${2019 - 1}")
//    {
//      //Question No 75
//      return financetwooptionContainer("","Finances","For whom was the monthly child support assessed?","Child support receiver",["Me","The other parent"],430.0,"","",[]);
//    }


      //Occupation Minijob Specialist Activity (Relation) Ends

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

  Widget financethreeoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData, List Suggestion )
  {
    Questions.financeAnimatedContainer = animatedcontainer;
    return FinanceThreeOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:340.0,additionalData:AdditionalData,multipleData:MultipleData,suggestion:Suggestion);
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
            Questions.financeAnswerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FinanceMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
            }));
          }

          else {
            answerSubList = Questions.financeAnswerShow.sublist(0, currentIndex);
            print("Answer sub list:$answerSubList");
            Questions.financeAnswerShow = [];
            Questions.financeAnswerShow.addAll(answerSubList);

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FinanceMainQuestions(CheckCompleteQuestion : Questions.financeAnswerShow[currentIndex-1]['completequestion'],CheckQuestion : Questions.financeAnswerShow[currentIndex-1]['question'],CheckAnswer : [Questions.financeAnswerShow[currentIndex-1]['answer'][0]]);
            }));
          }





        },
        child:Container(
          margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
          height: Questions.financeAnswerShow[currentIndex]['containerheight'],
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
                      child:AutoSizeText(Questions.financeAnswerShow[currentIndex]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ),
                  Row(children: <Widget>[
                    //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                    Container(
                        width: 140.0,
                        // color:Colors.blue,
                        child:AutoSizeText(Questions.financeAnswerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

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
            Questions.financeAnswerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FinanceMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
            }));
          }

          else {
            answerSubList = Questions.financeAnswerShow.sublist(0, currentIndex);
            print("Answer sub list:$answerSubList");
            Questions.financeAnswerShow = [];
            Questions.financeAnswerShow.addAll(answerSubList);

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return FinanceMainQuestions(CheckCompleteQuestion : Questions.financeAnswerShow[currentIndex-1]['completequestion'],CheckQuestion : Questions.financeAnswerShow[currentIndex-1]['question'],CheckAnswer : [Questions.financeAnswerShow[currentIndex-1]['answer'][0]]);
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
                        child:AutoSizeText(Questions.financeAnswerShow[currentIndex]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ),
                    Row(children: <Widget>[
                      //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                      Container(
                          width: 140.0,
                          // color:Colors.blue,
                          child:AutoSizeText(Questions.financeAnswerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

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
