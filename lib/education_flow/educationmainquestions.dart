import 'package:easy_taxx/livingsituation_flow/container1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:easy_taxx/education_flow/educationyesnocontainer.dart';
import 'package:easy_taxx/education_flow/educationcalculationcontainer.dart';
import 'package:easy_taxx/education_flow/educationdifferentoptioncontainer.dart';
import 'package:easy_taxx/education_flow/educationmultipleoptionscontainer.dart';
import 'package:easy_taxx/education_flow/educationtwooptioncontainer.dart';
import 'package:easy_taxx/education_flow/educationmultithreecontainer.dart';
import 'package:easy_taxx/education_flow/educationdatecontainer.dart';
import 'package:easy_taxx/education_flow/educationmultitwocontainer.dart';
import 'package:auto_size_text/auto_size_text.dart';

class EducationMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  EducationMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _EducationMainQuestionsState createState() => _EducationMainQuestionsState();
}

class _EducationMainQuestionsState extends State<EducationMainQuestions> {
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
    print("question length:"+Questions.educationAnswerShow.length.toString());

    for(k=l;k<Questions.educationAnswerShow.length;k++)
    {
      print("how manysdsdsd");
      screenHeightbig  = 0.0;
      if(Questions.educationAnswerShow[k]['identity'] == "You" || Questions.educationAnswerShow[k]['identity'] == "You & Partner" || Questions.educationAnswerShow[k]['identity'] == "Partner")
      {
        screenHeight = screenHeight +70.0;
      }
      else if(Questions.educationAnswerShow[k]['details'] == "")
      {
        screenHeight = screenHeight +60.0;
        detail= true;
      }
      else{
        detailsHeight = Questions.educationAnswerShow[k]['details'];

        for(l=k;l<Questions.educationAnswerShow.length;l++)
        {
          if(Questions.educationAnswerShow[l]['details'] == detailsHeight)
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
    screenHeight = screenHeight + Questions.educationAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:"+screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;





  }


  void DynamicContainer(){
    hlength=0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i=j;i<Questions.educationAnswerShow.length;i++) {
      print("value oif i is:"+i.toString());


      print("dat is:"+i.toString());
      //You and your and your partner identity
      if(Questions.educationAnswerShow[i]['identity'] == "You" || Questions.educationAnswerShow[i]['identity'] == "You & Partner" || Questions.educationAnswerShow[i]['identity'] == "Partner")
      {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              height: Questions.educationAnswerShow[i]['containerheight'],
              width: 450.0,
              child:Text(Questions.educationAnswerShow[i]['identity'],style: TextStyle(fontSize: 40.0)) ,
            )
        );
      }
      else if(Questions.educationAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.educationAnswerShow[i]['containerheight'],
              width: 450.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(width: 1.0, color: Color.fromARGB(0xFF, 0xE8, 0xE8, 0xE8))
              ),
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
                          child:AutoSizeText(Questions.educationAnswerShow[i]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                      ),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Container(
                            width: 140.0,
                            // color:Colors.blue,
                            child:AutoSizeText(Questions.educationAnswerShow[i]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

                        ),
                        SizedBox(width: 5.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                          color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),)
                      ],)
                    ],
                  )
              ),
            ));
      }

      //data that contains long container
      else
      {
        detailOption = Questions.educationAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for(co = i ; co < Questions.educationAnswerShow.length; co++)
        {
          if(Questions.educationAnswerShow[co]['details'] == detailOption) {
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
          if(Questions.educationAnswerShow[j]['details'] == detailOption && detail == true) {
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
                          Text(Questions.educationAnswerShow[i]['details'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
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
          if(Questions.educationAnswerShow[j]['details'] == detailOption && detail == false)
          {
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
                          child:AutoSizeText(Questions.educationAnswerShow[j]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                          ),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Container(
                              width: 140.0,
                           // color:Colors.blue,
                            child:AutoSizeText(Questions.educationAnswerShow[j]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

                            ),
                            SizedBox(width: 5.0,),
                            Icon(Icons.arrow_forward_ios, size: 12.0,
                              color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),)
                          ],)
                        ],
                      ))),

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
                Navigator.pop(context);
              },
              child:Icon(Icons.arrow_back_ios,color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),size: 20.0)
          ),
            title: Text('Education',style: TextStyle(color: Colors.black,fontSize: 14.0),),
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

              height: MediaQuery.of(context).size.height*0.87 >= screenHeight ? MediaQuery.of(context).size.height*0.87 : screenHeight ,
              width: MediaQuery.of(context).size.width,
              child:
              Stack(

                children: <Widget>[

                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child:
                      Column(

                        children: <Widget>[

//
                          Column(children: dynamicContainer,),
                          EducationChangeContainer(),

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

  Widget EducationChangeContainer() {

    if(Questions.educationAnswerShow.length == 0)
    {
      //Question No 1
      return educationyesnoContainer("","Education","Did you complete any degrees or professional qualifications before 2019?","Degree before 2019",220.0,"","");
    }

    else{

      //Answer No 1
    if(widget.CheckCompleteQuestion =="Did you complete any degrees or professional qualifications before 2019?" && widget.CheckQuestion == "Degree before 2019")
    {

    if(widget.CheckAnswer[0] == "No")
    {
      //Question No 2
      return educationyesnoContainer("","Education","Did you complete your first degree/professional qualification in 2019?","Degree 2019",220.0,"","");
    }

    else if(widget.CheckAnswer[0] == "Yes")
    {
      //Question No 3
      return educationyesnoContainer("","Education","Did you participate in more than one training in 2019?","Multiple training courses",220.0,"","");

    }

    }

    //Answer No 2
   else if(widget.CheckCompleteQuestion =="Did you complete your first degree/professional qualification in 2019?" && widget.CheckQuestion == "Degree 2019")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 3
        //For No 430.0
        //For Yes 220.0
        return educationyesnoContainer("","Education","Did you participate in more than one training in 2019?","Multiple training courses",220.0,"","");
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {

      //Question no 3
        return educationyesnoContainer("","Education","Did you participate in more than one training in 2019?","Multiple training courses",220.0,"","");
      }

    }

    //Answer No 3

    else if(widget.CheckCompleteQuestion =="Did you participate in more than one training in 2019?" && widget.CheckQuestion == "Multiple training courses")
    {

      if(widget.CheckAnswer[0] == "No")
      {
       //Question No 5
        return educationdifferentoptionContainer("","Education","Which best applies to your training no. ${Questions.trainingLength}?","Kind of training",["Dual studies (job and university)","Vocational training (job and school)","Besides job (e.g. distance learning)","Full time study (university only)","School training","None of the above"],220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {

       //Question No 4
        return educationcalculationContainer("","Education","How many different trainings did you participate in during 2019?","Number of training courses",430.0,"","");
      }

    }


    //Answer No 4
    else if(widget.CheckCompleteQuestion =="How many different trainings did you participate in during 2019?" && widget.CheckQuestion == "Number of training courses")
    {
      //Question No 5

      //For Dual 430.0
      //For Vocational 430.0
      //For rest 220.0
      return educationdifferentoptionContainer("","Education","Which best applies to your training no. ${Questions.trainingLength}?","Kind of training",["Dual studies (job and university)","Vocational training (job and school)","Besides job (e.g. distance learning)","Full time study (university only)","School training","None of the above"],220.0,"",Questions.trainingText);
    }



//Yaha sa multiple sawal start hoga abhi single ka liya kaam kiya ha
    //Answer No 5
    else if(widget.CheckCompleteQuestion =="Which best applies to your training no. ${Questions.trainingLength}?" && widget.CheckQuestion == "Kind of training")
    {


      if(widget.CheckAnswer[0] == "Dual studies (job and university)")
      {
        //Question No 7
        //For None of these 210.0
        //For Travel Costs 430.0
        //For Tuition Fees 220.0
        //For Course material 220.0
        //For Interest on student loan 220.0
        //For Applications 220.0
        //For Student association 220.0
        //For Language course 220.0
        //For University admission lawsuit 220.0
        //For Other costs 220.0
        return educationmultipleoptionsContainer("","Education","What education costs did you have?","Type of costs",["Travel costs","Tuition fees","Items for education (e.g. computer, office furniture etc.)","Course material","Office supplies","Interest on student loan","Applications","Student association","Language course","University admission lawsuit","Other costs","None of these"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"None of these",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Vocational training (job and school)")
      {
        //Question No 7
        return educationmultipleoptionsContainer("","Education","What education costs did you have?","Type of costs",["Travel costs","Tuition fees","Items for education (e.g. computer, office furniture etc.)","Course material","Office supplies","Interest on student loan","Applications","Student association","Language course","University admission lawsuit","Other costs","None of these"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"None of these",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Besides job (e.g. distance learning)")
      {
        //Question No 6
        return educationcalculationContainer("","Education","What is the degree that you are currently pursuing called?","Degree",430.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Full time study (university only)")
      {
        //Question No 6
        return educationcalculationContainer("","Education","What is the degree that you are currently pursuing called?","Degree",430.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "School training")
      {
        //Question No 6
        return educationcalculationContainer("","Education","What is the degree that you are currently pursuing called?","Degree",430.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "None of the above")
      {
        //Question No 6
        return educationcalculationContainer("","Education","What is the degree that you are currently pursuing called?","Degree",430.0,"",Questions.trainingText);
      }

    }


    //Answer No 6
    else if(widget.CheckCompleteQuestion =="What is the degree that you are currently pursuing called?" && widget.CheckQuestion == "Degree")
    {

      //Question No 7
      //For None of these 210.0
      //For Travel Costs 430.0
      //For Tuition Fees 220.0
      //For Course material 220.0
      //For Interest on student loan 220.0
      //For Applications 220.0
      //For Student association 220.0
      //For Language course 220.0
      //For University admission lawsuit 220.0
      //For Other costs 220.0
      return educationmultipleoptionsContainer("","Education","What education costs did you have?","Type of costs",["Travel costs","Tuition fees","Items for education (e.g. computer, office furniture etc.)","Course material","Office supplies","Interest on student loan","Applications","Student association","Language course","University admission lawsuit","Other costs","None of these"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"None of these",Questions.trainingText);

    }


    //Answer No 7

    else if(widget.CheckCompleteQuestion =="What education costs did you have?" && widget.CheckQuestion == "Type of costs")
    {
      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Travel costs")
        {
         //Question No 8
          return educationmultipleoptionsContainer("","Education","What kind of trips did you take?","Kind of trips",["School/University","Library outside campus","Learning community","Unpaid internship","Excursion","Semester abroad"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],220.0,"",Questions.trainingText);

        }
        else if(widget.CheckAnswer[m] == "Tuition fees")
        {
         //Question No 9
          return educationcalculationContainer("","Education","How much were your course fees?","Course fees",220.0,"calculation",Questions.trainingText);

        }

        else if(widget.CheckAnswer[m] == "Items for education (e.g. computer, office furniture etc.)")
        {
        //Question No 99
          //For None of these 320.0
          //For rest 220.0
          return educationmultipleoptionsContainer("","Education","What kind of items did you buy in 2019 for training no. ${Questions.trainingLength}?","Item",["Office furniture","Computer/laptop","Computer accessories","Tools","Other","None of these"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],220.0,"None of these",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Course material")
        {
          //Question No 12
          return educationcalculationContainer("","Education","How much have you spent on course materials?","Course materials",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Office supplies")
        {
          //Question No 13
          return educationcalculationContainer("","Education","How much did you spend on office supplies?","Office supplies",220.0,"calculation",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "Interest on student loan")
        {
          //Question no 14
          return educationyesnoContainer("","Education","Did you take out a loan to finance the training?","Student loan",220.0,"",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "Applications")
        {
          //Question no 16
          return educationcalculationContainer("","Education","How much did you spend on training applications?","Training application expenses",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Student association")
        {
          //Question no 17
          return educationcalculationContainer("","Education","How much did you spend on student associations?","Student organization",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Language course")
        {
          //Question no 18
          return educationcalculationContainer("","Education","How much did you spend on language courses?","Language courses",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "University admission lawsuit")
        {
          //Question no 19
          return educationcalculationContainer("","Education","How much were your legal costs for your university admission lawsuit?","University admission lawsuit",220.0,"calculation",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "Other costs")
        {
          //Question no 20
          return educationcalculationContainer("","Education","What kind of costs did you have?","Kind of costs",220.0,"calculation",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "None of these")
        {
          //    Yaha multiple hoga dobara
          if(Questions.trainingLength <= Questions.totalTraining)
          {
            //Question No 5
            return educationdifferentoptionContainer("","Education","Which best applies to your training no. ${Questions.trainingLength}?","Kind of training",["Dual studies (job and university)","Vocational training (job and school)","Besides job (e.g. distance learning)","Full time study (university only)","School training","None of the above"],220.0,"",Questions.trainingText);
          }
          else
          {
            return FinishCategory("Education Category", "Family Category");
          }
        }


      }
    }



    // ====== Tuition Fees Start ====== //
    //Answer No 9
    else if(widget.CheckCompleteQuestion =="How much were your course fees?" && widget.CheckQuestion == "Course fees")
    {
//Question No 10
    //For No 210.0
      //For Yes 220.0
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

      }
// ====== Tuition Fees End ====== //



    //====== Course material Start ====== //
    //Answer No 12
    else if(widget.CheckCompleteQuestion =="How much have you spent on course materials?" && widget.CheckQuestion == "Course materials")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== Course material End ====== //


    //====== Office Supplies Start ====== //
    //Answer No 13
    else if(widget.CheckCompleteQuestion =="How much did you spend on office supplies?" && widget.CheckQuestion == "Office supplies")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== Office Supplies End ====== //




    //====== Interest on student loan Start ====== //
    //Answer No 14
    else if(widget.CheckCompleteQuestion =="Did you take out a loan to finance the training?" && widget.CheckQuestion == "Student loan")
    {

      if(widget.CheckAnswer[0] == "No")
      {
//Question No 10
        return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 15
        return educationcalculationContainer("","Education","How much interest did you pay?","Amount interest",220.0,"calculation",Questions.trainingText);
      }

    }

    //Answer No 15
    else if(widget.CheckCompleteQuestion =="How much interest did you pay?" && widget.CheckQuestion == "Amount interest")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== Interest on student loan End ====== //



    //====== Applications Start ====== //
    //Answer No 16
    else if(widget.CheckCompleteQuestion =="How much did you spend on training applications?" && widget.CheckQuestion == "Training application expenses")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== Applications End ====== //


    //====== Student association Start ====== //
    //Answer No 17
    else if(widget.CheckCompleteQuestion =="How much did you spend on student associations?" && widget.CheckQuestion == "Student organization")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== Student association End ====== //


    //====== Language course Start ====== //
    //Answer No 18
    else if(widget.CheckCompleteQuestion =="How much did you spend on language courses?" && widget.CheckQuestion == "Language courses")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== Language course End ====== //


    //====== University admission lawsuit Start ====== //
    //Answer No 19
    else if(widget.CheckCompleteQuestion =="How much were your legal costs for your university admission lawsuit?" && widget.CheckQuestion == "University admission lawsuit")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }

    //====== University admission lawsuit End ====== //


    //====== Other costs Start ====== //
    //Answer No 20
    else if(widget.CheckCompleteQuestion =="What kind of costs did you have?" && widget.CheckQuestion == "Kind of costs")
    {
      //Question No 21
      return educationcalculationContainer("","Education","How much did you spend on ${Questions.educationOtherCosts}?","Other costs",220.0,"calculation",Questions.trainingText);

    }

    //Answer No 21
    else if(widget.CheckCompleteQuestion =="How much did you spend on ${Questions.educationOtherCosts}?" && widget.CheckQuestion == "Other costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);

    }




    //====== Other costs End ====== //


    // ====== Travel Costs Start ======

    //Answer No 8
    else if(widget.CheckCompleteQuestion =="What kind of trips did you take?" && widget.CheckQuestion == "Kind of trips")
    {
      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "School/University")
        {
 //Question No 22
          return educationcalculationContainer("","Education","How many different routes to school/university did you use?","Number of routes",220.0,"",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "Library outside campus")
        {
//Question No 28
          return educationcalculationContainer("","Education","How many different routes did you use to travel to libraries outside your campus?","Number of routes",220.0,"",Questions.trainingText);

        }

        else if(widget.CheckAnswer[m] == "Learning community")
        {
//Question No 37
          return educationcalculationContainer("","Education","How many different routes did you use for travels to learning communities?","Number of routes",220.0,"",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Unpaid internship")
        {
//Question No 46
          return educationcalculationContainer("","Education","How many unpaid internships did you participate in?","Number of internships",280.0,"",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Excursion")
        {
//Question No 67
          return educationcalculationContainer("","Education","To how many excursions did you go?","Number of excursions",280.0,"",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "Semester abroad")
        {
//Question No 83
          return educationcalculationContainer("","Education","To how many semester abroad did you go?","Number of semester abroad",280.0,"",Questions.trainingText);
        }


      }
    }

    // ====== School/University Starts ======= //
    //Answer No 22
    else if(widget.CheckCompleteQuestion =="How many different routes to school/university did you use?" && widget.CheckQuestion == "Number of routes")
    {

      //Ya container baad ma change hoga
      //Question No 23
      return educationcalculationContainer("","Education","From where to where did you go on your route no. ${Questions.schoolRouteLength}?","Distance route no. ${Questions.schoolRouteLength}",220.0,"",Questions.schoolRouteText);

      }


   //Answer No 23
    else if(widget.CheckCompleteQuestion =="From where to where did you go on your route no. ${Questions.schoolRouteLength}?" && widget.CheckQuestion == "Distance route no. ${Questions.schoolRouteLength}")
    {
      //Question No 24
      return educationcalculationContainer("","Education","How often did you use this route in 2019?","Number of drives",430.0,"",Questions.schoolRouteText);

    }


    //Answer No 24
    else if(widget.CheckCompleteQuestion =="How often did you use this route in 2019?" && widget.CheckQuestion == "Number of drives")
    {
      //Question No 25
      return educationmultipleoptionsContainer("","Education","How did you get there?","Means of transport",["By car","By public transport","Bicycle","on foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"",Questions.schoolRouteText);

    }

    //Answer No 25
    else if(widget.CheckCompleteQuestion =="How did you get there?" && widget.CheckQuestion == "Means of transport")
    {
      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {
         if(Questions.schoolRouteLength <= Questions.totalSchoolRoute)
           {
             //Ya container baad ma change hoga
             //Question No 23
             return educationcalculationContainer("","Education","From where to where did you go on your route no. ${Questions.schoolRouteLength}?","Distance route no. ${Questions.schoolRouteLength}",220.0,"",Questions.schoolRouteText);
           }
          else{
           //Question No 10
           return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
         }

        }

        else if(widget.CheckAnswer[m] == "By public transport")
        {
         //Question No 26
          return educationyesnoContainer("","Education","Were your travel expenses for route no. ${Questions.schoolRouteLength} higher than €1.00?","Higher expenses",220.0,"",Questions.schoolRouteText);
        }

        else if(widget.CheckAnswer[m] == "Bicycle")
        {
          if(Questions.schoolRouteLength <= Questions.totalSchoolRoute)
          {
            //Ya container baad ma change hoga
            //Question No 23
            return educationcalculationContainer("","Education","From where to where did you go on your route no. ${Questions.schoolRouteLength}?","Distance route no. ${Questions.schoolRouteLength}",220.0,"",Questions.schoolRouteText);
          }
          else{
            //Question No 10
            return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
          }
        }

        else if(widget.CheckAnswer[m] == "on foot")
        {
          if(Questions.schoolRouteLength <= Questions.totalSchoolRoute)
          {
            //Ya container baad ma change hoga
            //Question No 23
            return educationcalculationContainer("","Education","From where to where did you go on your route no. ${Questions.schoolRouteLength}?","Distance route no. ${Questions.schoolRouteLength}",220.0,"",Questions.schoolRouteText);
          }
          else{
            //Question No 10
            return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
          }
        }

      }
    }

    //Answer No 26
    else if(widget.CheckCompleteQuestion =="Were your travel expenses for route no. ${Questions.schoolRouteLength} higher than €1.00?" && widget.CheckQuestion == "Higher expenses")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        if(Questions.schoolRouteLength <= Questions.totalSchoolRoute)
        {
          //Ya container baad ma change hoga
          //Question No 23
          return educationcalculationContainer("","Education","From where to where did you go on your route no. ${Questions.schoolRouteLength}?","Distance route no. ${Questions.schoolRouteLength}",220.0,"",Questions.schoolRouteText);
        }
        else{
          //Question No 10
          return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
        }
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 27
        return educationcalculationContainer("","Education","How much have you spent on travels to training?","Travel costs",220.0,"calculation",Questions.schoolRouteText);

      }

    }


    //Answer No 27
    else if(widget.CheckCompleteQuestion =="How much have you spent on travels to training?" && widget.CheckQuestion == "Travel costs")
    {
      if(Questions.schoolRouteLength <= Questions.totalSchoolRoute)
      {
        //Ya container baad ma change hoga
        //Question No 23
        return educationcalculationContainer("","Education","From where to where did you go on your route no. ${Questions.schoolRouteLength}?","Distance route no. ${Questions.schoolRouteLength}",220.0,"",Questions.schoolRouteText);
      }
      else{
        //Question No 10
        return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
      }
    }


    // ====== School/University Ends ======= //




// ====== Library outside campus Starts ====== //

//Answer No 28
    else if(widget.CheckCompleteQuestion =="How many different routes did you use to travel to libraries outside your campus?" && widget.CheckQuestion == "Number of routes")
    {
      //Question No 29
      return educationmultipleoptionsContainer("","Education","What route did you use to get to the library no. ${Questions.libraryRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.libraryRouteText);

    }



//Answer No 29
    else if(widget.CheckCompleteQuestion =="What route did you use to get to the library no. ${Questions.libraryRouteLength}?" && widget.CheckQuestion == "Transportation")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {
          //Ya container baad ma jaka change hoga
         //Question No 30
          return educationcalculationContainer("","Education","What were the start and end locations for your route to the library ${Questions.libraryRouteLength}?","Distance",220.0,"",Questions.libraryRouteText);

        }

        else if(widget.CheckAnswer[m] == "By public transport")
        {
         //Question No 36
          return educationcalculationContainer("","Education","How much did you spend in total?","Actual costs",220.0,"calculation",Questions.libraryRouteText);
        }

        else if(widget.CheckAnswer[m] == "By motorcycle")
        {
          //Question No 30
          return educationcalculationContainer("","Education","What were the start and end locations for your route to the library ${Questions.libraryRouteLength}?","Distance",220.0,"",Questions.libraryRouteText);
        }

        else if(widget.CheckAnswer[m] == "By bike")
        {
          if(Questions.libraryRouteLength <= Questions.totalLibraryRoute)
          {
            //Question No 29
            return educationmultipleoptionsContainer("","Education","What route did you use to get to the library no. ${Questions.libraryRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.libraryRouteText);
          }
          else{
            //Question No 32
            return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours when going to a library?","More than 8 hours",220.0,"",Questions.trainingText);
          }
        }

        else if(widget.CheckAnswer[m] == "By foot")
        {
          if(Questions.libraryRouteLength <= Questions.totalLibraryRoute)
          {
            //Question No 29
            return educationmultipleoptionsContainer("","Education","What route did you use to get to the library no. ${Questions.libraryRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.libraryRouteText);
          }
          else{
            //Question No 32
            return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours when going to a library?","More than 8 hours",220.0,"",Questions.trainingText);
          }
        }

      }
    }



    //Answer No 30
    else if(widget.CheckCompleteQuestion =="What were the start and end locations for your route to the library ${Questions.libraryRouteLength}?" && widget.CheckQuestion == "Distance")
    {
      //Question No 31
      return educationcalculationContainer("","Education","How often did you use the route no. ${Questions.libraryRouteLength} to the library?","Number of drives",220.0,"",Questions.libraryRouteText);

    }

    //Answer No 31

    else if(widget.CheckCompleteQuestion =="How often did you use the route no. ${Questions.libraryRouteLength -1} to the library?" && widget.CheckQuestion == "Number of drives")
    {
      if(Questions.libraryRouteLength <= Questions.totalLibraryRoute)
      {
        //Question No 29
        return educationmultipleoptionsContainer("","Education","What route did you use to get to the library no. ${Questions.libraryRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.libraryRouteText);
      }
      else{
        //Question No 32
        return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours when going to a library?","More than 8 hours",220.0,"",Questions.trainingText);
      }

    }


    //Answer No 32
    else if(widget.CheckCompleteQuestion =="Have you been away from home and your campus for more than 8 hours when going to a library?" && widget.CheckQuestion == "More than 8 hours")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 33
        return educationyesnoContainer("","Education","Did you have additional costs due to traveling to libraries, e.g. parking?","Additional costs",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {

       //Question No 34
        return educationcalculationContainer("","Education","How many days have you been away for more than 8 hours when going to a library?","Days at library",220.0,"",Questions.trainingText);
      }

    }


    //Answer No 33
    else if(widget.CheckCompleteQuestion =="Did you have additional costs due to traveling to libraries, e.g. parking?" && widget.CheckQuestion == "Additional costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 10
        return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
      //Question No 35
        return educationcalculationContainer("","Education","How much additional costs did you have in total due to trips to libraries?","Total additional costs",220.0,"",Questions.trainingText);

      }

    }


   //Answer No 34
    else if(widget.CheckCompleteQuestion =="How many days have you been away for more than 8 hours when going to a library?" && widget.CheckQuestion == "Days at library")
    {
      //Question No 33
      return educationyesnoContainer("","Education","Did you have additional costs due to traveling to libraries, e.g. parking?","Additional costs",220.0,"",Questions.trainingText);

      }



   //Answer No 35
    else if(widget.CheckCompleteQuestion =="How much additional costs did you have in total due to trips to libraries?" && widget.CheckQuestion == "Total additional costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }



   //Answer No 36
    else if(widget.CheckCompleteQuestion =="How much did you spend in total?" && widget.CheckQuestion == "Actual costs")
    {
      if(Questions.libraryRouteLength <= Questions.totalLibraryRoute)
      {
        //Question No 29
        return educationmultipleoptionsContainer("","Education","What route did you use to get to the library no. ${Questions.libraryRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.libraryRouteText);
      }
      else{
        //Question No 32
        return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours when going to a library?","More than 8 hours",220.0,"",Questions.trainingText);
      }

    }


// ====== Library outside campus Ends ====== //



    // ====== Learning Community Starts ====== //

    //Answer No 37
    else if(widget.CheckCompleteQuestion =="How many different routes did you use for travels to learning communities?" && widget.CheckQuestion == "Number of routes")
    {
      //Question No 38
      //For car 220.0
      //For public transport 220.0
      //For Motorcycle 220.0
      //For bike 430.0
      //For foot 430.0
      return educationmultipleoptionsContainer("","Education","How did you go to the learning community on route no. ${Questions.learningRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.learningRouteText);

    }

    //Answer No 38
    else if(widget.CheckCompleteQuestion =="How did you go to the learning community on route no. ${Questions.learningRouteLength}?" && widget.CheckQuestion == "Transportation")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {

          //Ya container baad ma jaka change hoga
          //Question No 39
          return educationcalculationContainer("","Education","From where to where did you go on route no. ${Questions.learningRouteLength}?","Distance",220.0,"",Questions.learningRouteText);


        }

        else if(widget.CheckAnswer[m] == "By public transport")
        {
//Question No 45
          return educationcalculationContainer("","Education","How much did you spend in total for the route no. ${Questions.learningRouteLength}?","Actual costs",220.0,"",Questions.learningRouteText);
        }

        else if(widget.CheckAnswer[m] == "By motorcycle")
        {
          //MotorCycle and Car dono ka steps same ha
          //Ya container baad ma jaka change hoga
          //Question No 39
          return educationcalculationContainer("","Education","From where to where did you go on route no. ${Questions.learningRouteLength}?","Distance",220.0,"",Questions.learningRouteText);
        }

        else if(widget.CheckAnswer[m] == "By bike")
        {
          if(Questions.learningRouteLength <= Questions.totalLearningRoute)
          {
            //Question No 38
            return educationmultipleoptionsContainer("","Education","How did you go to the learning community on route no. ${Questions.learningRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.learningRouteText);
          }
          else
          {
            //Question No 41
            return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours while traveling to a learning community?","More than 8 hours",220.0,"",Questions.trainingText);
          }
        }

        else if(widget.CheckAnswer[m] == "By foot")
        {
          if(Questions.learningRouteLength <= Questions.totalLearningRoute)
          {
            //Question No 38
            return educationmultipleoptionsContainer("","Education","How did you go to the learning community on route no. ${Questions.learningRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.learningRouteText);
          }
          else
          {
            //Question No 41
            return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours while traveling to a learning community?","More than 8 hours",220.0,"",Questions.trainingText);
          }
        }

      }
    }



    //Answer No 39
    else if(widget.CheckCompleteQuestion =="From where to where did you go on route no. ${Questions.learningRouteLength}?" && widget.CheckQuestion == "Distance")
    {
      //Question No 40
      return educationcalculationContainer("","Education","How often did you use the route no. ${Questions.learningRouteLength}?","Number of drives",220.0,"",Questions.learningRouteText);
    }

    //Answer No 40
    else if(widget.CheckCompleteQuestion =="How often did you use the route no. ${Questions.learningRouteLength - 1}?" && widget.CheckQuestion == "Number of drives")
    {
      if(Questions.learningRouteLength <= Questions.totalLearningRoute)
        {
          //Question No 38
          return educationmultipleoptionsContainer("","Education","How did you go to the learning community on route no. ${Questions.learningRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.learningRouteText);
        }
      else
        {
        //Question No 41
          return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours while traveling to a learning community?","More than 8 hours",220.0,"",Questions.trainingText);
      }

    }

    //Answer No 45
    else if(widget.CheckCompleteQuestion =="How much did you spend in total for the route no. ${Questions.learningRouteLength - 1}?" && widget.CheckQuestion == "Actual costs")
    {
      if(Questions.learningRouteLength <= Questions.totalLearningRoute)
      {
        //Question No 38
        return educationmultipleoptionsContainer("","Education","How did you go to the learning community on route no. ${Questions.learningRouteLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],220.0,"",Questions.learningRouteText);
      }
      else
      {
        //Question No 41
        return educationyesnoContainer("","Education","Have you been away from home and your campus for more than 8 hours while traveling to a learning community?","More than 8 hours",220.0,"",Questions.trainingText);
      }
    }



    //Answer No 41
    else if(widget.CheckCompleteQuestion =="Have you been away from home and your campus for more than 8 hours while traveling to a learning community?" && widget.CheckQuestion == "More than 8 hours")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 43
        return educationyesnoContainer("","Education","Have you had additional costs due to travelling to learning communities, e.g. parking?","Additional costs",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
//Question No 42
        return educationcalculationContainer("","Education","How many days, in total during the tax year, have you been away for more than 8 hours for study groups?","Days at learning community",220.0,"",Questions.trainingText);

      }

    }

    //Answer No 42
    else if(widget.CheckCompleteQuestion =="How many days, in total during the tax year, have you been away for more than 8 hours for study groups?" && widget.CheckQuestion == "Days at learning community")
    {
      //Question No 43
      return educationyesnoContainer("","Education","Have you had additional costs due to travelling to learning communities, e.g. parking?","Additional costs",220.0,"",Questions.trainingText);
    }


    //Answer No 43
    else if(widget.CheckCompleteQuestion =="Have you had additional costs due to travelling to learning communities, e.g. parking?" && widget.CheckQuestion == "Additional costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 10
        return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
//Question No 44
        return educationcalculationContainer("","Education","How much additional costs have you had in total when going to learning communities?","Total additional costs",220.0,"calculation",Questions.trainingText);

      }
    }

    //Answer No 44
    else if(widget.CheckCompleteQuestion =="How much additional costs have you had in total when going to learning communities?" && widget.CheckQuestion == "Total additional costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }


    // ====== Learning Community Ends ====== //


    // ====== Unpaid internship Starts ====== //

    //Answer No 46
    else if(widget.CheckCompleteQuestion =="How many unpaid internships did you participate in?" && widget.CheckQuestion == "Number of internships")
    {
      //Question No 47
      return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],430.0,"",Questions.unpaidInternText);
    }

    //Answer No 47
    else if(widget.CheckCompleteQuestion =="Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Destination no. ${Questions.unpaidInternLength}")
    {

      if(widget.CheckAnswer[0] == "Germany")
      {
        //Question No 48
        return educationmultipleoptionsContainer("","Education","How did you get to your unpaid internship no. ${Questions.unpaidInternLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot","By plane","By ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"",Questions.unpaidInternText);
      }

      else if(widget.CheckAnswer[0] == "Abroad")
      {
//Question No 48
        return educationmultipleoptionsContainer("","Education","How did you get to your unpaid internship no. ${Questions.unpaidInternLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot","By plane","By ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"",Questions.unpaidInternText);

      }
    }


   //Answer No 48
    else if(widget.CheckCompleteQuestion =="How did you get to your unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Transportation")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {

          //Ya container baad ma jaka change hoga
          //Question No 49
          return educationcalculationContainer("","Education","From where to where did you go by car/motorcycle to unpaid internship no. ${Questions.unpaidInternLength}?","Distance",220.0,"",Questions.unpaidInternText);

        }

        else if(widget.CheckAnswer[m] == "By public transport")
        {
          //Question No 61
          return educationcalculationContainer("","Education","How much did you spend in total for going to unpaid internship no. ${Questions.unpaidInternLength}?","Actual costs",370.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "By motorcycle")
        {
          //Ya container baad ma jaka change hoga
          //Question No 49
          return educationcalculationContainer("","Education","From where to where did you go by car/motorcycle to unpaid internship no. ${Questions.unpaidInternLength}?","Distance",220.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "By bike")
        {
//Question No 51
          return educationmultithreeContainer("","Education","Did any of these absences apply to you during your unpaid internship no. ${Questions.unpaidInternLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
        }
        else if(widget.CheckAnswer[m] == "By foot")
        {
//Question No 51
          return educationmultithreeContainer("","Education","Did any of these absences apply to you during your unpaid internship no. ${Questions.unpaidInternLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "By plane")
        {
          //Question No 61
          return educationcalculationContainer("","Education","How much did you spend in total for going to unpaid internship no. ${Questions.unpaidInternLength}?","Actual costs",370.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "By ferry")
        {
          //Question No 61
          return educationcalculationContainer("","Education","How much did you spend in total for going to unpaid internship no. ${Questions.unpaidInternLength}?","Actual costs",370.0,"",Questions.unpaidInternText);
        }
      }
    }


    //Answer No 49
    else if(widget.CheckCompleteQuestion =="From where to where did you go by car/motorcycle to unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Distance")
    {
      //Question No 50
      return educationcalculationContainer("","Education","How often did you use this route to your unpaid internship no. ${Questions.unpaidInternLength}?","Number of drives",370.0,"",Questions.unpaidInternText);
    }

    //Answer No 50
    else if(widget.CheckCompleteQuestion =="How often did you use this route to your unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Number of drives")
    {
      //Question No 51
      return educationmultithreeContainer("","Education","Did any of these absences apply to you during your unpaid internship no. ${Questions.unpaidInternLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
    }


    //Answer No 61
    else if(widget.CheckCompleteQuestion =="How much did you spend in total for going to unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Actual costs")
    {
      //Question No 51
      return educationmultithreeContainer("","Education","Did any of these absences apply to you during your unpaid internship no. ${Questions.unpaidInternLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
    }


    //Answer No 51
    else if(widget.CheckCompleteQuestion =="Did any of these absences apply to you during your unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Absence")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "More than 8 hours")
        {
          //Question No 52
          return educationcalculationContainer("","Education","How many times did you spend more than 8 hours away from home while participating in an unpaid internship no. ${Questions.unpaidInternLength}?","Days at unpaid internship",370.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "24 hours due to overnight stay")
        {
          if(Questions.unpaidInternLength <= Questions.totalUnpaidIntern)
          {
            //Question No 47
            return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],220.0,"",Questions.unpaidInternText);
          }
          else
          {
            //Question No 55
            return educationmultipleoptionsContainer("","Education","Did you have any additional costs while traveling to the unpaid internships?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

        else if(widget.CheckAnswer[m] == "Arrival/departure days with overnight stay")
        {
//Question No 58
          return educationcalculationContainer("","Education","How many arrival & departure days did you have in connection with overnight stays when participating in an unpaid internship no. ${Questions.unpaidInternLength}?","Arrival/departure days",220.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          if(Questions.unpaidInternLength <= Questions.totalUnpaidIntern)
          {
            //Question No 47
            return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],220.0,"",Questions.unpaidInternText);
          }
          else
          {
            //Question No 55
            return educationmultipleoptionsContainer("","Education","Did you have any additional costs while traveling to the unpaid internships?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

      }
    }



    //Answer No 52

    else if(widget.CheckCompleteQuestion =="How many times did you spend more than 8 hours away from home while participating in an unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Days at unpaid internship")
    {
      //Question No 53
      //For No 280.0
      //For rest 220.0
      return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
    }




    //Answer No 53
    else if(widget.CheckCompleteQuestion =="Did you receive free meals?" && widget.CheckQuestion == "Free meals" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Breakfast")
        {
         //Question No 54
          return educationcalculationContainer("","Education","How often did you receive complimentary breakfast?","Number of breakfast",370.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "Lunch")
        {
          //Question No 56
          return educationcalculationContainer("","Education","How often did you receive complimentary lunch?","Number of lunch",370.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "Dinner")
        {
//Question No 57
          return educationcalculationContainer("","Education","How often did you receive complimentary dinner?","Number of dinner",370.0,"",Questions.unpaidInternText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          if(Questions.unpaidInternLength <= Questions.totalUnpaidIntern)
          {
            //Question No 47
            return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],220.0,"",Questions.unpaidInternText);
          }
          else
          {
            //Question No 55
            return educationmultipleoptionsContainer("","Education","Did you have any additional costs while traveling to the unpaid internships?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

      }
    }


    //Answer No 54
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary breakfast?" && widget.CheckQuestion == "Number of breakfast" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
    {
      if(Questions.unpaidInternLength <= Questions.totalUnpaidIntern)
      {
        //Question No 47
        return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],220.0,"",Questions.unpaidInternText);
      }
      else
        {
        //Question No 55
          return educationmultipleoptionsContainer("","Education","Did you have any additional costs while traveling to the unpaid internships?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }

    //Answer No 56
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary lunch?" && widget.CheckQuestion == "Number of lunch" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
    {
      if(Questions.unpaidInternLength <= Questions.totalUnpaidIntern)
      {
        //Question No 47
        return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],220.0,"",Questions.unpaidInternText);
      }
      else
      {
        //Question No 55
        return educationmultipleoptionsContainer("","Education","Did you have any additional costs while traveling to the unpaid internships?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }

    //Answer No 57
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary dinner?" && widget.CheckQuestion == "Number of dinner" && Questions.unpaidInternText.contains("UNPAID INTERNSHIP"))
    {
      if(Questions.unpaidInternLength <= Questions.totalUnpaidIntern)
      {
        //Question No 47
        return educationtwooptionContainer("","Education","Where did you complete your unpaid internship no. ${Questions.unpaidInternLength}?","Destination no. ${Questions.unpaidInternLength}",["Germany","Abroad"],220.0,"",Questions.unpaidInternText);
      }
      else
      {
        //Question No 55
        return educationmultipleoptionsContainer("","Education","Did you have any additional costs while traveling to the unpaid internships?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }


    //Answer No 58
    else if(widget.CheckCompleteQuestion =="How many arrival & departure days did you have in connection with overnight stays when participating in an unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Arrival/departure days")
    {
      //Question No 59
      return educationyesnoContainer("","Education","Did you have accommodation costs while participating in an unpaid internship no. ${Questions.unpaidInternLength}?","Accommodation costs",220.0,"",Questions.unpaidInternText);
    }

    //Answer No 59
    else if(widget.CheckCompleteQuestion =="Did you have accommodation costs while participating in an unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Accommodation costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 53
        return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 60
        return educationcalculationContainer("","Education","How much did you spend in total on accommodation while participating in an unpaid internship no. ${Questions.unpaidInternLength}?","Amount accommodation costs",260.0,"",Questions.unpaidInternText);

      }
    }


    //Answer No 60
    else if(widget.CheckCompleteQuestion =="How much did you spend in total on accommodation while participating in an unpaid internship no. ${Questions.unpaidInternLength}?" && widget.CheckQuestion == "Amount accommodation costs")
    {
      //Question No 53
      return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.unpaidInternText);
    }



    //Answer No 55
    else if(widget.CheckCompleteQuestion =="Did you have any additional costs while traveling to the unpaid internships?" && widget.CheckQuestion == "Additional costs")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Parking")
        {
         //Question No 62
          return educationcalculationContainer("","Education","How much did you pay for parking?","Parking costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Baggage")
        {
          //Question No 63
          return educationcalculationContainer("","Education","How much did you pay for baggage?","Baggage costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Toll")
        {
          //Question No 64
          return educationcalculationContainer("","Education","How much did you pay for tolls?","Toll costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Business Calls")
        {
//Question No 65
          return educationcalculationContainer("","Education","How much did you pay for business calls?","Business call costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Other")
        {
//Question No 66
          return educationcalculationContainer("","Education","How much did you pay for other costs?","Other costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          //Question No 10
          return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
        }

      }
    }



    //Answer No 62
    else if(widget.CheckCompleteQuestion =="How much did you pay for parking?" && widget.CheckQuestion == "Parking costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    //Answer No 63
    else if(widget.CheckCompleteQuestion =="How much did you pay for baggage?" && widget.CheckQuestion == "Baggage costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    //Answer No 64
    else if(widget.CheckCompleteQuestion =="How much did you pay for tolls?" && widget.CheckQuestion == "Toll costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    //Answer No 65
    else if(widget.CheckCompleteQuestion =="How much did you pay for business calls?" && widget.CheckQuestion == "Business call costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    //Answer No 66
    else if(widget.CheckCompleteQuestion =="How much did you pay for other costs?" && widget.CheckQuestion == "Other costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    // ====== Unpaid internship Ends ====== //




   // ====== Excursion Starts ======= //

//Answer No 67
    else if(widget.CheckCompleteQuestion =="To how many excursions did you go?" && widget.CheckQuestion == "Number of excursions")
    {
      //Question No 68
      return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
    }

   //Answer No 68
    else if(widget.CheckCompleteQuestion =="Where did you go on excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Destination no. ${Questions.excursionLength}")
    {

      if(widget.CheckAnswer[0] == "Germany")
      {
        //Question No 69
        //For car, motorcycle 220.0
        //For public transport, plane ,ferry 220.0
        //for bike , foot 370.0
        return educationmultipleoptionsContainer("","Education","How did you go to excursion no. ${Questions.excursionLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot","By plane","By ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"",Questions.excursionText);
      }

      else if(widget.CheckAnswer[0] == "Abroad")
      {
        return educationmultipleoptionsContainer("","Education","How did you go to excursion no. ${Questions.excursionLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot","By plane","By ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"",Questions.excursionText);

      }
    }

    //Answer No 69
    else if(widget.CheckCompleteQuestion =="How did you go to excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Transportation")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {
          //Ya container baad ma jaka change hoga
          //Question No 70
          return educationcalculationContainer("","Education","From where to where did you go on excursion no. ${Questions.excursionLength}?","Distance",220.0,"",Questions.excursionText);

        }

        else if(widget.CheckAnswer[m] == "By public transport")
        {
        //Question No 82
          return educationcalculationContainer("","Education","How much did you spend in total for going to excursion no. ${Questions.excursionLength}?","Actual costs",370.0,"calculation",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "By motorcycle")
        {
           //Ya container baad ma jaka change hoga
          //Question No 70
          return educationcalculationContainer("","Education","From where to where did you go on excursion no. ${Questions.excursionLength}?","Distance",220.0,"",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "By bike")
        {
//Question No 72
          //For more than 8 220.0
          //For Arrival/departure 220.0
          return educationmultithreeContainer("","Education","Do any of these kind of absences apply to you for excursion no. ${Questions.excursionLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
        }
        else if(widget.CheckAnswer[m] == "By foot")
        {
//Question No 72
          return educationmultithreeContainer("","Education","Do any of these kind of absences apply to you for excursion no. ${Questions.excursionLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "By plane")
        {
//Question No 82
          return educationcalculationContainer("","Education","How much did you spend in total for going to excursion no. ${Questions.excursionLength}?","Actual costs",370.0,"calculation",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "By ferry")
        {
//Question No 82
          return educationcalculationContainer("","Education","How much did you spend in total for going to excursion no. ${Questions.excursionLength}?","Actual costs",370.0,"calculation",Questions.excursionText);
        }
      }
    }


    //Answer No 70
    else if(widget.CheckCompleteQuestion =="From where to where did you go on excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Distance")
    {
      //Question No 71
      return educationcalculationContainer("","Education","How often did you use the route to excursion no. ${Questions.excursionLength}?","Number of drives",370.0,"",Questions.excursionText);
    }

    //Answer No 71
    else if(widget.CheckCompleteQuestion =="How often did you use the route to excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Number of drives")
    {
      //Question No 72

      return educationmultithreeContainer("","Education","Do any of these kind of absences apply to you for excursion no. ${Questions.excursionLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
    }


    //Answer No 82
    else if(widget.CheckCompleteQuestion =="How much did you spend in total for going to excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Actual costs")
    {
      //Question No 72
      return educationmultithreeContainer("","Education","Do any of these kind of absences apply to you for excursion no. ${Questions.excursionLength}?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
    }


    //Answer No 72
    else if(widget.CheckCompleteQuestion =="Do any of these kind of absences apply to you for excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Absence")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "More than 8 hours")
        {
          //Question No 73
          return educationcalculationContainer("","Education","How many days have you been away for more than 8 hours when going to excursion no. ${Questions.excursionLength}?","Days at excursion",370.0,"",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "24 hours due to overnight stay")
        {
          if(Questions.excursionLength <= Questions.totalExcursion)
          {
            //Question No 68
            return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
          }
          else
          {
            //Question No 78
            return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to excursions?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }

        }

        else if(widget.CheckAnswer[m] == "Arrival/departure days with overnight stay")
        {
          //Question No 79
          return educationcalculationContainer("","Education","How many arrival & departure days did you have in connection with overnight stays at excursion no. ${Questions.excursionLength}?","Arrival/departure",220.0,"",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          if(Questions.excursionLength <= Questions.totalExcursion)
          {
            //Question No 68
            return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
          }
          else
          {
            //Question No 78
            return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to excursions?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

      }
    }

    //Answer No 73
    else if(widget.CheckCompleteQuestion =="How many days have you been away for more than 8 hours when going to excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Days at excursion")
    {
      //Question No 74
      //For No 280.0
      //For rest 220.0
      return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
    }


    //Answer No 79
    else if(widget.CheckCompleteQuestion =="How many arrival & departure days did you have in connection with overnight stays at excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Arrival/departure")
    {
      //Question No 80
      //For No 370.0
      //For yes 220.0
      return educationyesnoContainer("","Education","Have you had accommodation costs when going to excursion no. ${Questions.excursionLength}?","Accommodation costs",220.0,"",Questions.excursionText);
    }

    //Answer No 80
    else if(widget.CheckCompleteQuestion =="Have you had accommodation costs when going to excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Accommodation costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 74
        return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 81
        return educationcalculationContainer("","Education","How much did you spend in total for the accommodation when going on excursion no. ${Questions.excursionLength}?","Amount accommodation costs",370.0,"calculation",Questions.excursionText);

      }
    }


    //Answer No 81
    else if(widget.CheckCompleteQuestion =="How much did you spend in total for the accommodation when going on excursion no. ${Questions.excursionLength}?" && widget.CheckQuestion == "Amount accommodation costs")
    {
      //Question No 74
      return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.excursionText);
    }






    //Answer No 74
    else if(widget.CheckCompleteQuestion =="Did you receive free meals?" && widget.CheckQuestion == "Free meals" && Questions.excursionText.contains("EXCURSION"))
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Breakfast")
        {
          //Question No 75
          return educationcalculationContainer("","Education","How often did you receive complimentary breakfast?","Number of breakfast",220.0,"",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "Lunch")
        {
          //Question No 76
          return educationcalculationContainer("","Education","How often did you receive complimentary lunch?","Number of lunch",220.0,"",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "Dinner")
        {
//Question No 77
          return educationcalculationContainer("","Education","How often did you receive complimentary dinner?","Number of dinner",220.0,"",Questions.excursionText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          if(Questions.excursionLength <= Questions.totalExcursion)
          {
            //Question No 68
            return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
          }
          else
          {
            //Question No 78
            return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to excursions?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

      }
    }

    //Answer No 75
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary breakfast?" && widget.CheckQuestion == "Number of breakfast" && Questions.excursionText.contains("EXCURSION"))
    {
      if(Questions.excursionLength <= Questions.totalExcursion)
      {
        //Question No 68
        return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
      }
      else
      {
        //Question No 78
        return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to excursions?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }

    //Answer No 76
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary lunch?" && widget.CheckQuestion == "Number of lunch" && Questions.excursionText.contains("EXCURSION"))
    {
      if(Questions.excursionLength <= Questions.totalExcursion)
      {
        //Question No 68
        return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
      }
      else
      {
        //Question No 78
        return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to excursions?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }

    //Answer No 77
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary dinner?" && widget.CheckQuestion == "Number of dinner" && Questions.excursionText.contains("EXCURSION"))
    {
      if(Questions.excursionLength <= Questions.totalExcursion)
      {
        //Question No 68
        return educationtwooptionContainer("","Education","Where did you go on excursion no. ${Questions.excursionLength}?","Destination no. ${Questions.excursionLength}",["Germany","Abroad"],430.0,"",Questions.excursionText);
      }
      else
      {
        //Question No 78
        return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to excursions?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }


    //Answer No 78
    else if(widget.CheckCompleteQuestion =="Have you had additional costs due to travelling to excursions?" && widget.CheckQuestion == "Additional costs")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Parking")
        {
          //Same as unpaid internship
          //Question No 62
          return educationcalculationContainer("","Education","How much did you pay for parking?","Parking costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Baggage")
        {
          //Same as unpaid internship
          //Question No 63
          return educationcalculationContainer("","Education","How much did you pay for baggage?","Baggage costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Toll")
        {
          //Same as unpaid internship
          //Question No 64
          return educationcalculationContainer("","Education","How much did you pay for tolls?","Toll costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Business Calls")
        {
          //Same as unpaid internship
//Question No 65
          return educationcalculationContainer("","Education","How much did you pay for business calls?","Business call costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Other")
        {
          //Same as unpaid internship
//Question No 66
          return educationcalculationContainer("","Education","How much did you pay for other costs?","Other costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          //Same as unpaid internship
          //Question No 10
          return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
        }

      }
    }

    // ====== Excursion Ends ======= //


  // ====== Semester abroad Starts ====== //

   //Answer No 83

    else if(widget.CheckCompleteQuestion =="To how many semester abroad did you go?" && widget.CheckQuestion == "Number of semester abroad")
    {
      //Question No 84
      return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
    }

    //Answer No 84
    else if(widget.CheckCompleteQuestion =="Where did you go to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Destination no. ${Questions.semesterLength}")
    {

      if(widget.CheckAnswer[0] == "Germany")
      {
        //Question No 85
        //For car, motorcycle 220.0
        //For public transport, plane ,ferry 220.0
        //for bike , foot 370.0
        return educationmultipleoptionsContainer("","Education","How did you travel to your semester abroad no. ${Questions.semesterLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot","By plane","By ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"",Questions.semesterText);
      }

      else if(widget.CheckAnswer[0] == "Abroad")
      {
        return educationmultipleoptionsContainer("","Education","How did you travel to your semester abroad no. ${Questions.semesterLength}?","Transportation",["By car","By public transport","By motorcycle","By bike","By foot","By plane","By ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],220.0,"",Questions.semesterText);

      }
    }

    //Answer No 85
    else if(widget.CheckCompleteQuestion =="How did you travel to your semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Transportation")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "By car")
        {
          //Ya container baad ma jaka change hoga
          //Question No 86
          return educationcalculationContainer("","Education","From where to where did you to semester abroad no. ${Questions.semesterLength}?","Distance",220.0,"",Questions.semesterText);

        }

        else if(widget.CheckAnswer[m] == "By public transport")
        {
       //Question No 98
          return educationcalculationContainer("","Education","How much did you spend for the round trip going to semester abroad no. ${Questions.semesterLength}?","Actual costs",370.0,"calculation",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "By motorcycle")
        {
           //Ya container baad ma jaka change hoga
          //Question No 86
          return educationcalculationContainer("","Education","From where to where did you to semester abroad no. ${Questions.semesterLength}?","Distance",220.0,"",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "By bike")
        {
//Question No 88
        //For More than 8 hours 220.0
        //Arrival/departure 220.0
          return educationmultithreeContainer("","Education","Do any of these kinds of absences apply to you for semester abroad no. ${Questions.semesterLength} in the 1st three months?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
        }
        else if(widget.CheckAnswer[m] == "By foot")
        {
//Question No 88
          return educationmultithreeContainer("","Education","Do any of these kinds of absences apply to you for semester abroad no. ${Questions.semesterLength} in the 1st three months?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "By plane")
        {
          //Question No 98
          return educationcalculationContainer("","Education","How much did you spend for the round trip going to semester abroad no. ${Questions.semesterLength}?","Actual costs",370.0,"calculation",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "By ferry")
        {
          //Question No 98
          return educationcalculationContainer("","Education","How much did you spend for the round trip going to semester abroad no. ${Questions.semesterLength}?","Actual costs",370.0,"calculation",Questions.semesterText);
        }
      }
    }


    //Answer No 86
    else if(widget.CheckCompleteQuestion =="From where to where did you to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Distance")
    {
      //Question No 87
      return educationcalculationContainer("","Education","How often did you use the route to semester abroad no. ${Questions.semesterLength}?","Number of drives",370.0,"",Questions.semesterText);
    }

    //Answer No 87
    else if(widget.CheckCompleteQuestion =="How often did you use the route to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Number of drives")
    {
      //Question No 88
      return educationmultithreeContainer("","Education","Do any of these kinds of absences apply to you for semester abroad no. ${Questions.semesterLength} in the 1st three months?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
    }


    //Answer No 98
    else if(widget.CheckCompleteQuestion =="How much did you spend for the round trip going to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Actual costs")
    {
      //Question No 88
      return educationmultithreeContainer("","Education","Do any of these kinds of absences apply to you for semester abroad no. ${Questions.semesterLength} in the 1st three months?","Absence",["More than 8 hours","24 hours due to overnight stay","Arrival/departure days with overnight stay","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
    }



    //Answer No 88

    else if(widget.CheckCompleteQuestion =="Do any of these kinds of absences apply to you for semester abroad no. ${Questions.semesterLength} in the 1st three months?" && widget.CheckQuestion == "Absence")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "More than 8 hours")
        {
          //Question No 89
          return educationcalculationContainer("","Education","How many days have you been away for more than 8 hours while traveling to semester abroad no. ${Questions.semesterLength}?","Days at excursion",370.0,"",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "24 hours due to overnight stay")
        {
          if(Questions.semesterLength <= Questions.totalSemester)
          {
            //Question No 84
            return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
          }
          else
          {
            //Question No 94
            return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to semesters abroad?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

        else if(widget.CheckAnswer[m] == "Arrival/departure days with overnight stay")
        {
        //Question No 95
          return educationcalculationContainer("","Education","How many arrival & departure days did you have in connection with overnight stays within the first three months at semester abroad no. ${Questions.semesterLength}?","Arrival/departure days",220.0,"",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          if(Questions.semesterLength <= Questions.totalSemester)
          {
            //Question No 84
            return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
          }
          else
          {
            //Question No 94
            return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to semesters abroad?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

      }
    }


    //Answer No 89
    else if(widget.CheckCompleteQuestion =="How many days have you been away for more than 8 hours while traveling to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Days at excursion")
    {
      //Question No 90
      //For No 280.0
      //For rest 220.0
      return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
    }



    //Answer No 95

    else if(widget.CheckCompleteQuestion =="How many arrival & departure days did you have in connection with overnight stays within the first three months at semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Arrival/departure days")
    {
      //Question No 96
      //For No 370.0
      //For yes 220.0
      return educationyesnoContainer("","Education","Did you have any accommodation costs while traveling to semester abroad no. ${Questions.semesterLength}?","Accommodation costs",220.0,"",Questions.semesterText);
    }

    //Answer No 96
    else if(widget.CheckCompleteQuestion =="Did you have any accommodation costs while traveling to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Accommodation costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 90
        return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 97
        return educationcalculationContainer("","Education","How much did you spend in total, for accommodation while traveling to semester abroad no. ${Questions.semesterLength}?","Amount accommodation costs",370.0,"calculation",Questions.semesterText);

      }
    }


    //Answer No 97
    else if(widget.CheckCompleteQuestion =="How much did you spend in total, for accommodation while traveling to semester abroad no. ${Questions.semesterLength}?" && widget.CheckQuestion == "Amount accommodation costs")
    {
      //Question No 90
      return educationmultithreeContainer("","Education","Did you receive free meals?","Free meals",["Breakfast","Lunch","Dinner","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],220.0,"No",Questions.semesterText);
    }




    //Answer No 90
    else if(widget.CheckCompleteQuestion =="Did you receive free meals?" && widget.CheckQuestion == "Free meals" && Questions.semesterText.contains("SEMESTER ABROAD"))
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Breakfast")
        {
          //Question No 91
          return educationcalculationContainer("","Education","How often did you receive complimentary breakfast?","Number of breakfast",260.0,"",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "Lunch")
        {
          //Question No 92
          return educationcalculationContainer("","Education","How often did you receive complimentary lunch?","Number of lunch",260.0,"",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "Dinner")
        {
//Question No 93
          return educationcalculationContainer("","Education","How often did you receive complimentary dinner?","Number of dinner",260.0,"",Questions.semesterText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          if(Questions.semesterLength <= Questions.totalSemester)
          {
            //Question No 84
            return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
          }
          else
          {
            //Question No 94
            return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to semesters abroad?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
          }
        }

      }
    }

    //Answer No 91
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary breakfast?" && widget.CheckQuestion == "Number of breakfast" && Questions.semesterText.contains("SEMESTER ABROAD"))
    {
      if(Questions.semesterLength <= Questions.totalSemester)
      {
        //Question No 84
        return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
      }
      else
      {
        //Question No 94
        return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to semesters abroad?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }

    //Answer No 92
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary lunch?" && widget.CheckQuestion == "Number of lunch" && Questions.semesterText.contains("SEMESTER ABROAD"))
    {
      if(Questions.semesterLength <= Questions.totalSemester)
      {
        //Question No 84
        return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
      }
      else
      {
        //Question No 94
        return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to semesters abroad?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }

    //Answer No 93
    else if(widget.CheckCompleteQuestion =="How often did you receive complimentary dinner?" && widget.CheckQuestion == "Number of dinner" && Questions.semesterText.contains("SEMESTER ABROAD"))
    {
      if(Questions.semesterLength <= Questions.totalSemester)
      {
        //Question No 84
        return educationtwooptionContainer("","Education","Where did you go to semester abroad no. ${Questions.semesterLength}?","Destination no. ${Questions.semesterLength}",["Germany","Abroad"],430.0,"",Questions.semesterText);
      }
      else
      {
        //Question No 94
        return educationmultipleoptionsContainer("","Education","Have you had additional costs due to travelling to semesters abroad?","Additional costs",["Parking","Baggage","Toll","Business Calls","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png"],220.0,"No",Questions.trainingText);
      }
    }



    //Answer No 94
    else if(widget.CheckCompleteQuestion =="Have you had additional costs due to travelling to semesters abroad?" && widget.CheckQuestion == "Additional costs")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Parking")
        {
          //Same as unpaid internship/excursion
          //Question No 62
          return educationcalculationContainer("","Education","How much did you pay for parking?","Parking costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Baggage")
        {
          //Same as unpaid internship/excursion
          //Question No 63
          return educationcalculationContainer("","Education","How much did you pay for baggage?","Baggage costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Toll")
        {
          //Same as unpaid internship/excursion
          //Question No 64
          return educationcalculationContainer("","Education","How much did you pay for tolls?","Toll costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Business Calls")
        {
          //Same as unpaid internship/excursion
//Question No 65
          return educationcalculationContainer("","Education","How much did you pay for business calls?","Business call costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Other")
        {
          //Same as unpaid internship/excursion
//Question No 66
          return educationcalculationContainer("","Education","How much did you pay for other costs?","Other costs",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "No")
        {
          //Same as unpaid internship/excursion
          //Question No 10
          return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
        }

      }
    }


    // ====== Semester abroad Ends ====== //

    // ====== Travel Costs End ======


   // ====== Items for education (e.g. computer, office furniture etc.) Starts ======//

    //Answer No 99
    else if(widget.CheckCompleteQuestion =="What kind of items did you buy in 2019 for training no. ${Questions.trainingLength}?" && widget.CheckQuestion == "Item")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Office furniture")
        {
         //Question No 108
          return educationyesnoContainer("","Education","Did you spend more than 952 EUR on any piece of office furniture?","Furniture over 952 EUR",220.0,"",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Computer/laptop")
        {
        //Question No 100
          return educationcalculationContainer("","Education","How much was the computer?","Amount",220.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Computer accessories")
        {
          //Question No 104
          return educationcalculationContainer("","Education","How much did you spend on computer accessories?","Amount",320.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Tools")
        {
          //Question No 105
          return educationcalculationContainer("","Education","How much did you pay for this tool?","Amount",320.0,"calculation",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Other")
        {
//Question No 106
          return educationcalculationContainer("","Education","What kind of items did you buy?","Items",220.0,"calculation",Questions.trainingText);
        }
        else if(widget.CheckAnswer[m] == "None of these")
        {
//Question No 102
        //For No 320.0
          //For rest 220.0
          return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
        }

      }
    }


    //Answer No 100
    else if(widget.CheckCompleteQuestion =="How much was the computer?" && widget.CheckQuestion == "Amount")
    {
      //Question No 101
      return educationdateContainer("","Education","When did you buy the computer?","Purchase date",320.0,"",Questions.trainingText);
    }

    //Answer No 101
    else if(widget.CheckCompleteQuestion =="When did you buy the computer?" && widget.CheckQuestion == "Purchase date")
    {
      //Question No 102
      return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
    }



    //Answer No 104
    else if(widget.CheckCompleteQuestion =="How much did you spend on computer accessories?" && widget.CheckQuestion == "Amount")
    {
      //Question No 102
      return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
    }


    //Answer No 105
    else if(widget.CheckCompleteQuestion =="How much did you pay for this tool?" && widget.CheckQuestion == "Amount")
    {
      //Question No 102
      return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
    }


    //Answer No 106
    else if(widget.CheckCompleteQuestion =="What kind of items did you buy?" && widget.CheckQuestion == "Items")
    {
      //Question No 107
      return educationcalculationContainer("","Education","How much did you spend on the ${Questions.educationTraItem}?","Amount spent",320.0,"calculation",Questions.trainingText);
    }


    //Answer No 107
    else if(widget.CheckCompleteQuestion =="How much did you spend on the ${Questions.educationTraItem}?" && widget.CheckQuestion == "Amount spent")
    {
      //Question No 102
      return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
    }



    // ====== Office Furniture Starts ====== //

    //Answer No 108
    else if(widget.CheckCompleteQuestion =="Did you spend more than 952 EUR on any piece of office furniture?" && widget.CheckQuestion == "Furniture over 952 EUR")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 113
        return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 109
        return educationcalculationContainer("","Education","How many pieces of furnitures cost more than 488 EUR?","Number",430.0,"",Questions.trainingText);
      }

    }


    //Answer No 109
    else if(widget.CheckCompleteQuestion =="How many pieces of furnitures cost more than 488 EUR?" && widget.CheckQuestion == "Number")
    {
         //Question No 110
      return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
    }


    //Answer No 110
    else if(widget.CheckCompleteQuestion =="What kind of furniture did you buy?" && widget.CheckQuestion == "Type")
    {


      if(widget.CheckAnswer[0] == "Desk")
      {
        //Question No 111
        return educationcalculationContainer("","Education","How much was the desk?","Amount desk",220.0,"calculation",Questions.educationExpfurniture);
      }

      else if(widget.CheckAnswer[0] == "Office chair")
      {
       //Question No 114
        return educationcalculationContainer("","Education","How much was the office chair?","Amount office chair",220.0,"calculation",Questions.educationExpfurniture);
      }

      else if(widget.CheckAnswer[0] == "Bookshelf")
      {
//Question No 116
        return educationcalculationContainer("","Education","How much was the bookshelf?","Amount bookshelf",220.0,"calculation",Questions.educationExpfurniture);
      }

      else if(widget.CheckAnswer[0] == "Lamp")
      {
//Question No 118
        return educationcalculationContainer("","Education","How much was the lamp?","Amount lamp",220.0,"calculation",Questions.educationExpfurniture);
      }

      else if(widget.CheckAnswer[0] == "Filing cabinet")
      {
//Question No 120
        return educationcalculationContainer("","Education","How much was the filing cabinet?","Amount filing cabinet",220.0,"calculation",Questions.educationExpfurniture);
      }

      else if(widget.CheckAnswer[0] == "Other")
      {
//Question No 122
         //Ek space ziyada furniture sa pehla lgaya ha kyu ka collision na ho two questions ma yani 122 and 110 ma
        return educationcalculationContainer("","Education","What kind of  furniture did you buy?","Type",220.0,"",Questions.educationExpfurniture);
      }

    }


//Desk Starts //
   //Answer No 111
    else if(widget.CheckCompleteQuestion =="How much was the desk?" && widget.CheckQuestion == "Amount desk")
    {
   //Question No 112
      return educationdateContainer("","Education","When did you buy the desk?","Purchase date",430.0,"",Questions.educationExpfurniture);
    }

    //Answer No 112
    else if(widget.CheckCompleteQuestion =="When did you buy the desk?" && widget.CheckQuestion == "Purchase date")
    {
      if(Questions.expFurnitureLength <= Questions.totalExpFurniture)
        {
          //Question No 110
          return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
        }
        else
          {
          //Question No 113
    //For No 320.0
    //For Yes 220.0
            return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);

          }
    }

//Desk Ends //




    //Office Furniture Starts //
    //Answer No 114
    else if(widget.CheckCompleteQuestion =="How much was the office chair?" && widget.CheckQuestion == "Amount office chair")
    {
      //Question No 115
      return educationdateContainer("","Education","When did you buy the office chair?","Purchase date",430.0,"",Questions.educationExpfurniture);
    }

    //Answer No 115
    else if(widget.CheckCompleteQuestion =="When did you buy the office chair?" && widget.CheckQuestion == "Purchase date")
    {
      if(Questions.expFurnitureLength <= Questions.totalExpFurniture)
      {
        //Question No 110
        return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
      }
      else
      {
        //Question No 113
        return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);

      }
    }

//Office Furniture Ends //



    //Bookshelf Starts //
    //Answer No 116
    else if(widget.CheckCompleteQuestion =="How much was the bookshelf?" && widget.CheckQuestion == "Amount bookshelf")
    {
      //Question No 117
      return educationdateContainer("","Education","When did you buy the bookshelf?","Purchase date",430.0,"",Questions.educationExpfurniture);
    }

    //Answer No 117
    else if(widget.CheckCompleteQuestion =="When did you buy the bookshelf?" && widget.CheckQuestion == "Purchase date")
    {
      if(Questions.expFurnitureLength <= Questions.totalExpFurniture)
      {
        //Question No 110
        return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
      }
      else
      {
        //Question No 113
        return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);

      }
    }

//Bookshelf Ends //



    //Lamp Starts //
    //Answer No 118
    else if(widget.CheckCompleteQuestion =="How much was the lamp?" && widget.CheckQuestion == "Amount lamp")
    {
      //Question No 119
      return educationdateContainer("","Education","When did you buy the lamp?","Purchase date",430.0,"",Questions.educationExpfurniture);
    }

    //Answer No 119
    else if(widget.CheckCompleteQuestion =="When did you buy the lamp?" && widget.CheckQuestion == "Purchase date")
    {
      if(Questions.expFurnitureLength <= Questions.totalExpFurniture)
      {
        //Question No 110
        return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
      }
      else
      {
        //Question No 113
        return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);

      }
    }

//Lamp Ends //


    //Filing cabinet Starts //
    //Answer No 120
    else if(widget.CheckCompleteQuestion =="How much was the filing cabinet?" && widget.CheckQuestion == "Amount filing cabinet")
    {
      //Question No 121
      return educationdateContainer("","Education","When did you buy the filing cabinet?","Purchase date",430.0,"",Questions.educationExpfurniture);
    }

    //Answer No 121
    else if(widget.CheckCompleteQuestion =="When did you buy the filing cabinet?" && widget.CheckQuestion == "Purchase date")
    {
      if(Questions.expFurnitureLength <= Questions.totalExpFurniture)
      {
        //Question No 110
        return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
      }
      else
      {
        //Question No 113
        return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);

      }
    }

//Filing cabinet Ends //




    //Other Starts //

    //Answer No 122
    else if(widget.CheckCompleteQuestion =="What kind of  furniture did you buy?" && widget.CheckQuestion == "Type")
    {
    //Question No 123
      return educationcalculationContainer("","Education","How much did you spent on the ${Questions.educationOtherFurniture}?","Amount",220.0,"calculation",Questions.educationExpfurniture);
    }

    //Answer No 123
    else if(widget.CheckCompleteQuestion =="How much did you spent on the ${Questions.educationOtherFurniture}?" && widget.CheckQuestion == "Amount")
    {
      //Question No 124
      return educationdateContainer("","Education","When did you buy the ${Questions.educationOtherFurniture}?","Purchase date",430.0,"",Questions.educationExpfurniture);
    }

    //Answer No 124
    else if(widget.CheckCompleteQuestion =="When did you buy the ${Questions.educationOtherFurniture}?" && widget.CheckQuestion == "Purchase date")
    {
      if(Questions.expFurnitureLength <= Questions.totalExpFurniture)
      {
        //Question No 110
        return educationdifferentoptionContainer("","Education","What kind of furniture did you buy?","Type",["Desk","Office chair","Bookshelf","Lamp","Filing cabinet","Other"],220.0,"",Questions.educationExpfurniture);
      }
      else
      {
        //Question No 113
        return educationyesnoContainer("","Education","Did you spend less than 952 EUR on any piece of office furniture?","< 952 EUR",220.0,"",Questions.trainingText);

      }
    }

//Other Ends //


    //Answer No 113
    else if(widget.CheckCompleteQuestion =="Did you spend less than 952 EUR on any piece of office furniture?" && widget.CheckQuestion == "< 952 EUR")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 102
        return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 125
        return educationcalculationContainer("","Education","How much did you spend on these items in total?","Total amount",320.0,"calculation",Questions.trainingText);
      }

    }

//Answer No 125
    else if(widget.CheckCompleteQuestion =="How much did you spend on these items in total?" && widget.CheckQuestion == "Total amount")
    {
      //Question No 102
      return educationmultitwoContainer("","Education","Did you buy expensive items in the past few years for your training?","Previous years",["Computer / Laptop","Other expensive items","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0,"No",Questions.trainingText);
    }


    // ====== Office Furniture Ends ====== //





    //Answer No 102
    else if(widget.CheckCompleteQuestion =="Did you buy expensive items in the past few years for your training?" && widget.CheckQuestion == "Previous years")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Computer / laptop")
        {
         //Question No 103
          return educationdateContainer("","Education","When did you buy your computer?","Purchase date",220.0,"",Questions.trainingText);
        }

        else if(widget.CheckAnswer[m] == "Other expensive items")
        {
         //Question No 127
          return educationcalculationContainer("","Education","How much other valuable items for training did you buy in previous years?","Quantity",220.0,"",Questions.trainingText);

        }

        else if(widget.CheckAnswer[m] == "No")
        {
//Question No 126
          return educationyesnoContainer("","Education","Did you have any service costs for your training equipment?","Maintenance costs",220.0,"",Questions.trainingText);
        }

      }
    }


    //Answer No 103
    else if(widget.CheckCompleteQuestion =="When did you buy your computer?" && widget.CheckQuestion == "Purchase date")
    {
      //Question No 126
      return educationyesnoContainer("","Education","Did you have any service costs for your training equipment?","Maintenance costs",220.0,"",Questions.trainingText);
    }



    //Answer No 127
    else if(widget.CheckCompleteQuestion =="How much other valuable items for training did you buy in previous years?" && widget.CheckQuestion == "Quantity")
    {
      //Question No 128
      return educationcalculationContainer("","Education","What items did you purchase for your training?","Items",220.0,"",Questions.equipmentText);
    }

    //Answer No 128
    else if(widget.CheckCompleteQuestion =="What items did you purchase for your training?" && widget.CheckQuestion == "Items")
    {
      //Question No 129
      return educationcalculationContainer("","Education","What can you depreciate for item ${Questions.equipmentName} in 2019?","Amount",220.0,"calculation",Questions.equipmentText);
    }


    //Answer No 129
    else if(widget.CheckCompleteQuestion =="What can you depreciate for item ${Questions.equipmentName} in 2019?" && widget.CheckQuestion == "Amount")
    {
      if(Questions.equipmentLength <= Questions.totalEquipment)
        {
          //Question No 128
          return educationcalculationContainer("","Education","What items did you purchase for your training?","Items",220.0,"",Questions.equipmentText);
        }
        else{
        //Question No 126
        //For No 220.0
        //For Yes 320.0
        return educationyesnoContainer("","Education","Did you have any service costs for your training equipment?","Maintenance costs",220.0,"",Questions.trainingText);
      }
    }



    //Answer No 126
    else if(widget.CheckCompleteQuestion =="Did you have any service costs for your training equipment?" && widget.CheckQuestion == "Maintenance costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Question No 10
        return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
      }

      else if(widget.CheckAnswer[0] == "Yes")
      {
       //Question No 130
        return educationmultitwoContainer("","Education","What costs did you have?","Costs",["Repairs","Dry cleaning"],["images/disabilityoption.png","images/alimonypaidoption.png"],220.0,"",Questions.trainingText);
      }

    }


    //Answer No 130
    else if(widget.CheckCompleteQuestion =="What costs did you have?" && widget.CheckQuestion == "Costs")
    {

      for(int m=0;m<widget.CheckAnswer.length;m++) {

        if(widget.CheckAnswer[m] == "Repairs")
        {
          //Question No 131
          return educationcalculationContainer("","Education","How much did you spend on repairs?","Repair costs",220.0,"calculation",Questions.equipmentText);
        }

        else if(widget.CheckAnswer[m] == "Dry cleaning")
        {
//Question No 132
          return educationcalculationContainer("","Education","How much did you spend on dry cleaning?","Dry cleaning costs",220.0,"calculation",Questions.equipmentText);
        }


      }
    }

    //Answer No 131
    else if(widget.CheckCompleteQuestion =="How much did you spend on repairs?" && widget.CheckQuestion == "Repair costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    //Answer No 132
    else if(widget.CheckCompleteQuestion =="How much did you spend on dry cleaning?" && widget.CheckQuestion == "Dry cleaning costs")
    {
      //Question No 10
      return educationyesnoContainer("","Education","Were the costs reimbursed by your employer or the employment agency?","Reimbursement of costs",220.0,"",Questions.trainingText);
    }

    // ====== Items for education (e.g. computer, office furniture etc.) Ends ======//








    //Answer No 10
    else if(widget.CheckCompleteQuestion =="Were the costs reimbursed by your employer or the employment agency?" && widget.CheckQuestion == "Reimbursement of costs")
    {

      if(widget.CheckAnswer[0] == "No")
      {
        //Yaha multiple hoga dobara
        if(Questions.trainingLength <= Questions.totalTraining)
          {
            //Question No 5
            return educationdifferentoptionContainer("","Education","Which best applies to your training no. ${Questions.trainingLength}?","Kind of training",["Dual studies (job and university)","Vocational training (job and school)","Besides job (e.g. distance learning)","Full time study (university only)","School training","None of the above"],220.0,"",Questions.trainingText);
          }
         else
           {
          return FinishCategory("Education Category", "Family Category");
        }
         }

      else if(widget.CheckAnswer[0] == "Yes")
      {
        //Question No 11
        return educationcalculationContainer("","Education","How much money was reimbursed?","Reimbursed",210.0,"calculation",Questions.trainingText);
      }

    }


    //Answer No 11
    else if(widget.CheckCompleteQuestion =="How much money was reimbursed?" && widget.CheckQuestion == "Reimbursed")
    {
//    Yaha multiple hoga dobara
      if(Questions.trainingLength <= Questions.totalTraining)
      {
        //Question No 5
        return educationdifferentoptionContainer("","Education","Which best applies to your training no. ${Questions.trainingLength}?","Kind of training",["Dual studies (job and university)","Vocational training (job and school)","Besides job (e.g. distance learning)","Full time study (university only)","School training","None of the above"],220.0,"",Questions.trainingText);
      }
      else
      {
        return FinishCategory("Education Category", "Family Category");
      }
    }







    }


  }


  Widget educationyesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationYesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget educationcalculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationCalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

  Widget educationdifferentoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationDifferentOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:430.0,additionalData:AdditionalData,multipleData:MultipleData);
  }


  Widget educationmultipleoptionsContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationMultipleOptionsContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:430.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget educationtwooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationTwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:280.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget educationmultithreeContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationMultiThreeContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:370.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget educationdateContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationDateContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

  Widget educationmultitwoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.educationAnimatedContainer = animatedcontainer;
    return EducationMultiTwoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:320.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

}