import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/work_flow/workcalculationcontainer.dart';
import 'package:easy_taxx/work_flow/workyesnocontainer.dart';
import 'package:easy_taxx/work_flow/workmultipleoptionscontainer.dart';
import 'package:easy_taxx/work_flow/workthreeoptioncontainer.dart';



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
            Container(
              margin: EdgeInsets.only(
                  top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.workAnswerShow[i]['containerheight'],
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
                      Text(Questions.workAnswerShow[i]['question'],
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Text(Questions.workAnswerShow[i]['answer'][0]),
                        SizedBox(width: 10.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                          color: Colors.lightBlue,)
                      ],)
                    ],)),
            ));
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
              Container(
                  color: Colors.white,
                  height: 55.0,
                  width: 450.0,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Text(Questions.answerShow[i]['question']),
                          Text(Questions.workAnswerShow[j]['question'],
                            style: TextStyle(color: Colors.grey),),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Text(Questions.workAnswerShow[j]['answer'][0]),
                            SizedBox(width: 10.0,),
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
      //Question No 1
      return workcalculationContainer("","Work","What was ${Questions.workYourIdentity} job title?","Profession",220.0,"","",[]);

    }

    else
      {
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

          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 14
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have more than one home office?","Separate room",340.0,"","",[]);
          }

        }


        //Answer No 14
        else if(widget.CheckCompleteQuestion =="Did ${Questions.workYouIdentity} have more than one home office?" && widget.CheckQuestion == "Separate room")
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

          }

          else
          {
           //Question No 16
            return workyesnoContainer("","Work","Did ${Questions.workYouIdentity} have the opportunity to carry out these tasks at ${Questions.workYourIdentity} employer's office?","Possible at employer?",340.0,"","",[]);
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
}


