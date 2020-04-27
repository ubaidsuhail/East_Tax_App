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
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.answerShow[i]['containerheight'],
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
                      Text(Questions.answerShow[i]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Text(Questions.answerShow[i]['answer'][0]),
                        SizedBox(width: 10.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                          color: Colors.lightBlue,)
                      ],)
                    ],)),
            ));
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
                        padding: EdgeInsets.only(left: 15.0, right: 15.0),
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
                              Text(Questions.answerShow[j]['question'],style: TextStyle(color: Colors.grey),),
                              Row(children: <Widget>[
                                //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                                Text(Questions.answerShow[j]['answer'][0]),
                                SizedBox(width: 10.0,),
                                Icon(Icons.arrow_forward_ios, size: 12.0,
                                  color: Colors.lightBlue,)
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
              }

          }
//per container 5
          dynamicContainer.add(
              Container(
              height:  screenheightList[hlength] ,
              margin: EdgeInsets.only(bottom:2.5,top:2.5,left: 10.0,right: 10.0),
              decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(width: 1.0,color: Colors.lightBlue)
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
            child:Icon(Icons.arrow_back,color: Colors.lightBlue,size: 18.0,)
        ),
        title: Text('Living Situation',style: TextStyle(color: Colors.black,fontSize: 14.0),),
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


Widget ChangeContainer()
{
  if(Questions.answerShow.length ==0)
    {
      //For Single 420.0
      //For Divorced 210.0
      //For Widowed 210.0
      //For Married/ civil partnership 210.0
      //For It's Complicated 210.0
      Questions.LivingCheck = 1;
          return MaritalStatus("",420.0);
    }
    else if(Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ) {
    if (widget.CheckQuestion == "Marital"){
      if (widget.CheckAnswer[0] == "Single") {
        //for Employed 210.0
        // for Minijob (e.g. 450€ basis) 420.0
        // for studying 360.0 for container No 5
        // for training 260 for container No 6
        //for Self-employed unsupported screen 210.0
        //for Own business unsupported 210.0
        //for Forestry unsupported 210.0
        //for Retired unsupported 210.0
        //for Parental Leave 420.0
        //for Not working  420.0

        //qu.addAnswer("You","", "", [], 80.0);

        return OccupationContainer("",420.0);
      }

      else if(widget.CheckAnswer[0] == "Married/ civil partnership")
        {
          return LivingTogether("",210.0);
        }

        else if(widget.CheckAnswer[0] == "Divorced"){
        return DivorceDate("",420.0);

      }

      else if(widget.CheckAnswer[0] == "Widowed"){
        return WidowedDate("",420.0);
      }

      else if(widget.CheckAnswer[0] == "It's Complicated"){

        //For No 420.0
        //For yes 210.0
        return FormallyMarried("",420.0);
      }



  }

//divorce date
        else if(widget.CheckQuestion == "Date of divorce")
          {
            return OccupationContainer("",420.0);
          }

 //Widowed since

    else if(widget.CheckQuestion == "Widowed since")
    {
      return OccupationContainer("",420.0);
    }


    //living together tax year

    else if(widget.CheckQuestion == "Living together")
      {
        if(widget.CheckAnswer[0] == "No")
          {
            return StartLivingPart("",420.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
            {
              return GetMarried("",210.0);
            }
      }

      //Start living part of married/civilpartnership

        else if(widget.CheckQuestion == "Date of separation")
        {
          return OccupationContainer("",420.0);
          }


       //Start living part of married/civilpartnership
    //Date of marriage

        else if(widget.CheckQuestion == "Date of marriage")
        {
          return AssessedJointly("",420.0);
        }


        //It's Complicated Formally Married
          else if(widget.CheckQuestion == "Formally married")
          {
            if(widget.CheckAnswer[0] == "No")
            {
              return OccupationContainer("",420.0);
            }
            else if(widget.CheckAnswer[0] == "Yes")
            {
             return LivingTogether("", 210.0);
            }
          }


        //Assesses Jointly
          else if(widget.CheckQuestion == "Joint assessment")
          {
            if(widget.CheckAnswer[0] == "No")
            {
              return OccupationContainer("",420.0);
            }
            else if(widget.CheckAnswer[0] == "Yes")
            {
             //Partner's Question will be here for married/civilpartnership
              Questions.LivingCheck = 2;
              qu.updateAnswer("You & Partner","", "", [], 60.0);
              qu.addAnswer("You", "", "", [], 60.0);
              return OccupationContainer("",420.0);
            }
          }



        else if(widget.CheckQuestion == "Occupation")
          {
            for(int m=0;m<widget.CheckAnswer.length;m++) {
              if(widget.CheckAnswer[m] == "Employed") {
                return ProfessionalCourseTraining("",420.0);
              }

              else if(widget.CheckAnswer[m] == "Minijob (e.g. 450€ basis)")
                {
                  return IncomeSources("",420.0);
                }
              else if(widget.CheckAnswer[m] == "Studying")
              {
                //For Part-time degree 420.0
                //For Distance learning 420.0
                //For Postgraduate studies 420.0
                //For None 210.0

                return ApplyStudies("",420.0);
              }

              else if(widget.CheckAnswer[m] == "Training")
              {
                return KindOfTraining("",420.0);
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
                return IncomeSources("",420.0);
              }
              else if(widget.CheckAnswer[m] == "Not working")
              {
                return IncomeSources("",420.0);
              }
            }
          }

          else if(widget.CheckQuestion == "Training" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
            {
              //for Letting and Leasing 210.0
              // for sale of property 210.0
              // for capital gain 210.0
              //for pension 210.0
              ////for Alimony here we said 420.0 but we have to check for 370.0 its better if I put 370.0
              return IncomeSources("",420.0);
            }


            // studying
        else if(widget.CheckQuestion == "Type of study")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Part-time degree")
            {
              return IncomeSources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Distance learning") {
              return IncomeSources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Postgraduate studies")
            {
              return IncomeSources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "None")
            {
              return PreviousCompletedDegree("",420.0);
            }


          }
        }

        //previouslydegreecompleted
        else if(widget.CheckQuestion == "Previous degree" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
        {
          return IncomeSources("",420.0);
        }


        //Typeoftraining
        else if(widget.CheckQuestion == "Type of training" && (widget.CheckAnswer[0] == "Dual training" || widget.CheckAnswer[0] == "Professional School" ))
        {
          return IncomeSources("",420.0);
        }


        else if(widget.CheckQuestion == "Other income")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Letting and Leasing")
              {
                return UnSupportedScreen();
              }
            else if(widget.CheckAnswer[m] == "Sale of Property") {
              //for yes 210 and for no 370.0
              return SaleProperty("",370.0);
            }
            else if(widget.CheckAnswer[m] == "Capital gains")
              {
                //for no 210 and for yes 420.0
                return CapitalGain("",420.0);
              }

            else if(widget.CheckAnswer[m] == "Pensions")
            {

              return UnSupportedScreen();
            }

            else if(widget.CheckAnswer[m] == "Alimony")
            {
              //for Separated spouse 210.0
              // for Adult relatives 210.0
              //for child 210.0
              return PayAlimony("",210.0);
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
                //for Have a disability 210.0
                //for Alimony here we said 420.0 but we have to check for 370.0 its better if I put 370.0
                //for Survivor's pension unsupported screen show 210.0
                //for None 210.0
                return ApplySources("",420.0);
              }

        }


        //for Alimony check that yaha alimony check krna agar 4e ha to 6b select but shown same
        else if(widget.CheckQuestion == "Alimony recipient")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Separated spouse")
            {
              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Adult relatives") {
              return UnSupportedScreen();
            }
            else if(widget.CheckAnswer[m] == "Child")
            {
              //for no 210.0
              // for yes 370.0
              return ChildTaxAllowance("",370.0);
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
            return ApplySources("",420.0);
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
            //370.0 for interest in capitalgain
            // 420.for From shares
            // 420.0 for From loans check its size it has three elements
            // 210.0 For insurance contracts
            // 210.0 Old shares from funds
            //420.0 	From complex financial instruments
            return ReceiveCapitalGain("",420.0);
          }

        }

        else if(widget.CheckQuestion == "Type of Capital gains")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Interest") {
               return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "From shares"){
              //for dividends and Earnings  and Liquidation proceeds  and Shares in associations and foundations size is 210.0,Earnings from sale of stocks is 370.0,Shares in associations and foundations 370.0
              return IncomeShares("",370.0);
            }
            else if(widget.CheckAnswer[m] == "From loans"){


              //for Privateloan unsupported 210.0
              //for Shareholder loan question 21  210.0
              // for Partiarisches Darlehen 210.0
              return TypeOfLoan("",210.0);
            }
            else if(widget.CheckAnswer[m] == "From insurance contracts"){

              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Old shares from funds"){

              return OldFundShares("",210.0);
            }
            else if(widget.CheckAnswer[m] == "From complex financial instruments"){

              //For Domestic Investment Funds 210.0
              //For Investment funds 210.0
              // For Option 210.0
              // For Option Premiums 210.0
              // For Derivatives 210.0
              //For Bonds 210.0
              return FinancialInstruments("",210.0);
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
                return Shares10Company("",210.0);
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
            return ApplySources("",420.0);
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

            return ApplySources("",420.0);
          }
        }




        else if(widget.CheckQuestion == "Shares")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "Dividends") {
              return KeyRole("",210.0);
            }
            else if(widget.CheckAnswer[m] == "Earnings from sale of stocks") {
              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Liquidation proceeds") {
              return KeyRole("",210.0);
            }
            else if(widget.CheckAnswer[m] == "Shares in associations and foundations") {
              return ApplySources("",420.0);
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
              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Foreign investment funds")
              {
                return UnSupportedScreen();
              }
            else if(widget.CheckAnswer[m] == "Options")
            {
              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Option premiums")
            {
              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Derivatives")
            {
              return ApplySources("",420.0);
            }
            else if(widget.CheckAnswer[m] == "Bonds")
            {
              return ApplySources("",420.0);
            }



          }
        }






        else if(widget.CheckQuestion == "Key roles" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            return Shares25Company("",210.0);
          }
          else if(widget.CheckAnswer[0] == "Yes")
          {

            return Shares1Company("",210.0);
          }

        }


        else if(widget.CheckQuestion == "> 25% of shares" )
        {
          if(widget.CheckAnswer[0] == "No")
          {
            return ApplySources("",420.0);
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
            return ApplySources("",420.0);
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
              return TaxReturn("",210.0);
            }
            else if(widget.CheckAnswer[m] == "Alimony paid") {
              //question 8
              return PayAlimony("",210.0);
            }
            else if(widget.CheckAnswer[m] == "Survivor’s pension") {
              //question 8
              return UnSupportedScreen();
            }
            else if(widget.CheckAnswer[m] == "None") {
              //question 8
              //for Questions. LivingCheck=1 210.0
              //for Questions. LivingCheck=2 420.0
              return TaxReturn("",420.0);
            }
          }
        }

        else if(widget.CheckQuestion == "Tax return filed" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
          {
            if(Questions.LivingCheck == 1) {
              return HaveChildren("", 210.0);
            }
            else if(Questions.LivingCheck == 2)
              {
                Questions.LivingCheck = 3;
                qu.addAnswer("Partner", "", "", [], 60.0);
                //Partner's Yaha sa start hoga ab .Partner ka flow
                //Yaha size right nhi check it
                return PartnerOccupationContainer("",210.0);
              }
          }

        else if(widget.CheckQuestion == "Children" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
        {
          //For yes 210.0
          //For living abroad no :420
          //yaha last ma at home ka kaam bhi krna ha
          return LiveAlone("",420.0);
        }
        else if(widget.CheckQuestion == "Living alone")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return LiveAbroad("",210.0);
          }
          else if(widget.CheckAnswer[0] == "No")
            {
              return WhoLiveWith("",210.0);
            }
        }

      //Living situation

        else if(widget.CheckQuestion == "Living situation")
        {
          for(int m=0;m<widget.CheckAnswer.length;m++) {
            if(widget.CheckAnswer[m] == "With my spouse") {
              return LiveAbroad("",210.0);
            }
            else if(widget.CheckAnswer[m] == "With my partner") {
              //question 8
              return LiveAbroad("",210.0);
            }
            else if(widget.CheckAnswer[m] == "With my children") {
              //question 8
              return LiveAbroad("",210.0);
            }
            else if(widget.CheckAnswer[m] == "In a flat share") {
              //question 8
              return LiveAbroad("",210.0);
            }
            else if(widget.CheckAnswer[m] == "With my parents") {
              //question 8
              return LiveAbroad("",210.0);
            }
          }
        }







        else if(widget.CheckQuestion == "Living abroad")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return UnSupportedScreen();
          }
          else if(widget.CheckAnswer[0] == "No")
          {
            return ForeignIncome("",210.0);
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
        return PartnerProfessionalCourseTraining("",420.0);
      }

      else if(widget.CheckAnswer[m] == "Minijob (e.g. 450€ basis)")
      {
        return PartnerIncomeSources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Studying")
      {
        //For Part-time degree 420.0
        //For Distance learning 420.0
        //For Postgraduate studies 420.0
        //For None 210.0

        return PartnerApplyStudies("",420.0);
      }

      else if(widget.CheckAnswer[m] == "Training")
      {
        return PartnerKindOfTraining("",420.0);
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
        return PartnerIncomeSources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Not working")
      {
        return PartnerIncomeSources("",420.0);
      }
    }
  }

  else if(widget.CheckQuestion == "Training" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
  {
    //for Letting and Leasing 210.0
    // for sale of property 210.0
    // for capital gain 210.0
    //for pension 210.0
    ////for Alimony here we said 420.0 but we have to check for 370.0 its better if I put 370.0
    return PartnerIncomeSources("",420.0);
  }


  // studying
  else if(widget.CheckQuestion == "Type of study")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Part-time degree")
      {
        return PartnerIncomeSources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Distance learning") {
        return PartnerIncomeSources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Postgraduate studies")
      {
        return PartnerIncomeSources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "None")
      {
        return PartnerPreviousCompletedDegree("",420.0);
      }


    }
  }

  //previouslydegreecompleted
  else if(widget.CheckQuestion == "Previous degree" && (widget.CheckAnswer[0] == "Yes" || widget.CheckAnswer[0] == "No" ))
  {
    return PartnerIncomeSources("",420.0);
  }


  //Typeoftraining
  else if(widget.CheckQuestion == "Type of training" && (widget.CheckAnswer[0] == "Dual training" || widget.CheckAnswer[0] == "Professional School" ))
  {
    return PartnerIncomeSources("",420.0);
  }


  else if(widget.CheckQuestion == "Other income")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Letting and Leasing")
      {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Sale of Property") {
        //for yes 210 and for no 370.0
        return PartnerSaleProperty("",370.0);
      }
      else if(widget.CheckAnswer[m] == "Capital gains")
      {
        //for no 210 and for yes 420.0
        return PartnerCapitalGain("",420.0);
      }

      else if(widget.CheckAnswer[m] == "Pensions")
      {

        return UnSupportedScreen();
      }

      else if(widget.CheckAnswer[m] == "Alimony")
      {
        //for Separated spouse 210.0
        // for Adult relatives 210.0
        //for child 210.0
        return PartnerPayAlimony("",210.0);
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
      //for Have a disability 210.0
      //for Alimony here we said 420.0 but we have to check for 370.0 its better if I put 370.0
      //for Survivor's pension unsupported screen show 210.0
      //for None 210.0
      return PartnerApplySources("",420.0);
    }

  }


  //for Alimony check that yaha alimony check krna agar 4e ha to 6b select but shown same
  else if(widget.CheckQuestion == "Alimony recipient")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Separated spouse")
      {
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Adult relatives") {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Child")
      {
        //for no 210.0
        // for yes 370.0
        return PartnerChildTaxAllowance("",370.0);
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
      return PartnerApplySources("",420.0);
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
      //370.0 for interest in capitalgain
      // 420.for From shares
      // 420.0 for From loans check its size it has three elements
      // 210.0 For insurance contracts
      // 210.0 Old shares from funds
      //420.0 	From complex financial instruments
      return PartnerReceiveCapitalGain("",420.0);
    }

  }

  else if(widget.CheckQuestion == "Type of Capital gains")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Interest") {
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "From shares"){
        //for dividends and Earnings  and Liquidation proceeds  and Shares in associations and foundations size is 210.0,Earnings from sale of stocks is 370.0,Shares in associations and foundations 370.0
        return PartnerIncomeShares("",370.0);
      }

      else if(widget.CheckAnswer[m] == "From loans"){


        //for Privateloan unsupported 210.0
        //for Shareholder loan question 21  210.0
        // for Partiarisches Darlehen 210.0
        return PartnerTypeOfLoan("",210.0);
      }
      else if(widget.CheckAnswer[m] == "From insurance contracts"){

        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Old shares from funds"){

        return PartnerOldFundShares("",210.0);
      }
      else if(widget.CheckAnswer[m] == "From complex financial instruments"){

        //For Domestic Investment Funds 210.0
        //For Investment funds 210.0
        // For Option 210.0
        // For Option Premiums 210.0
        // For Derivatives 210.0
        //For Bonds 210.0
        return PartnerFinancialInstruments("",210.0);
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
        return PartnerShares10Company("",210.0);
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
      return PartnerApplySources("",420.0);
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

      return PartnerApplySources("",420.0);
    }
  }




  else if(widget.CheckQuestion == "Shares")
  {
    for(int m=0;m<widget.CheckAnswer.length;m++) {
      if(widget.CheckAnswer[m] == "Dividends") {
        return PartnerKeyRole("",210.0);
      }
      else if(widget.CheckAnswer[m] == "Earnings from sale of stocks") {
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Liquidation proceeds") {
        return PartnerKeyRole("",210.0);
      }
      else if(widget.CheckAnswer[m] == "Shares in associations and foundations") {
        return PartnerApplySources("",420.0);
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
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Foreign investment funds")
      {
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "Options")
      {
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Option premiums")
      {
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Derivatives")
      {
        return PartnerApplySources("",420.0);
      }
      else if(widget.CheckAnswer[m] == "Bonds")
      {
        return PartnerApplySources("",420.0);
      }



    }
  }






  else if(widget.CheckQuestion == "Key roles" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return PartnerShares25Company("",210.0);
    }
    else if(widget.CheckAnswer[0] == "Yes")
    {

      return PartnerShares1Company("",210.0);
    }

  }


  else if(widget.CheckQuestion == "> 25% of shares" )
  {
    if(widget.CheckAnswer[0] == "No")
    {
      return PartnerApplySources("",420.0);
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
      return PartnerApplySources("",420.0);
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
        return PartnerTaxReturn("",210.0);
      }
      else if(widget.CheckAnswer[m] == "Alimony paid") {
        //question 8
        return PartnerPayAlimony("",210.0);
      }
      else if(widget.CheckAnswer[m] == "Survivor’s pension") {
        //question 8
        return UnSupportedScreen();
      }
      else if(widget.CheckAnswer[m] == "None") {
        //question 8
        //for Questions. LivingCheck=1 210.0
        //for Questions. LivingCheck=2 420.0
        return PartnerTaxReturn("",210.0);
      }
    }
  }

  else if(widget.CheckQuestion == "Tax return filed" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
  {
    Questions.livcolContainer = 1;
    qu.addAnswer("You & Partner", "", "", [], 60.0);

      return PartnerHaveChildren("",210.0);

  }

        else if(widget.CheckQuestion == "Children" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
        {

          return PartnerLiveTogetherEntireYear("",210.0);
        }

        else if(widget.CheckQuestion == "Together all-year" && (widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes"))
        {
          return PartnerLiveAbroad("", 210.0);
        }

        //Living situation

        else if(widget.CheckQuestion == "Living abroad")
        {
          if(widget.CheckAnswer[0] == "Yes") {
            return UnSupportedScreen();
          }
          else if(widget.CheckAnswer[0] == "No")
          {
            return PartnerForeignIncome("",210.0);
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
  return Container1(Identity:identity,BigQuestion:"",Question:"What is your official marital status in Germany?",QuestionOption:"Marital",AnswerOption:["Single","Married/ civil partnership","Divorced","Widowed","It's Complicated"],Containersize:420.0);
}

Widget OccupationContainer(String identity,double anContainer)
{
  Questions.animatedContainer = anContainer;
  return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What were your occupations in the year 2019?",QuestionOption:"Occupation",AnswerOption:["Employed","Minijob (e.g. 450€ basis)","Studying","Training","Self-employed","Own business","Forestry","Retired","Parental Leave","Not working"],AnswerImages:["images/employedoption.png","images/minijoboption.png","images/studyingoption.png","images/trainingoption.png","images/selfemployed.png","images/ownbusinessoption.png","images/forestryoption.png","images/retired.png","images/parentalleaveoption.png","images/notworkingoption.png"],Containersize:420.0);
}

  Widget ProfessionalCourseTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you attend any professional training courses?",QuestionOption:"Training",Containersize:210.0);
  }


  Widget IncomeSources(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"Did you have any other income sources in 2019?",QuestionOption:"Other income",AnswerOption:["Letting and Leasing","Sale of Property","Capital gains","Pensions","Alimony"],AnswerImages:["images/lettingoption.png","images/salepropertyoption.png","images/capitalgainoption.png","images/pensionsoption.png","images/alimonyoption.png"],Containersize:420.0);
  }


  Widget SaleProperty(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you sell more than one property?",QuestionOption:"More than one property",Containersize:210.0);
  }

  Widget ApplySources(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container4(Identity:identity,BigQuestion:"Personal Details",Question:"Did any of these applied to you during 2019?",QuestionOption:"Further Information",AnswerOption:["Have a disability","Alimony paid","Survivor’s pension","None"],AnswerImages:["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],Containersize:370.0);
  }

  Widget TaxReturn(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have you filed a tax return before?",QuestionOption:"Tax return filed",Containersize:210.0);
  }


  Widget HaveChildren(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Do you have children?",QuestionOption:"Children",Containersize:210.0);
  }

  Widget LiveAlone(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did you live alone in 2019?",QuestionOption:"Living alone",Containersize:210.0);
  }

  Widget LiveAbroad(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did you live abroad for extended periods of time in 2019?",QuestionOption:"Living abroad",Containersize:210.0);
  }

  Widget ForeignIncome(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did you have income from abroad during 2019",QuestionOption:"Foreign Income",Containersize:210.0);
  }


  Widget CapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your capital gain enter a German depot or bank account only?",QuestionOption:"German account",Containersize:210.0);
  }


  Widget ReceiveCapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of capital gains did you receive?",QuestionOption:"Type of Capital gains",AnswerOption:["Interest","From shares","From loans","From insurance contracts","Old shares from funds","From complex financial instruments"],AnswerImages:["images/interestoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/frominsuranceoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:420.0);
  }

  Widget IncomeShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of income from shares did you have?",QuestionOption:"Shares",AnswerOption:["Dividends","Earnings from sale of stocks","Liquidation proceeds","Shares in associations and foundations","Silent partnerships"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:420.0);
  }


  Widget KeyRole(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you work in a key role for any of these companies?",QuestionOption:"Key roles",Containersize:210.0);
  }


  Widget Shares25Company(String identity,double anContainer)
  {
      Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you hold more than 25% of the shares of any one company?",QuestionOption:"> 25% of shares",Containersize:210.0);
  }

  Widget Shares1Company(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you hold more than 1% of the shares of any one company?",QuestionOption:"> 1% of shares",Containersize:210.0);
  }


  Widget TypeOfLoan(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of loan did you grant?",QuestionOption:"Loan",AnswerOption:["Private loan","Shareholder loan","Partiarisches Darlehen"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:420.0);
  }

  Widget Shares10Company(String identity,double anContainer)
  {
   // Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did you hold at least 10% of the shares of any one company?",QuestionOption:"> 10% of shares",Containersize:210.0);
  }

  Widget OldFundShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have you received a certificate from the bank listing the returns on old fund shares (Alt-Anteile von Fonds) that you purchased before 2009?",QuestionOption:"Certificate for old shares",Containersize:210.0);
  }

  Widget FinancialInstruments(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"In which financial instruments have you invested?",QuestionOption:"Financial assests",AnswerOption:["Domestic investment funds","Foreign investment funds","Options","Option premiums","Derivatives","Bonds"],AnswerImages:["images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:420.0);
  }


  //iska question option likhna baqi ha
  Widget PayAlimony(String identity,double anContainer)
  {
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"To whom did you pay Alimony?",QuestionOption:"Alimony recipient",AnswerOption:["Separated spouse","Adult relatives","Child"],AnswerImages:["images/spouseoption.png","images/adultoption.png","images/childoption.png"],Containersize:420.0);
  }

  Widget WhoLiveWith(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"",Question:"Who do you live with?",QuestionOption:"Living situation",AnswerOption:["With my spouse","With my partner","With my children","In a flat share","With my parents"],AnswerImages:["images/withspouseoption.png","images/withpartneroption.png","images/withchildren.png","images/flatshareoption.png","images/withparent.png"],Containersize:420.0);
  }

  Widget ChildTaxAllowance(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Are you or any other person entitled to receive child benefits or the child tax allowance for this child?",QuestionOption:"Child benefits",Containersize:210.0);
  }



  Widget ApplyStudies(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container5(Identity:identity,BigQuestion:"Personal Details",Question:"Which of these apply to your studies?",QuestionOption:"Type of study",AnswerOption:["Part-time degree","Distance learning","Postgraduate studies","None"],Containersize:360.0);
  }


  Widget PreviousCompletedDegree(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have you previously completed a degree (study or training)?",QuestionOption:"Previous degree",Containersize:210.0);
  }


  Widget KindOfTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container6(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of training did you do?",QuestionOption:"Type of training",AnswerOption:["Dual training","Professional School"],Containersize:260.0);
  }

  Widget DivorceDate(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"When did you get divorced?",QuestionOption:"Date of divorce",Containersize:210.0);
  }


  Widget WidowedDate(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"Since when have you been widowed?",QuestionOption:"Widowed since",Containersize:210.0);
  }


  Widget LivingTogether(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Relationship status",Question:"Have you been living together at any time during the tax year?",QuestionOption:"Living together",Containersize:210.0);
  }


  Widget StartLivingPart(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"When did you start living apart?",QuestionOption:"Date of separation",Containersize:210.0);
  }


  Widget GetMarried(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container7(Identity:identity,BigQuestion:"Relationship status",Question:"When did you get married?",QuestionOption:"Date of marriage",Containersize:210.0);
  }


  Widget AssessedJointly(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Relationship status",Question:"Do you wish to be assessed jointly?",QuestionOption:"Joint assessment",Containersize:210.0);
  }


  Widget FormallyMarried(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Relationship status",Question:"Are you formally married?",QuestionOption:"Formally married",Containersize:210.0);
  }






  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================
  // ======================================== Partner's Question ===================================================================


  Widget PartnerOccupationContainer(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What were your partner’s occupation in the year 2019?",QuestionOption:"Occupation",AnswerOption:["Employed","Minijob (e.g. 450€ basis)","Studying","Training","Self-employed","Own business","Forestry","Retired","Parental Leave","Not working"],AnswerImages:["images/employedoption.png","images/minijoboption.png","images/studyingoption.png","images/trainingoption.png","images/selfemployed.png","images/ownbusinessoption.png","images/forestryoption.png","images/retired.png","images/parentalleaveoption.png","images/notworkingoption.png"],Containersize:420.0);
  }

  Widget PartnerProfessionalCourseTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner attend any professional training courses?",QuestionOption:"Training",Containersize:210.0);
  }


  Widget PartnerIncomeSources(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner have any other income sources in 2019?",QuestionOption:"Other income",AnswerOption:["Letting and Leasing","Sale of Property","Capital gains","Pensions","Alimony"],AnswerImages:["images/lettingoption.png","images/salepropertyoption.png","images/capitalgainoption.png","images/pensionsoption.png","images/alimonyoption.png"],Containersize:420.0);
  }


  Widget PartnerSaleProperty(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner sell more than one property?",QuestionOption:"More than one property",Containersize:210.0);
  }

  Widget PartnerApplySources(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container4(Identity:identity,BigQuestion:"Personal Details",Question:"Did any of these applied to your partner during 2019?",QuestionOption:"Further Information",AnswerOption:["Have a disability","Alimony paid","Survivor’s pension","None"],AnswerImages:["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],Containersize:370.0);
  }

  Widget PartnerTaxReturn(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Has your partner filed a tax return before?",QuestionOption:"Tax return filed",Containersize:210.0);
  }


  Widget PartnerCapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner’s capital gain enter a German depot or bank account only?",QuestionOption:"German account",Containersize:210.0);
  }


  Widget PartnerReceiveCapitalGain(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of capital gains did your partner receive?",QuestionOption:"Type of Capital gains",AnswerOption:["Interest","From shares","From loans","From insurance contracts","Old shares from funds","From complex financial instruments"],AnswerImages:["images/interestoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/frominsuranceoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:420.0);
  }

  Widget PartnerIncomeShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of income from shares did your partner have?",QuestionOption:"Shares",AnswerOption:["Dividends","Earnings from sale of stocks","Liquidation proceeds","Shares in associations and foundations","Silent partnerships"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:420.0);
  }


  Widget PartnerKeyRole(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner work in a key role for any of these companies?",QuestionOption:"Key roles",Containersize:210.0);
  }


  Widget PartnerShares25Company(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner hold more than 25% of the shares of any one company?",QuestionOption:"> 25% of shares",Containersize:210.0);
  }

  Widget PartnerShares1Company(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    //Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner hold more than 1% of the shares of any one company?",QuestionOption:"> 1% of shares",Containersize:210.0);
  }


  Widget PartnerTypeOfLoan(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"What type of loan did your partner grant?",QuestionOption:"Loan",AnswerOption:["Private loan","Shareholder loan","Partiarisches Darlehen"],AnswerImages:["images/fromsharesoption.png","images/fromsharesoption.png","images/fromsharesoption.png"],Containersize:420.0);
  }

  Widget PartnerShares10Company(String identity,double anContainer)
  {
    // Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Did your partner hold at least 10% of the shares of any one company?",QuestionOption:"> 10% of shares",Containersize:210.0);
  }

  Widget PartnerOldFundShares(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;

    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have your partner received a certificate from the bank listing the returns on old fund shares (Alt-Anteile von Fonds) that you purchased before 2009?",QuestionOption:"Certificate for old shares",Containersize:210.0);
  }

  Widget PartnerFinancialInstruments(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"In which financial instruments have your partner invested?",QuestionOption:"Financial assests",AnswerOption:["Domestic investment funds","Foreign investment funds","Options","Option premiums","Derivatives","Bonds"],AnswerImages:["images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png","images/oldsharesoption.png"],Containersize:420.0);
  }


  //iska question option likhna baqi ha
  Widget PartnerPayAlimony(String identity,double anContainer)
  {
    //Questions.animatedContainer = anContainer;
    return Container2(Identity:identity,BigQuestion:"Personal Details",Question:"To whom did your partner pay Alimony?",QuestionOption:"Alimony recipient",AnswerOption:["Separated spouse","Adult relatives","Child"],AnswerImages:["images/spouseoption.png","images/adultoption.png","images/childoption.png"],Containersize:420.0);
  }


  Widget PartnerChildTaxAllowance(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Are you or your partner entitled to receive child benefits or the child tax allowance for this child",QuestionOption:"Child benefits",Containersize:210.0);
  }



  Widget PartnerApplyStudies(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container5(Identity:identity,BigQuestion:"Personal Details",Question:"Which of these apply to your partner’s studies?",QuestionOption:"Type of study",AnswerOption:["Part-time degree","Distance learning","Postgraduate studies","None"],Containersize:360.0);
  }


  Widget PartnerPreviousCompletedDegree(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"Personal Details",Question:"Have your partner previously completed a degree (study or training)?",QuestionOption:"Previous degree",Containersize:210.0);
  }


  Widget PartnerKindOfTraining(String identity,double anContainer)
  {
    Questions.animatedContainer = anContainer;
    return Container6(Identity:identity,BigQuestion:"Personal Details",Question:"What kind of training did your partner do?",QuestionOption:"Type of training",AnswerOption:["Dual training","Professional School"],Containersize:260.0);
  }


  Widget PartnerHaveChildren(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Do either of you have children?",QuestionOption:"Children",Containersize:210.0);
  }

  Widget PartnerLiveTogetherEntireYear(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did the two of you live together for the entire year?",QuestionOption:"Together all-year",Containersize:210.0);
  }

  Widget PartnerLiveAbroad(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did either of you live abroad for extended periods of time in 2019?",QuestionOption:"Living abroad",Containersize:210.0);
  }

  Widget PartnerForeignIncome(String identity,double anContainer)
  {

    Questions.animatedContainer = anContainer;
    return Container3(Identity:identity,BigQuestion:"",Question:"Did either of you have income from abroad during 2019?",QuestionOption:"Foreign Income",Containersize:210.0);
  }

}