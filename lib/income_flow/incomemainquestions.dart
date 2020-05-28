//import 'package:easy_taxx/questions.dart';
import 'package:easy_taxx/show.dart';
import 'package:easy_taxx/livingsituation_flow/container1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/income_flow/payslipcontainer.dart';
import 'package:easy_taxx/income_flow/threeoptioncontainer.dart';
import 'package:easy_taxx/income_flow/datecontainer.dart';
import 'package:easy_taxx/income_flow/addresscontainer.dart';
import 'package:easy_taxx/income_flow/fouroptioncontainer.dart';
import 'package:easy_taxx/income_flow/calculationcontainer.dart';
import 'package:easy_taxx/income_flow/multithreecontainer.dart';
import 'package:easy_taxx/income_flow/yesnocontainer.dart';
import 'package:easy_taxx/income_flow/multipleoptionscontainer.dart';
import 'package:easy_taxx/income_flow/domaincontainer.dart';
import 'package:easy_taxx/income_flow/multipleoptionscontainerno.dart';
import 'package:easy_taxx/income_flow/twooptioncontainer.dart';
import 'package:easy_taxx/income_flow/valuablenamecontainer.dart';
import 'package:easy_taxx/income_flow/valuableownedcontainer.dart';
import 'package:easy_taxx/income_flow/threeoptionpayslipcontainer.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:auto_size_text/auto_size_text.dart';





class IncomeMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  IncomeMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<IncomeMainQuestions> {
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
    print("question length:"+Questions.incomeAnswerShow.length.toString());

    for(k=l;k<Questions.incomeAnswerShow.length;k++)
    {
      print("how manysdsdsd");
      screenHeightbig  = 0.0;
      if(Questions.incomeAnswerShow[k]['identity'] == "You" || Questions.incomeAnswerShow[k]['identity'] == "You & Partner" || Questions.incomeAnswerShow[k]['identity'] == "Partner")
      {
        screenHeight = screenHeight +70.0;
      }
      else if(Questions.incomeAnswerShow[k]['details'] == "")
      {
        screenHeight = screenHeight +60.0;
        detail= true;
      }
      else{
        detailsHeight = Questions.incomeAnswerShow[k]['details'];

        for(l=k;l<Questions.incomeAnswerShow.length;l++)
        {
          if(Questions.incomeAnswerShow[l]['details'] == detailsHeight)
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
    screenHeight = screenHeight + Questions.incomeAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:"+screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;





  }


  void DynamicContainer(){
    hlength=0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i=j;i<Questions.incomeAnswerShow.length;i++) {
      print("value oif i is:"+i.toString());


      print("dat is:"+i.toString());
      //You and your and your partner identity
      if(Questions.incomeAnswerShow[i]['identity'] == "You" || Questions.incomeAnswerShow[i]['identity'] == "You & Partner" || Questions.incomeAnswerShow[i]['identity'] == "Partner")
      {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              height: Questions.incomeAnswerShow[i]['containerheight'],
              width: 450.0,
              child:Text(Questions.incomeAnswerShow[i]['identity'],style: TextStyle(fontSize: 40.0)) ,
            )
        );
      }
      else if(Questions.incomeAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            SingleSmallContainer(currentIndex : i)
//            Container(
//              margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
//              height: Questions.incomeAnswerShow[i]['containerheight'],
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
//                          child:AutoSizeText(Questions.incomeAnswerShow[i]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                      ),
//                      Row(children: <Widget>[
//                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                        Container(
//                            width: 140.0,
//                            // color:Colors.blue,
//                            child:AutoSizeText(Questions.incomeAnswerShow[i]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)
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
      else
      {
        detailOption = Questions.incomeAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for(co = i ; co < Questions.incomeAnswerShow.length; co++)
        {
          if(Questions.incomeAnswerShow[co]['details'] == detailOption) {
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
          if(Questions.incomeAnswerShow[j]['details'] == detailOption && detail == true) {
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
                          Text(Questions.incomeAnswerShow[i]['details'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
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
          if(Questions.incomeAnswerShow[j]['details'] == detailOption && detail == false)
          {
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
//                              child:AutoSizeText(Questions.incomeAnswerShow[j]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
//                          ),
//                          Row(children: <Widget>[
//                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
//                            Container(
//                                width: 140.0,
//                                // color:Colors.blue,
//                                child:AutoSizeText(Questions.incomeAnswerShow[j]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)
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
            title: Text('Income',style: TextStyle(color: Colors.black,fontSize: 14.0),),
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
                      child:
                      Column(

                        children: <Widget>[

//
                          Column(children: dynamicContainer,),
                          IncomeChangeContainer(),

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
  void showDefaultSnackbar(BuildContext context) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text('Hello from the default snackbar'),
        action: SnackBarAction(
          label: 'Click Me',
          onPressed: () {},
        ),
      ),
    );
  }


  Widget IncomeChangeContainer()
  {

    if(Questions.incomeAnswerShow.length == 0)
    {

      //qu.IncomeAddAnswer("You", "","","", [], 60.0);
      //last parameter for next screen container animated size which is 220.0
      //Question No 1
      //for no 340.0
      //for yes 220.0
      return payslipContainer("","Income","Have you received your annual payslip(s) (Lohnsteuerbescheinigung) for 2019?","Annual payslip",340.0);
    }
    else
      {

        //Answer No 1
        if(widget.CheckCompleteQuestion == "Have you received your annual payslip(s) (Lohnsteuerbescheinigung) for 2019?"  && widget.CheckQuestion == "Annual payslip")
          {
            if(widget.CheckAnswer[0] == "No")
              {
                //Question No 2
                //for had ma mini job 220.0
                //for I had no employer 220.0
                //for I dont't know 220.0
                return threeoptionContainer("","Income","Why have you not received your annual payslip (Lohnsteuerbescheinigung) for 2019?","Reason",["Had a mini job","I had no employer","I don't know"],220.0);
              }
             else if(widget.CheckAnswer[0] == "Yes")
               {
                  // we will work later on it
                 //For No 340.0
                 //For yes 220.0
                 //Question No 153
                 return yesnoContainer("","Income","did you receive more than one annual wage statement (e.g: due to different employers)?","More than one payslip",220.0,"");
               }
          }


          //Answer No 2
        else if(widget.CheckCompleteQuestion == "Why have you not received your annual payslip (Lohnsteuerbescheinigung) for 2019?" && widget.CheckQuestion == "Reason")
          {
            if(widget.CheckAnswer[0] == "Had a mini job")
              {
                 //Question No 4
                return dateContainer("","Income","When did you sell the property?","Sale date",220.0);
              }
            else if(widget.CheckAnswer[0] == "I had no employer")
            {
               //Question No 4
              return dateContainer("","Income","When did you sell the property?","Sale date",220.0);
            }
            else if(widget.CheckAnswer[0] == "I don't know")
            {
               //Question No 144
              return yesnoContainer("","Income","Please request the 'Lohnsteuerbescheinigung' from your employer.","Request",220.0,"I have it already");
            }

          }


          //Answer No 144
        else if(widget.CheckCompleteQuestion =="Please request the 'Lohnsteuerbescheinigung' from your employer." && widget.CheckQuestion == "Request")
          {
            //For No 340.0
            //For yes 220.0
            //Question No 153
            return yesnoContainer("","Income","did you receive more than one annual wage statement (e.g: due to different employers)?","More than one payslip",220.0,"");

          }


          //Answer No 153

        else if(widget.CheckCompleteQuestion =="did you receive more than one annual wage statement (e.g: due to different employers)?" && widget.CheckQuestion == "More than one payslip")
        {
          if(widget.CheckAnswer[0] == "No")
          {

            //Question No 145
            return threeoptionpayslipContainer("","Income","Please choose an input method for your payslip no. 1","Reason",["Scan payslip","Upload Document","Enter manually"],220.0,"PAYSLIP 1"); //ispa kaam  krna ha jb backend lga ga
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 154
          return calculationContainer("","Income","How many annual payslips (Lohnsteuerbescheinigung) have you received for the entire year 2019?","Number",340.0,"loop");//ya check kro
          }
        }


        //Answer No 154
        else if(widget.CheckCompleteQuestion =="How many annual payslips (Lohnsteuerbescheinigung) have you received for the entire year 2019?" && widget.CheckQuestion == "Number")
          {
            //Question No 145
            return threeoptionpayslipContainer("","Income","Please choose an input method for your payslip no. 1","Reason",["Scan payslip","Upload Document","Enter manually"],220.0,"PAYSLIP 1"); //ispa kaam  krna ha jb backend lga ga
          }



          //Answer No 145
        else if(widget.CheckCompleteQuestion =="Please choose an input method for your payslip no. 1" && widget.CheckQuestion == "Reason")
        {
          return Text("This work is done later");
        }












          //Answer No 4
           else if(widget.CheckCompleteQuestion == "When did you sell the property?" && widget.CheckQuestion == "Sale date")
             {
               //Question No 5
               //yaha address ka size aga jaka change hoga
               return dateContainer("","Income","When did you buy the property?","Purchase date",220.0);
             }


        //Answer No 5
        else if(widget.CheckCompleteQuestion == "When did you buy the property?" && widget.CheckQuestion == "Purchase date")
        {
          //Question No 6
          return addressContainer("","Income","What is the address of the property?","Property address",390.0);
        }


        //Answer No 6
        else if(widget.CheckCompleteQuestion == "What is the address of the property?" && widget.CheckQuestion == "Property address")
        {
          //Question No 7
          return fouroptionContainer("","Income","Did you use the property as your own residence?","Own residence",["Yes, the entire time","Yes, and also as a third-party rental","Some of the time","Not at all"],220.0);
        }


        //Answer No 7
        else if(widget.CheckCompleteQuestion == "Did you use the property as your own residence?" && widget.CheckQuestion == "Own residence")
        {

          if(widget.CheckAnswer[0] == "Yes, the entire time")
            {
              //Question No 8
                   // Yes the entire time 362.0
                  // Some of the time 220.0
                 // Not at all 220.0
              return calculationContainer("","Income","What is the size of the property in square meters?","Living area",362.0,"");
            }
            else if(widget.CheckAnswer[0] == "Yes, and also as a third-party rental")
              {
            //Question No 9
                return calculationContainer("","Income","How many square meters did you use yourself?","Area used by self",220.0,"");
              }
          else if(widget.CheckAnswer[0] == "Some of the time")
          {
             //Question No 8
            return calculationContainer("","Income","What is the size of the property in square meters?","Living area",362.0,"");
          }
          else if(widget.CheckAnswer[0] == "Not at all")
          {
              //Question No 8
            return calculationContainer("","Income","What is the size of the property in square meters?","Living area",362.0,"");
          }

           }


           //Answer No 8
        else if(widget.CheckCompleteQuestion == "What is the size of the property in square meters?" && widget.CheckQuestion == "Living area")
        {

          if(Questions.residence == "Yes, the entire time") {
            //Question No 10
            //For web domains 220.0
            //For Bitcoins 220.0
            //For other valuables 220.0
            // For None 430.0
            return multithreeContainer("", "Income", "Have you sold any assets?", "Sales", ["Web domains", "Bitcoins", "Other valuables", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png", "images/check.png"], 430.0);
          }
          else{
            //Question No 128
            return dateContainer("","Income","When did you move into the property?","Move in",220.0);
          }
          }


        //Answer No 10
        else if(widget.CheckCompleteQuestion == "Have you sold any assets?" && widget.CheckQuestion == "Sales")
          {
            for(int m=0;m<widget.CheckAnswer.length;m++) {
              if(widget.CheckAnswer[m] == "Web domains") {
                 //Question No 11
                return yesnoContainer("","Income","Have you sold more than one domain?","Multiple domain sales",220.0,"");
              }
              else if(widget.CheckAnswer[m] == "Bitcoins") {
                //Question No 12
                //For no 220.0
                // For yes 430.0
                return yesnoContainer("","Income","Have you owned the Bitcoins for longer than a year?","Owned over a year",220.0,"");
              }
              else if(widget.CheckAnswer[m] == "Other valuables") {
               //Question No 13
                return yesnoContainer("","Income","Have you sold more than one valuable?","Multiple sales",220.0,"");
              }
              else if(widget.CheckAnswer[m] == "None") {
                //Question No 14
                //For Trainer 220.0
                //For Supervisor 220.0
                //For Instructor/ lecturer 220.0
                //For Conductor 220.0
                //For Organist 220.0
                //For Tour guide 220.0
                //For Referee 220.0
                //For Paramedic 220.0
                //For Amateur musician 220.0
                //For other activities for associations 220.0
                //For No 430.0
                return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
              }
            }
          }


          //Answer No 11
        else if(widget.CheckCompleteQuestion == "Have you sold more than one domain?" && widget.CheckQuestion == "Multiple domain sales")
          {
            if(widget.CheckAnswer[0] == "No")
            {

              //Question No 18
              //For No 220.0
              //For yes 430.0
              return yesnoContainer("","Income","Have you owned the domain for longer than a year?","Owned over a year",220.0,"");

            }
            else if(widget.CheckAnswer[0] == "Yes")
              {
                  //Question No 15(value)

                return calculationContainer("","Income","Have you owned 1 domain(s) for longer than a year?","Number of sales",220.0,"loop");

              }
          }


          //Answer No 18
        else if(widget.CheckCompleteQuestion == "Have you owned the domain for longer than a year?" && widget.CheckQuestion == "Owned over a year")
        {
          if(widget.CheckAnswer[0] == "No")
          {

            //Question No 16
            return dateContainer("","Income","When did you buy the domain?","Date of purchase",220.0);

          }
          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 14
            //return yesnoContainer("","Income","Have you owned the Bitcoins for longer than a year?","Annual payslip",220.0);//abhi pata nhi
            return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
          }
        }

          //Answer No 16
        else if(widget.CheckCompleteQuestion == "When did you buy the domain?" && widget.CheckQuestion == "Date of purchase")
        {

          //Question No 17
          return dateContainer("","Income","When did you sell the domain?","Date of sale",430.0);
        }


        //Answer No 17
        else if(widget.CheckCompleteQuestion == "When did you sell the domain?" && widget.CheckQuestion == "Date of sale") {
          //Question No 14
          //return yesnoContainer("","Income","Have you owned the Bitcoins for longer than a year?","Annual payslip",220.0);//abhi pata nhi
          return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
        }






        //Answer No 13
        else if(widget.CheckCompleteQuestion == "Have you sold more than one valuable?" && widget.CheckQuestion == "Multiple sales")
        {
          if(widget.CheckAnswer[0] == "No")
          {

            //Question No 22
            return calculationContainer("","Income","What did you sell?","Valuables",220.0,"");

          }
          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 23

            return calculationContainer("","Income","How many valuable objects did you sell?","Number of sales",220.0,"loop");

          }
        }

        //Answer No 22

        else if(widget.CheckCompleteQuestion == "What did you sell?" && widget.CheckQuestion == "Valuables")
        {

          //Question No 24
          //For Yes 430.0
          //For No 220.0
          return yesnoContainer("","Income","Have you owned the "+ "${Questions.singleValuableName}" +" for longer than one year?","Owned over a year",430.0,"");
        }


//Answer No 24
        else if(widget.CheckCompleteQuestion == "Have you owned the "+ "${Questions.singleValuableName}" +" for longer than one year?" && widget.CheckQuestion == "Owned over a year")
        {
          if(widget.CheckAnswer[0] == "No")
          {

            //Question No 25
            return dateContainer("","Income","When did you purchase the " + "${Questions.singleValuableName}?","Date of purchase",220.0);

          }
          else if(widget.CheckAnswer[0] == "Yes")
          {
            print("This container");
            //Question No 14
            //return yesnoContainer("","Income","Have you owned the Bitcoins for longer than a year?","Annual payslip",220.0);//abhi pata nhi
            return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
          }
        }


        //Answer No 25
        else if(widget.CheckCompleteQuestion == "When did you purchase the " + "${Questions.singleValuableName}?" && widget.CheckQuestion == "Date of purchase")
        {

          //Question No 26
          return dateContainer("","Income","When did you sell the " + "${Questions.singleValuableName}?","Date of sale",430.0);
        }

        //Answer No 26
        else if(widget.CheckCompleteQuestion == "When did you sell the " + "${Questions.singleValuableName}?" && widget.CheckQuestion == "Date of sale") {

          return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
        }





        //Answer No 23 start
        else if((widget.CheckCompleteQuestion == "How many valuable objects did you sell?" && widget.CheckQuestion == "Number of sales") || Questions.valuableLength > 0) {
          print("Answer valuable is:"+widget.CheckAnswer[0].toString());
          print("Total valuable is:"+Questions.totalValuable.toString());
          if(widget.CheckQuestion == "Number of sales")
          {
            //Questions.domainLength += 1;
            //Question No 147
            return valuablenameContainer("", "Income", "Valuable no. "+ Questions.valuableLength.toString()+  ": What did you sell?", "Valuable no. "+Questions.valuableLength.toString(), 220.0,);
          }

          else if(widget.CheckCompleteQuestion == "Valuable no. "+ Questions.valuableLength.toString()+  ": What did you sell?" && widget.CheckQuestion == "Valuable no. "+Questions.valuableLength.toString() )
            {
              //Question No 148
              return valuableownedContainer("", "Income", "Have you owned the "+Questions.singleValuableName +  " for longer than one year?", "Owned over a year", 220.0, "VALUABLE " + Questions.valuableLength.toString()); //abhi pata nhi
            }


          else if(widget.CheckAnswer[0] == "Yes")
          {

            print("Valuable length is:" + Questions.valuableLength.toString());

            if (Questions.valuableLength <= Questions.totalValuable) {
              print("Valuable length is:" + Questions.valuableLength.toString());
              //Question No 147
              return valuablenameContainer("", "Income", "Valuable no. "+ Questions.valuableLength.toString()+  ": What did you sell?", "Valuable no. "+Questions.valuableLength.toString(), 220.0,);

            }

            else{

              //Question No 14
              return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);

            }

          }

          else if(widget.CheckAnswer[0] == "No")
          {
            //Question No 149
            return dateContainer("","Income","When did you purchase the "+ Questions.singleValuableName + " ?","Purchase date",220.0);
          }


          else if(widget.CheckQuestion == "Purchase date")
          {
            //Question No 150.0
            return dateContainer("","Income","When did you sell the "+ Questions.singleValuableName + " ?","Date of sale",220.0);
          }

          else if(widget.CheckQuestion == "Date of sale")
          {

            if (Questions.valuableLength <= Questions.totalValuable) {
              print("Doman length is:" + Questions.domainLength.toString());
              //Question No 147
              return valuablenameContainer("", "Income", "Valuable no. "+ Questions.valuableLength.toString()+  ": What did you sell?", "Valuable no. "+Questions.valuableLength.toString(), 220.0,);
              //return domainContainer("", "Income", "Have you owned "+Questions.domainLength.toString()+  " domain(s) for longer than a year?", "For " + Questions.domainLength.toString() + " Years", 220.0, "SALE " + Questions.domainLength.toString()); //abhi pata nhi
            }

            else{
              //Question No 14
              //return yesnoContainer("","Income","Have you owned the Bitcoins for longer than a year?","Annual payslip",220.0);//abhi pata nhi
              return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);

            }
          }



        }

        //Answer No 23 end





        //Answer No 15(Value)
       else if((widget.CheckCompleteQuestion == "Have you owned 1 domain(s) for longer than a year?" && widget.CheckQuestion == "Number of sales") || Questions.domainLength > 0) {

         if(widget.CheckQuestion == "Number of sales")
           {
             //Questions.domainLength += 1;
             //Question No 15
             return domainContainer("", "Income", "Have you owned "+Questions.domainLength.toString()+  " domain(s) for longer than a year?", "For " + "${Questions.domainLength}" + " Years", 220.0, "SALE " + Questions.domainLength.toString()); //abhi pata nhi
           }


               else if(widget.CheckAnswer[0] == "Yes")
                 {

                   print("Doman length is:" + Questions.domainLength.toString());

                if (Questions.domainLength <= Questions.totalDomain) {
                 print("Doman length is:" + Questions.domainLength.toString());
                 //Question No 15
                 return domainContainer("", "Income", "Have you owned "+Questions.domainLength.toString()+  " domain(s) for longer than a year?", "For " + "${Questions.domainLength}" + " Years", 220.0, "SALE " + Questions.domainLength.toString()); //abhi pata nhi
               }

               else{
                 //Question No 14
                  return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);

               }

                 }

               else if(widget.CheckAnswer[0] == "No")
                 {
                   //Question No 16
                   return dateContainer("","Income","When did you buy the domain?","Purchase date domain",220.0);
                 }


             else if(widget.CheckQuestion == "Purchase date domain")
               {
                 return dateContainer("","Income","When did you sell the domain?","Date of sale: domain",220.0);
               }

         else if(widget.CheckQuestion == "Date of sale: domain")
         {
           //Questions.domainLength += 1;
           print("oh date sale domain"+Questions.totalDomain.toString());
           print("oh date sale domain"+Questions.domainLength.toString());


           if (Questions.domainLength <= Questions.totalDomain) {
             print("Doman length is:" + Questions.domainLength.toString());
             //Question No 15
             return domainContainer("", "Income", "Have you owned "+Questions.domainLength.toString()+  " domain(s) for longer than a year?", "For " + "${Questions.domainLength}" + " Years", 220.0, "SALE " + Questions.domainLength.toString()); //abhi pata nhi
             //return domainContainer("", "Income", "Have you owned "+Questions.domainLength.toString()+  " domain(s) for longer than a year?", "For " + Questions.domainLength.toString() + " Years", 220.0, "SALE " + Questions.domainLength.toString()); //abhi pata nhi
           }

           else{
             //Question No 14
             //return yesnoContainer("","Income","Have you owned the Bitcoins for longer than a year?","Annual payslip",220.0);//abhi pata nhi
             return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);

           }
         }



        }
        //Answer No(15) value end





        //Answer No 12
        else if(widget.CheckCompleteQuestion == "Have you owned the Bitcoins for longer than a year?" && widget.CheckQuestion == "Owned over a year")
        {
          if(widget.CheckAnswer[0] == "No")
          {

            //Question No 20
            return dateContainer("","Income","When did you purchase the Bitcoins?","Date of purchase",220.0);

          }
          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 14
            return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
          }
        }

        //Answer No 20
        else if(widget.CheckCompleteQuestion == "When did you purchase the Bitcoins?" && widget.CheckQuestion == "Date of purchase")
        {

          //Question No 21
          return dateContainer("","Income","When did you sell the Bitcoins?","Date of sale",430.0);
        }


        //Answer No 21
        else if(widget.CheckCompleteQuestion == "When did you sell the Bitcoins?" && widget.CheckQuestion == "Date of sale")
        {

          //Question No 14
          return multioptionsContainerNo("","Income","Did you have income from certain secondary activities?","Secondary activities",["Trainer","Supervisor","Instructor / lecturer","Conductor","Organist","Tour guide","Referee","Paramedic","Amateur musician","Other activities for associations","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png"],220.0);
        }


        //Answer No 14
        else if(widget.CheckCompleteQuestion == "Did you have income from certain secondary activities?" && widget.CheckQuestion == "Secondary activities")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Trainer") {
              //Question 28 will come
              return calculationContainer("","Income","How much did you make as a trainer?","Income trainer",220.0,"calculation");

            }

            else if(widget.CheckAnswer[m] == "Supervisor") {
             //Question 30 will come
              return calculationContainer("","Income","How much did you make as a care worker?","Income care worker",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Instructor / lecturer") {
            //Question 41 will come
              return calculationContainer("","Income","How much did you make as an instructor?","Income instructor",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Conductor") {
              //Question 43 will come
              return calculationContainer("","Income","How much did you make as a conductor?","Income conductor",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Organist") {
              //Question 45 will come
              return calculationContainer("","Income","How much did you make as an organist?","Income organist",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Tour guide") {
              //Question 47 will come
              return calculationContainer("","Income","How much did you make as a tour guide?","Income tour guide",220.0,"calculation");

            }

            else if(widget.CheckAnswer[m] == "Referee") {
              //Question 49 will come
              return calculationContainer("","Income","How much did you make as a referee?","Income as referee",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Paramedic") {
              //Question 51 will come
              return calculationContainer("","Income","How much did you make as a paramedic?","Income paramedic",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Amateur musician") {
              //Question 53 will come
              return calculationContainer("","Income","How much did you make as a musician?","Income musician",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Other activities for associations") {
              //Question 55 will come
              return calculationContainer("","Income","What kind of voluntary work did you participate in?","Kind of work",220.0,"");
            }

            else if(widget.CheckAnswer[m] == "No") {

              //Question No 27

              //For commission 220.0
              //For rental of movable assests 220.0
              //for post-contractual restraint 220.0
              //for other services 220.0
              //for No 430.0

              return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
            }


          }
        }

        //Now Secondary Services Flow Start

        //Trainer Starts
        //Answer No 28
        else if(widget.CheckCompleteQuestion == "How much did you make as a trainer?" && widget.CheckQuestion == "Income trainer")
        {

          //Question No 29
          return calculationContainer("","Income","What costs did you have due to your work as a trainer?","Costs trainer",430.0,"calculation");
        }

        //Answer No 29

        else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as a trainer?" && widget.CheckQuestion == "Costs trainer")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }
        //Trainer Ends



        //Care worker Starts
        //Answer No 30
        else if(widget.CheckCompleteQuestion == "How much did you make as a care worker?" && widget.CheckQuestion == "Income care worker")
        {

          //Question No 40
          return calculationContainer("","Income","What costs did you have due to your work as a care worker?","Costs care worker",430.0,"calculation");
        }


        //Answer No 40
        else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as a care worker?" && widget.CheckQuestion == "Costs care worker")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }

     //Care worker Ends



        //Instructor Starts
        //Answer No 41
        else if(widget.CheckCompleteQuestion == "How much did you make as an instructor?" && widget.CheckQuestion == "Income instructor")
        {

          //Question No 42
          return calculationContainer("","Income","What costs did you incur as an instructor?","Costs instructor",430.0,"calculation");
        }


        //Answer No 42
        else if(widget.CheckCompleteQuestion == "What costs did you incur as an instructor?" && widget.CheckQuestion == "Costs instructor")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }

        //Instructor Ends



    //Conductor Starts
  //Answer No 43
  else if(widget.CheckCompleteQuestion == "How much did you make as a conductor?" && widget.CheckQuestion == "Income conductor")
    {

    //Question No 44
    return calculationContainer("","Income","What costs did you have due to our work as a conductor?","Costs conductor",430.0,"calculation");
    }


    //Answer No 44
    else if(widget.CheckCompleteQuestion == "What costs did you have due to our work as a conductor?" && widget.CheckQuestion == "Costs conductor")
    {

    //Question No 27
    return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
    }

    //Conductor Ends



        //Organist Starts
        //Answer No 45
        else if(widget.CheckCompleteQuestion == "How much did you make as an organist?" && widget.CheckQuestion == "Income organist")
        {

          //Question No 46
          return calculationContainer("","Income","What costs did you have due to your work as an organist?","Costs organist",430.0,"calculation");
        }


        //Answer No 46
        else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as an organist?" && widget.CheckQuestion == "Costs organist")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }

        //Organist Ends




        //tour guide Starts
                //Answer No 47
                else if(widget.CheckCompleteQuestion == "How much did you make as a tour guide?" && widget.CheckQuestion == "Income tour guide")
                {

                  //Question No 48
                  return calculationContainer("","Income","What costs did you have due to your work as a tour guide?","Costs tour guide",430.0,"calculation");
                }


                //Answer No 48
                else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as a tour guide?" && widget.CheckQuestion == "Costs tour guide")
                {

                  //Question No 27
                  return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
                }

                //tour guide Ends



        //referee Starts
        //Answer No 49
        else if(widget.CheckCompleteQuestion == "How much did you make as a referee?" && widget.CheckQuestion == "Income as referee")
        {

          //Question No 50
          return calculationContainer("","Income","What costs did you have due to your work as a referee?","Costs referee",430.0,"calculation");
        }


        //Answer No 50
        else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as a referee?" && widget.CheckQuestion == "Costs referee")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }

        //referee Ends



        //paramedic Starts
        //Answer No 51
        else if(widget.CheckCompleteQuestion == "How much did you make as a paramedic?" && widget.CheckQuestion == "Income paramedic")
        {

          //Question No 52
          return calculationContainer("","Income","What costs did you have due to your work as a paramedic?","Costs paramedic",430.0,"calculation");
        }


        //Answer No 52
        else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as a paramedic?" && widget.CheckQuestion == "Costs paramedic")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }

        //paramedic Ends




    //musician Starts
  //Answer No 53
  else if(widget.CheckCompleteQuestion == "How much did you make as a musician?" && widget.CheckQuestion == "Income musician")
    {

    //Question No 54
    return calculationContainer("","Income","What costs did you have due to your work as a musician?","Costs musician",430.0,"calculation");
    }


    //Answer No 54
    else if(widget.CheckCompleteQuestion == "What costs did you have due to your work as a musician?" && widget.CheckQuestion == "Costs musician")
    {

    //Question No 27
    return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
    }

    //musician Ends



        //voluntary work Starts
        //Answer No 55
        else if(widget.CheckCompleteQuestion == "What kind of voluntary work did you participate in?" && widget.CheckQuestion == "Kind of work")
        {

          //Question No 56
          return calculationContainer("","Income","How much did you make from voluntary work?","Amount",220.0,"calculation");
        }

         //Answer No 56
        else if(widget.CheckCompleteQuestion == "How much did you make from voluntary work?" && widget.CheckQuestion == "Amount")
        {

          //Question No 57
          return calculationContainer("","Income","What costs did you have due to voluntary work?","Costs voluntary work",430.0,"calculation");
        }


        //Answer No 57
        else if(widget.CheckCompleteQuestion == "What costs did you have due to voluntary work?" && widget.CheckQuestion == "Costs voluntary work")
        {

          //Question No 27
          return multioptionsContainerNo("","Income","Did you receive any income for other services?","Other income",["Commission","Rental of movable assets","Post-contractual restraint","Other services","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
        }

        //voluntary work Ends

        //Now Secondary Services Flow End


        //Answer No 27
        else if(widget.CheckCompleteQuestion == "Did you receive any income for other services?" && widget.CheckQuestion == "Other income")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Commission") {
            //Question No 58
              return calculationContainer("","Income","How much did you make from commissions?","Income commission",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Rental of movable assets") {
              //Question No 60
              return calculationContainer("","Income","How much did you make from movable assets (leasing)?","Income leasing",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Post-contractual restraint") {
              //Question No 62
              return calculationContainer("","Income","How much compensation did you receive due to a restraint or non-competition clause?","Amount",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Other services") {
//Question No 62
              return calculationContainer("","Income","What kind of other services did you receive?","Kind of other services",220.0,"");
            }

            else if(widget.CheckAnswer[m] == "No") {
              //Question No 67
              return multioptionsContainerNo("","Income","Did you receive any of the following payments?","Compensation payment",["Unemployment benefits","Parental allowance","Sick pay","Sick pay for children","Maternity pay","Unemployment assistance","Insolvency allowance","Pension about benefits related to ‘Bundesversogungsgesetz’","Payments related to ‘Infektionsschutzgesetz’","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);
            }
          }
        }

        //Now Other Services Flow Start

//commission Starts
        //Answer No 58
        else if(widget.CheckCompleteQuestion == "How much did you make from commissions?" && widget.CheckQuestion == "Income commission")
        {

          //Question No 59
          return calculationContainer("","Income","What costs did you have related to earnings from the commission?","Costs commission",430.0,"calculation");
        }


        //Answer No 59
        else if(widget.CheckCompleteQuestion == "What costs did you have related to earnings from the commission?" && widget.CheckQuestion == "Costs commission")
        {
           //Question No 67
          return multioptionsContainerNo("","Income","Did you receive any of the following payments?","Compensation payment",["Unemployment benefits","Parental allowance","Sick pay","Sick pay for children","Maternity pay","Unemployment assistance","Insolvency allowance","Pension about benefits related to ‘Bundesversogungsgesetz’","Payments related to ‘Infektionsschutzgesetz’","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);

        }

        //commission Ends



        //Rental of movable assets Starts
        //Answer No 60
        else if(widget.CheckCompleteQuestion == "How much did you make from movable assets (leasing)?" && widget.CheckQuestion == "Income leasing")
        {

          //Question No 61
          return calculationContainer("","Income","What costs did you have related to the movable assets (leasing)?","Costs leasing",430.0,"calculation");
        }


        //Answer No 61
        else if(widget.CheckCompleteQuestion == "What costs did you have related to the movable assets (leasing)?" && widget.CheckQuestion == "Costs leasing")
        {
          //Question No 67
          return multioptionsContainerNo("","Income","Did you receive any of the following payments?","Compensation payment",["Unemployment benefits","Parental allowance","Sick pay","Sick pay for children","Maternity pay","Unemployment assistance","Insolvency allowance","Pension about benefits related to ‘Bundesversogungsgesetz’","Payments related to ‘Infektionsschutzgesetz’","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);

        }

        //Rental of movable assets Ends




        //Rental of Post-contractual restraint Starts
        //Answer No 62
        else if(widget.CheckCompleteQuestion == "How much compensation did you receive due to a restraint or non-competition clause?" && widget.CheckQuestion == "Amount")
        {

          //Question No 63
          return calculationContainer("","Income","What costs did you have due to post-contractual restraint?","Costs",430.0,"calculation");
        }


        //Answer No 63
        else if(widget.CheckCompleteQuestion == "What costs did you have due to post-contractual restraint?" && widget.CheckQuestion == "Costs")
        {
          //Question No 67
          return multioptionsContainerNo("","Income","Did you receive any of the following payments?","Compensation payment",["Unemployment benefits","Parental allowance","Sick pay","Sick pay for children","Maternity pay","Unemployment assistance","Insolvency allowance","Pension about benefits related to ‘Bundesversogungsgesetz’","Payments related to ‘Infektionsschutzgesetz’","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);

        }

        //Rental of Post-contractual restraint Ends




        //Other services Starts
        //Answer No 64
        else if(widget.CheckCompleteQuestion == "What kind of other services did you receive?" && widget.CheckQuestion == "Kind of other services")
        {

          //Question No 65
          return calculationContainer("","Income","How much money did you receive from ${Questions.serviceName}?","Amount earnings",220.0,"calculation");
        }

        //Answer No 65
        else if(widget.CheckCompleteQuestion == "How much money did you receive from ${Questions.serviceName}?" && widget.CheckQuestion == "Amount earnings")
        {

          //Question No 66
          return calculationContainer("","Income","What costs did you have due to ${Questions.serviceName}?","Costs",430.0,"calculation");
        }


        //Answer No 63
        else if(widget.CheckCompleteQuestion == "What costs did you have due to ${Questions.serviceName}?" && widget.CheckQuestion == "Costs")
        {
          //Question No 67
          return multioptionsContainerNo("","Income","Did you receive any of the following payments?","Compensation payment",["Unemployment benefits","Parental allowance","Sick pay","Sick pay for children","Maternity pay","Unemployment assistance","Insolvency allowance","Pension about benefits related to 'Bundesversogungsgesetz'","Payments related to 'Infektionsschutzgesetz'","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],220.0);

        }

        //Other services Ends

//Now Other Services Flow End



    //Answer No 9
        else if(widget.CheckCompleteQuestion == "How many square meters did you use yourself?" && widget.CheckQuestion == "Area used by self")
        {

          //Question No 127
          return calculationContainer("","Income","How many square meters were used for other purposes?","Area used by others",220.0,"");
        }



        //Answer No 127
        else if(widget.CheckCompleteQuestion == "How many square meters were used for other purposes?" && widget.CheckQuestion == "Area used by others")
        {

          //Question No 128
          return dateContainer("","Income","When did you move into the property?","Move in",220.0);
        }


        //Answer No 128
        else if(widget.CheckCompleteQuestion == "When did you move into the property?" && widget.CheckQuestion == "Move in")
        {

          //Question No 129
          return dateContainer("","Income","When did you move out the property?","Move out",220.0);
        }


        //Answer No 129
        else if(widget.CheckCompleteQuestion == "When did you move out the property?" && widget.CheckQuestion == "Move out")
        {

          //Question No 130
          return dateContainer("","Income","When did someone else move into the property?","Move in (someone else)",220.0);
        }

        //Answer No 130
        else if(widget.CheckCompleteQuestion == "When did someone else move into the property?" && widget.CheckQuestion == "Move in (someone else)")
        {

          //Question No 131
          return dateContainer("","Income","When did someone else move out of the property?","Move out (someone else)",220.0);
        }

        //Answer No 131
        else if(widget.CheckCompleteQuestion == "When did someone else move out of the property?" && widget.CheckQuestion == "Move out (someone else)")
        {

          //Question No 132
          if(Questions.residence == "Yes, and also as a third-party rental"){
            //Question No 132
            return calculationContainer("","Income","At what price did you sell the property?","Sale price",220.0,"calculation");
          }
          else
            {
              //Question No 134
              return twooptionContainer("","Income","When was the property built?","Completion date",["Before 01.01.1925","After 31.12.1924"],220.0);
            }

        }


        //Answer No 132
        else if(widget.CheckCompleteQuestion == "At what price did you sell the property?" && widget.CheckQuestion == "Sale price")
        {

          //Question No 133
          return calculationContainer("","Income","What were the manufacturing or acquisition costs of the property?","Purchase price",280.0,"calculation");
        }


        //Answer No 133
        else if(widget.CheckCompleteQuestion == "What were the manufacturing or acquisition costs of the property?" && widget.CheckQuestion == "Purchase price")
        {

          //Question No 134
          return twooptionContainer("","Income","When was the property built?","Completion date",["Before 01.01.1925","After 31.12.1924"],220.0);
        }


        //Answer No 134
        else if(widget.CheckCompleteQuestion == "When was the property built?" && widget.CheckQuestion == "Completion date")
        {
          if(widget.CheckAnswer[0] == "Before 01.01.1925") {
            //For No 220.0
            //For yes 430.0
            //Question No 135
            return yesnoContainer("", "Income", "We have calculated €150.00 as the depreciation amount. Is that correct?","Depreciation",220.0,"");
          }
          else if(widget.CheckAnswer[0] == "After 31.12.1924") {

            //For No 220.0
            //For yes 430.0
            //Question No 135
            return yesnoContainer("", "Income", "We have calculated €150.00 as the depreciation amount. Is that correct?","Depreciation",220.0,"");
          }

        }


        //After cs I will do that
        //Answer No 135
        else if(widget.CheckCompleteQuestion == "We have calculated €150.00 as the depreciation amount. Is that correct?" && widget.CheckQuestion == "Depreciation")
        {
          if(widget.CheckAnswer[0] == "No") {
            //Question No 136
            return calculationContainer("", "Income", "How much depreciation did you declare?","Depreciation amount",430.0,"calculation");
          }
          else if(widget.CheckAnswer[0] == "Yes") {
           //Question No 137
            //For None 362.0
            //For rest of options 220.0
            return multioptionsContainerNo("","Income","What other costs did you have relating to the sale of property?","Other costs",["Notary costs","Real estate transfer tax","Advertising costs","Bank costs","Broker fees","Loan interest","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png"],220.0);
          }

        }



        //Answer No 136

        else if(widget.CheckCompleteQuestion == "How much depreciation did you declare?" && widget.CheckQuestion == "Depreciation amount")
        {
          //Question No 137
          return multioptionsContainerNo("","Income","What other costs did you have relating to the sale of property?","Other costs",["Notary costs","Real estate transfer tax","Advertising costs","Bank costs","Broker fees","Loan interest","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png"],220.0);
        }



        //Answer No 137
        else if(widget.CheckCompleteQuestion == "What other costs did you have relating to the sale of property?" && widget.CheckQuestion == "Other costs")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Notary costs") {
              //Question No 138
              return calculationContainer("","Income","How much did you spend on notaries?","Notary costs",362.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Real estate transfer tax") {
             //Question No 139
              return calculationContainer("","Income","How much did you spend on real estate transfer tax?","Real estate transfer tax costs",362.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Advertising costs") {
            //Question No 140
              return calculationContainer("","Income","How much did you spend on advertising?","Advertising costs",362.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Bank costs") {
               //Question No 141
              return calculationContainer("","Income","How much dd you spend on bank costs?","Bank costs",362.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Broker fees") {
             //Question No 142
              return calculationContainer("","Income","How much did you spend on broker fees?","Broker fees",362.0,"calculation");
            }
            else if(widget.CheckAnswer[m] == "Loan interest") {
              //Question No 143
              return calculationContainer("","Income","How much did you spend on loan interest?","Loan interest",362.0,"calculation");
            }
            else if(widget.CheckAnswer[m] == "None") {
              //Question No 10
              return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);

            }
          }
        }


        //Answer No 138
        else if(widget.CheckCompleteQuestion == "How much did you spend on notaries?" && widget.CheckQuestion == "Notary costs")
        {

          //Question No 10
          return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);
        }

        //Answer No 139
        else if(widget.CheckCompleteQuestion == "How much did you spend on real estate transfer tax?" && widget.CheckQuestion == "Real estate transfer tax costs")
        {

          //Question No 10
          return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);
        }

        //Answer No 140
        else if(widget.CheckCompleteQuestion == "How much did you spend on advertising?" && widget.CheckQuestion == "Advertising costs")
        {

          //Question No 10
          return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);
        }


        //Answer No 141
        else if(widget.CheckCompleteQuestion == "How much dd you spend on bank costs?" && widget.CheckQuestion == "Bank costs")
        {

          //Question No 10
          return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);
        }

        //Answer No 142
        else if(widget.CheckCompleteQuestion == "How much did you spend on broker fees?" && widget.CheckQuestion == "Broker fees")
        {

          //Question No 10
          return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);
        }


        //Answer No 143
        else if(widget.CheckCompleteQuestion == "How much did you spend on loan interest?" && widget.CheckQuestion == "Loan interest")
        {

          //Question No 10
          return multithreeContainer("","Income","Have you sold any assets?","Sales",["Web domains","Bitcoins","Other valuables","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],430.0);
        }





        //Answer No 67

        //Following Payments start
        else if(widget.CheckCompleteQuestion == "Did you receive any of the following payments?" && widget.CheckQuestion == "Compensation payment")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Unemployment benefits") {
              //Question 71 will come
              return calculationContainer("","Income","How much did you receive in unemployment benefits?","Unemployment benefits",220.0,"calculation");

            }

            else if(widget.CheckAnswer[m] == "Parental allowance") {
              //Question 120 will come
              return calculationContainer("","Income","How much parental allowance did you get?","Parental allowance",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Sick pay") {
              //Question 83 will come
              return calculationContainer("","Income","How much sick pay did you receive?","Sick pay",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Sick pay for children") {
              //Question 89 will come
              return calculationContainer("","Income","How much sick pay did you get for your child?","Sick pay for children",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Maternity pay") {
              //Question 96 will come
              return calculationContainer("","Income","How much maternity pay did you receive?","Maternity pay",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Unemployment assistance") {
              //Question 100 will come
              return calculationContainer("","Income","How much employment assistance did you receive?","Unemployment assistance",220.0,"calculation");

            }

            else if(widget.CheckAnswer[m] == "Insolvency allowance") {
              //Question 74 will come
              return calculationContainer("","Income","How much insolvency allowance did you receive?","Amount",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Pension about benefits related to 'Bundesversogungsgesetz'") {
              //Question 110 will come
              return calculationContainer("","Income","How much compensation did you receive?","Amount",220.0,"calculation");
            }

            else if(widget.CheckAnswer[m] == "Payments related to 'Infektionsschutzgesetz'") {
              //Question 106 will come
              return calculationContainer("","Income","How much did you receive in compensation for Infektionsschutzgesetz?","Amount",220.0,"calculation");
            }
            else if(widget.CheckAnswer[m] == "No") {

              if(Questions.alimonyReceivedIncome == "Alimony received")
              {
                //Question No 144
                return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
              }
              else
              {
                return FinishCategory("Income Category","Home Category");
              }



            }


          }
        }


        //Following payments end


        //Answer No 71
        else if(widget.CheckCompleteQuestion == "How much did you receive in unemployment benefits?" && widget.CheckQuestion == "Unemployment benefits")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }


        //Answer No 120
        else if(widget.CheckCompleteQuestion == "How much parental allowance did you get?" && widget.CheckQuestion == "Parental allowance")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }


        //Answer No 83
        else if(widget.CheckCompleteQuestion == "How much sick pay did you receive?" && widget.CheckQuestion == "Sick pay")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }


        //Answer No 89
        else if(widget.CheckCompleteQuestion == "How much sick pay did you get for your child?" && widget.CheckQuestion == "Sick pay for children")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }


        //Answer No 96
        else if(widget.CheckCompleteQuestion == "How much maternity pay did you receive?" && widget.CheckQuestion == "Maternity pay")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }


        //Answer No 100
        else if(widget.CheckCompleteQuestion == "How much employment assistance did you receive?" && widget.CheckQuestion == "Unemployment assistance")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }

        //Answer No 74
        else if(widget.CheckCompleteQuestion == "How much insolvency allowance did you receive?" && widget.CheckQuestion == "Amount")
       {
         if(Questions.alimonyReceivedIncome == "Alimony received")
         {
           //Question No 144
           return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
         }
         else
         {
           return FinishCategory("Income Category","Home Category");
         }
       }



        //Answer No 110
        else if(widget.CheckCompleteQuestion == "How much compensation did you receive?" && widget.CheckQuestion == "Amount")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }


        //Answer No 106
        else if(widget.CheckCompleteQuestion == "How much did you receive in compensation for Infektionsschutzgesetz?" && widget.CheckQuestion == "Amount")
        {
          if(Questions.alimonyReceivedIncome == "Alimony received")
          {
            //Question No 144
            return multithreeContainer("", "Income", "What type of alimony pay did you receive?", "Type of alimony pay", ["Alimony payments", "Compensation payments to prevent a pension rights adjustment", "Payments as part of a pension rights adjustment"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 340.0);
          }
          else
          {
            return FinishCategory("Income Category","Home Category");
          }
        }



        // ====== Alimony Received Starts (Relation) ====== //
        //Answer No 144
        else if(widget.CheckCompleteQuestion == "What type of alimony pay did you receive?" && widget.CheckQuestion == "Type of alimony pay")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {

            if(widget.CheckAnswer[m] == "Alimony payments")
            {
              Questions.typeAlimonyPay = "Alimony payments";
            //Question No 145
              return threeoptionContainer("","Income","Is the paying party deducting these payments as special expenses?","Deductible",["Yes, in full","Yes, in part","No"],220.0);
            }

            else if(widget.CheckAnswer[m] == "Compensation payments to prevent a pension rights adjustment")
            {
              Questions.typeAlimonyPay = "Compensation payments to prevent a pension rights adjustment";
             //Question No 145
              return threeoptionContainer("","Income","Is the paying party deducting these payments as special expenses?","Deductible",["Yes, in full","Yes, in part","No"],220.0);

            }

            else if(widget.CheckAnswer[m] == "Payments as part of a pension rights adjustment")
            {
              Questions.typeAlimonyPay = "Payments as part of a pension rights adjustment";
              //Question No 145
              return threeoptionContainer("","Income","Is the paying party deducting these payments as special expenses?","Deductible",["Yes, in full","Yes, in part","No"],220.0);
            }
          }
        }



        //Answer No 145

         // Alimony payments Starts
        else if(widget.CheckCompleteQuestion == "Is the paying party deducting these payments as special expenses?" && widget.CheckQuestion == "Deductible")
        {
          if(Questions.typeAlimonyPay == "Alimony payments")
          {
            if (widget.CheckAnswer[0] == "Yes, in full")
            {
              Questions.alimonyIncomePayment = "Yes, in full";
              //Question No 146
              return calculationContainer("", "Income", "How much alimony did you receive?", "Amount alimony payments", 220.0, "calculation");
            }

            else if (widget.CheckAnswer[0] == "Yes, in part")
            {
              Questions.alimonyIncomePayment = "Yes, in part";
              //Question No 146
              return calculationContainer("", "Income", "How much alimony did you receive?", "Amount alimony payments", 220.0, "calculation");
            }
            else if (widget.CheckAnswer[0] == "No") {
              return FinishCategory("Income Category", "Home Category");
            }
          }

         else if(Questions.typeAlimonyPay == "Compensation payments to prevent a pension rights adjustment")
          {
            if (widget.CheckAnswer[0] == "Yes, in full")
            {
              Questions.alimonyIncomePayment = "Yes, in full";
              //Question No 150
              return calculationContainer("", "Income", "How much compensation did you receive?", "Compensation amount", 220.0, "calculation");

            }

            else if (widget.CheckAnswer[0] == "Yes, in part")
            {
              Questions.alimonyIncomePayment = "Yes, in part";
              //Question No 150
              return calculationContainer("", "Income", "How much compensation did you receive?", "Compensation amount", 220.0, "calculation");

            }
            else if (widget.CheckAnswer[0] == "No") {
              return FinishCategory("Income Category", "Home Category");
            }
          }


          else if(Questions.typeAlimonyPay == "Payments as part of a pension rights adjustment")
          {
            if (widget.CheckAnswer[0] == "Yes, in full" || widget.CheckAnswer[0] == "Yes, in part")
            {
              //Question No 153
              return calculationContainer("","Income","How much did you receive as part of a pension rights adjustment?","Adjustment amount",220.0,"calculation");

            }

            else if (widget.CheckAnswer[0] == "No") {
              return FinishCategory("Income Category", "Home Category");
            }
          }

        }

        //Answer No 146
        else if(widget.CheckCompleteQuestion == "How much alimony did you receive?" && widget.CheckQuestion == "Amount alimony payments")
        {
          if(Questions.alimonyIncomePayment == "Yes, in full")
            {
          //Question no 147
          return yesnoContainer("", "Income", "Did you have any costs related to receiving these payments?","Related expenses",220.0,"");
            }

           else if(Questions.alimonyIncomePayment == "Yes, in part")
             {
               //Question No 149
               return calculationContainer("","Income","What share of the payments you received was deducted by the other party?","Deductible share",220.0,"calculation");
             }
            }

        //Answer No 149
        else if(widget.CheckCompleteQuestion == "What share of the payments you received was deducted by the other party?" && widget.CheckQuestion == "Deductible share")
        {
          //Question no 147
          return yesnoContainer("", "Income", "Did you have any costs related to receiving these payments?","Related expenses",220.0,"");
        }

        // Alimony payments Ends




        // compensation payments to prevent a pension rights adjustment Starts

        //Answer No 150
        else if(widget.CheckCompleteQuestion == "How much compensation did you receive?" && widget.CheckQuestion == "Compensation amount")
        {
          if(Questions.alimonyIncomePayment== "Yes, in full")
          {
            //Question no 147
            return yesnoContainer("", "Income", "Did you have any costs related to receiving these payments?","Related expenses",220.0,"");
          }

          else if(Questions.alimonyIncomePayment == "Yes, in part")
          {
            //Question No 151
            return calculationContainer("","Income","What share of the payments you received was deducted by the other party? ","Deductible share",220.0,"calculation");
          }
        }


    //Answer No 151
    else if(widget.CheckCompleteQuestion == "What share of the payments you received was deducted by the other party? " && widget.CheckQuestion == "Deductible share")
    {
    //Question no 152
      return calculationContainer("","Income","What share of the payments you received was deducted by the other party?  ","Deductible share",220.0,"calculation");
    }

   //Answer No 152
    else if(widget.CheckCompleteQuestion == "What share of the payments you received was deducted by the other party?  " && widget.CheckQuestion == "Deductible share")
     {
       //Question no 147
       return yesnoContainer("", "Income", "Did you have any costs related to receiving these payments?","Related expenses",220.0,"");
     }


     // compensation payments to prevent a pension rights adjustment Ends


      // Payments as part of a pension rights adjustment Starts

        //Answer No 153
        else if(widget.CheckCompleteQuestion == "How much did you receive as part of a pension rights adjustment?" && widget.CheckQuestion == "Adjustment amount")
        {
          //Question no 147
          return yesnoContainer("", "Income", "Did you have any costs related to receiving these payments?","Related expenses",220.0,"");
        }

        // Payments as part of a pension rights adjustment Ends


        //Answer No 147
        else if(widget.CheckCompleteQuestion == "Did you have any costs related to receiving these payments?" && widget.CheckQuestion == "Related expenses")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            return FinishCategory("Income Category","Home Category");
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 148
            return calculationContainer("","Income","How much did you spend related to receiving the alimony payments?","Amount alimony",220.0,"calculation");
          }

        }

        //Answer No 148
        else if(widget.CheckCompleteQuestion == "How much did you spend related to receiving the alimony payments?" && widget.CheckQuestion == "Amount alimony")
        {
          return FinishCategory("Income Category","Home Category");
        }






        // ====== Alimony Received Ends (Relation) ====== //



      }




  }


//Question No 1
  Widget payslipContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer )
  {
       Questions.incomeAnimatedContainer = animatedcontainer;
       return PaySlipContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:362.0);
  }


  Widget threeoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return ThreeOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:340.0);
  }

  Widget dateContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return DateContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0);

  }

  // is container ki cheeza aga jaka change hogi
  Widget addressContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return AddressContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0);

  }

  Widget fouroptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return FourOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:390.0);
  }


  Widget calculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer,String AdditionalData )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return CalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData);

  }


  Widget multithreeContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return MultiThreeContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:380.0);
  }



  Widget yesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer,String request)
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return YesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,Request:request);
  }

  Widget multioptionsContainerNo(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return MultiOptionsContainerNo(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:430.0);
  }

  Widget domainContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer,String Sale )
  {
    print("hi domain");
    Questions.incomeAnimatedContainer = animatedcontainer;
    return DomainContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,sale:Sale);
  }


  Widget twooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return TwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:280.0);
  }



  Widget valuablenameContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer )
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return ValuableNameContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0);

  }


  Widget valuableownedContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer,String Sale)
  {
    //print("hi domain");
    Questions.incomeAnimatedContainer = animatedcontainer;
    return ValuableOwnedContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,sale:Sale);
  }


  Widget threeoptionpayslipContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption, double animatedcontainer, String payslipno)
  {
    Questions.incomeAnimatedContainer = animatedcontainer;
    return ThreeOptionPaySlipContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:340.0,PaySlipNo:payslipno);
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
            Questions.incomeAnswerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IncomeMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
            }));
          }

          else {
            answerSubList = Questions.incomeAnswerShow.sublist(0, currentIndex);
            print("Answer sub list:$answerSubList");
            Questions.incomeAnswerShow = [];
            Questions.incomeAnswerShow.addAll(answerSubList);

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IncomeMainQuestions(CheckCompleteQuestion : Questions.incomeAnswerShow[currentIndex-1]['completequestion'],CheckQuestion : Questions.incomeAnswerShow[currentIndex-1]['question'],CheckAnswer : [Questions.incomeAnswerShow[currentIndex-1]['answer'][0]]);
            }));
          }





        },
        child:Container(
          margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
          height: Questions.incomeAnswerShow[currentIndex]['containerheight'],
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
                      child:AutoSizeText(Questions.incomeAnswerShow[currentIndex]['question'],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                  ),
                  Row(children: <Widget>[
                    //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                    Container(
                        width: 140.0,
                        // color:Colors.blue,
                        child:AutoSizeText(Questions.incomeAnswerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

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
            Questions.incomeAnswerShow = [];

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IncomeMainQuestions(CheckCompleteQuestion : "",CheckQuestion : "",CheckAnswer : []);
            }));
          }

          else {
            answerSubList = Questions.incomeAnswerShow.sublist(0, currentIndex);
            print("Answer sub list:$answerSubList");
            Questions.incomeAnswerShow = [];
            Questions.incomeAnswerShow.addAll(answerSubList);

            Navigator.of(context).pop();
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return IncomeMainQuestions(CheckCompleteQuestion : Questions.incomeAnswerShow[currentIndex-1]['completequestion'],CheckQuestion : Questions.incomeAnswerShow[currentIndex-1]['question'],CheckAnswer : [Questions.incomeAnswerShow[currentIndex-1]['answer'][0]]);
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
                        child:AutoSizeText(Questions.incomeAnswerShow[currentIndex]['question'],style: TextStyle(color: Colors.grey),minFontSize:14.0,maxLines: 1,overflow: TextOverflow.ellipsis,)
                    ),
                    Row(children: <Widget>[
                      //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                      Container(
                          width: 140.0,
                          // color:Colors.blue,
                          child:AutoSizeText(Questions.incomeAnswerShow[currentIndex]['answer'][0],textAlign: TextAlign.end,minFontSize: 14.0,maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,color:Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),)

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




