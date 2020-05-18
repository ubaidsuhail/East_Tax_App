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
            // Question No 24
            return workcalculationContainer("","Work","How many more home offices would ${Questions.workYouIdentity} like enter?","Number of home offices",220.0,"","",[]);
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {

          }

        }

        //Answer No 24
        else if(widget.CheckCompleteQuestion =="How many more home offices would ${Questions.workYouIdentity} like enter?" && widget.CheckQuestion == "Number of home offices")
        {
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
          return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
        }

        //Answer No 36
        else if(widget.CheckCompleteQuestion =="What furniture/equipment did ${Questions.financeYouIdentity} buy?" && widget.CheckQuestion == "Piece of furniture")
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
            return workcalculationContainer("","Work","How much did ${Questions.financeYouIdentity} spend on the carpet?","Amount carpet",220.0,"calculation",Questions.workFurnitureText,[]);
          }

          else if(widget.CheckAnswer[0] == "Other")
          {
           //Question No 62
            return workcalculationContainer("","Work","What kind of furniture/equipment did ${Questions.financeYouIdentity} buy?","Type",220.0,"",Questions.workFurnitureText,[]);
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
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
        else if(widget.CheckCompleteQuestion =="How much did ${Questions.financeYouIdentity} spend on the carpet?" && widget.CheckQuestion == "Amount carpet")
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
              return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
        else if(widget.CheckCompleteQuestion =="What kind of furniture/equipment did ${Questions.financeYouIdentity} buy?" && widget.CheckQuestion == "Type")
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
            return workdifferentoptionContainer("","Work","What furniture/equipment did ${Questions.financeYouIdentity} buy?","Piece of furniture",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Carpet","Other"],220.0,"",Questions.workFurnitureText,[]);
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
            if(Questions.homeOfficeLength <= Questions.totalHomeOffice)
            {
              //Question no 25
              return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?","${Questions.homeOfficeLength}. type of usage",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"",Questions.homeOfficeText,[]);
            }
            else
            {
              //furniture wala
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
          if(Questions.homeOfficeLength <= Questions.totalHomeOffice)
          {
            //Question no 25
            return workthreeoptionContainer("","Work","Which activities did ${Questions.workYouIdentity} use ${Questions.workYourIdentity} home office no. ${Questions.homeOfficeLength} for?","${Questions.homeOfficeLength}. type of usage",["For all occupational activities (e.g. author)","For certain tasks (e.g.teacher)","Sometimes for work (e.g. home office possibility)"],220.0,"",Questions.homeOfficeText,[]);
          }
          else
          {
            //furniture wala
          }
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

}


