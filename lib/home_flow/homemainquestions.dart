import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:easy_taxx/home_flow/homeaddresscontainer.dart';
import 'package:easy_taxx/home_flow/homeyesnocontainer.dart';
import 'package:easy_taxx/home_flow/homemultitwooptioncontainer.dart';
import 'package:easy_taxx/home_flow/homemultipleoptionscontainerno.dart';
import 'package:easy_taxx/home_flow/homecalculationcontainer.dart';
import 'package:easy_taxx/home_flow/homesixoptioncontainer.dart';
import 'package:easy_taxx/home_flow/homethreeoptioncontainer.dart';
import 'package:easy_taxx/home_flow/homedatecontainer.dart';


class HomeMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  HomeMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _HomeMainScreenState createState() => _HomeMainScreenState();
}

class _HomeMainScreenState extends State<HomeMainQuestions> {
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
    print("question length:" + Questions.homeAnswerShow.length.toString());

    for (k = l; k < Questions.homeAnswerShow.length; k++) {
      print("how manysdsdsd");
      screenHeightbig = 0.0;
      if (Questions.homeAnswerShow[k]['identity'] == "You" ||
          Questions.homeAnswerShow[k]['identity'] == "You & Partner" ||
          Questions.homeAnswerShow[k]['identity'] == "Partner") {
        screenHeight = screenHeight + 70.0;
      }
      else if (Questions.homeAnswerShow[k]['details'] == "") {
        screenHeight = screenHeight + 60.0;
        detail = true;
      }
      else {
        detailsHeight = Questions.homeAnswerShow[k]['details'];

        for (l = k; l < Questions.homeAnswerShow.length; l++) {
          if (Questions.homeAnswerShow[l]['details'] == detailsHeight) {
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
    screenHeight = screenHeight + Questions.homeAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:" + screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;
  }


  void DynamicContainer() {
    hlength = 0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i = j; i < Questions.homeAnswerShow.length; i++) {
      print("value oif i is:" + i.toString());


      print("dat is:" + i.toString());
      //You and your and your partner identity
      if (Questions.homeAnswerShow[i]['identity'] == "You" ||
          Questions.homeAnswerShow[i]['identity'] == "You & Partner" ||
          Questions.homeAnswerShow[i]['identity'] == "Partner") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
              height: Questions.homeAnswerShow[i]['containerheight'],
              width: 450.0,
              child: Text(Questions.homeAnswerShow[i]['identity'],
                  style: TextStyle(fontSize: 40.0)),
            )
        );
      }
      else if (Questions.homeAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(
                  top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.homeAnswerShow[i]['containerheight'],
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
                      Text(Questions.homeAnswerShow[i]['question'],
                        style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Text(Questions.homeAnswerShow[i]['answer'][0]),
                        SizedBox(width: 10.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                          color: Colors.lightBlue,)
                      ],)
                    ],)),
            ));
      }

      //data that contains long container
      else {
        detailOption = Questions.homeAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for (co = i; co < Questions.homeAnswerShow.length; co++) {
          if (Questions.homeAnswerShow[co]['details'] == detailOption) {
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
          if (Questions.homeAnswerShow[j]['details'] == detailOption &&
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
                          Text(Questions.homeAnswerShow[i]['details'],
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
          if (Questions.homeAnswerShow[j]['details'] == detailOption &&
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
                          Text(Questions.homeAnswerShow[j]['question'],
                            style: TextStyle(color: Colors.grey,fontSize: 13),),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Text(Questions.homeAnswerShow[j]['answer'][0],style: TextStyle(fontSize: 13),),
                            SizedBox(width: 2.0,),
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
          title: Text('Home',
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
                          HomeChangeContainer(),

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


  Widget HomeChangeContainer() {
    if(Questions.homeAnswerShow.length == 0)
    {
      //Question No 1
      return homeaddressContainer("","Home address","What is your current address?","Current address",210.0,"","");
    }

    else{

      //Answer No 1
      if(widget.CheckCompleteQuestion == "What is your current address?"  && widget.CheckQuestion == "Current address")
      {
        //Question No 2
        //For No 320.0
        //For yes 210.0
        return homeyesnoContainer("","Home address","Did you move during 2019?","Move 2019",320.0,"","");
      }




      //Answer No 2
      else if(widget.CheckCompleteQuestion =="Did you move during 2019?" && widget.CheckQuestion == "Move 2019")
      {
        if(widget.CheckAnswer[0] == "No")
        {
            //Question No 3
          //For None 420.0
          //For Utility Bill 210.0
          //For Home Owner 210.0
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 63
          return homeyesnoContainer("","Relocation","Did you move for job-related reasons?","Due to work",210.0,"","");

        }
      }

//============= Big Detail (Relocation Start) =========================



      
      //Answer No 63
      else if(widget.CheckCompleteQuestion =="Did you move for job-related reasons?" && widget.CheckQuestion == "Due to work")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 64
          //For No 320.0
          //For yes 210.0
          return homeyesnoContainer("","Relocation","Did you hire a moving company?","Moving company",210.0,"","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 65

          return homecalculationContainer("","Relocation","How often did you move for job-related reasons in 2019?","Number of moves",320.0,"calculation","");

        }
      }



      //Answer No 64
      else if(widget.CheckCompleteQuestion =="Did you hire a moving company?" && widget.CheckQuestion == "Moving company")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 66
          return homecalculationContainer("","Relocation","How much was the moving company?","Amount moving company",320.0,"calculation","");
        }
      }


      //Answer No 66
      else if(widget.CheckCompleteQuestion =="How much was the moving company?" && widget.CheckQuestion == "Amount moving company")
      {
        //Question No 3
        return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
      }



      //Answer No 65

      else if(widget.CheckCompleteQuestion =="How often did you move for job-related reasons in 2019?" && widget.CheckQuestion == "Number of moves")
      {
        //Question No 67

        return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);


      }



      //Answer No 67

      else if(widget.CheckCompleteQuestion =="What is the reason for your relocation No. ${Questions.relocationLength}?" && widget.CheckQuestion == "Reason of relocation")
      {

        if(widget.CheckAnswer[0] == "Started a new job")
        {
          //Question No 68
    //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "Moved in or out of a second household")
        {
          if(Questions.relocationLength <= Questions.totalRelocation)
          {
            //Question No 67
            return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
          }
          else{
            //Question No 3
            return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
          }
        }

        else if(widget.CheckAnswer[0] == "Saving 1 hour per day")
        {
          //Question No 68
          //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "Employer moved")
        {
//Question No 68
          //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "Transferred to other employer’s location")
        {
//Question No 68
          //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "At employer’s request")
        {
//Question No 68
          //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "Moving in or out of company flat")
        {
//Question No 68
          //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "Other provable occupational reasons")
        {
//Question No 68
          //For No 210.0
          //For yes 420.0
          return homeyesnoContainer("","Relocation","Did you want to make use of the lump sum for so called other moving expenses?","Lump sum",210.0,"",Questions.relocationText);
        }

        else if(widget.CheckAnswer[0] == "None of them")
        {
          if(Questions.relocationLength <= Questions.totalRelocation)
          {
            //Question No 67
            return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
          }
          else{
            //Question No 3
            return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
          }
        }


      }



      //Answer No 68
      else if(widget.CheckCompleteQuestion =="Did you want to make use of the lump sum for so called other moving expenses?" && widget.CheckQuestion == "Lump sum")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 69
          //For No 420.0
          //For yes 210.0
          return homeyesnoContainer("","Relocation","Did you have any miscellaneous moving expenses?","Miscellaneous moving expenses",210.0,"",Questions.relocationText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 70
    //For None 420
    //For rest of 210.0
          return homemultipleoptionsContainerNo("","Relocation","How did you move?","Relocation",["Own car","Rental car","Moving company","By plane","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.relocationText);
        }
      }


      //Answer No 69
      else if(widget.CheckCompleteQuestion =="Did you have any miscellaneous moving expenses?" && widget.CheckQuestion == "Miscellaneous moving expenses")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 70
          return homemultipleoptionsContainerNo("","Relocation","How did you move?","Relocation",["Own car","Rental car","Moving company","By plane","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.relocationText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 71
          return homecalculationContainer("","Relocation","How much did you spent on miscellaneous moving expenses?","Actual costs",420.0,"calculation",Questions.relocationText);
        }
      }


      //Answer No 71
      else if(widget.CheckCompleteQuestion =="How much did you spent on miscellaneous moving expenses?" && widget.CheckQuestion == "Actual costs")
      {
        //Question No 70
        return homemultipleoptionsContainerNo("","Relocation","How did you move?","Relocation",["Own car","Rental car","Moving company","By plane","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.relocationText);

      }

      //Answer no 70

      else if(widget.CheckCompleteQuestion == "How did you move?" && widget.CheckQuestion == "Relocation")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Own car") {
   //Question No 72
            //Ya container from to sa change hoga
            return homecalculationContainer("","Relocation","We want to calculate the distance. From where to where did you go by car?","Distance by car",420.0,"",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Rental car") {
//Question No 73
            return homecalculationContainer("","Relocation","How much did you spend on the rental car?","Amount",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Moving company") {
//Question No 74
            return homecalculationContainer("","Relocation","How much did you spend on the moving company?","Amount",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "By plane") {
//Question No 75
            return homecalculationContainer("","Relocation","How much did you spent on the plane?","Costs for plane",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "None") {
//Question No 76
            return homemultipleoptionsContainerNo("","Relocation","Did you have any other costs due to the move?","Costs",["Broker’s fee","Travel to apartment viewings","Double rent","Damages during transport","Private tutoring","Other expenses","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.relocationText);
          }
        }
      }


      //Answer No 72
      else if(widget.CheckCompleteQuestion =="We want to calculate the distance. From where to where did you go by car?" && widget.CheckQuestion == "Distance by car")
      {
        //Question No 76
        return homemultipleoptionsContainerNo("","Relocation","Did you have any other costs due to the move?","Costs",["Broker’s fee","Travel to apartment viewings","Double rent","Damages during transport","Private tutoring","Other expenses","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.relocationText);

      }

      //Answer No 73
      else if(widget.CheckCompleteQuestion =="How much did you spend on the rental car?" && widget.CheckQuestion == "Amount")
      {
        //Question No 76
        return homemultipleoptionsContainerNo("","Relocation","Did you have any other costs due to the move?","Costs",["Broker’s fee","Travel to apartment viewings","Double rent","Damages during transport","Private tutoring","Other expenses","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.relocationText);

      }

      //Answer No 74
      else if(widget.CheckCompleteQuestion =="How much did you spend on the moving company?" && widget.CheckQuestion == "Amount")
      {
        //Question No 76
        return homemultipleoptionsContainerNo("","Relocation","Did you have any other costs due to the move?","Costs",["Broker’s fee","Travel to apartment viewings","Double rent","Damages during transport","Private tutoring","Other expenses","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.relocationText);

      }


      //Answer No 75
      else if(widget.CheckCompleteQuestion =="How much did you spent on the plane?" && widget.CheckQuestion == "Costs for plane")
      {
        //Question No 76
        return homemultipleoptionsContainerNo("","Relocation","Did you have any other costs due to the move?","Costs",["Broker’s fee","Travel to apartment viewings","Double rent","Damages during transport","Private tutoring","Other expenses","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.relocationText);

      }


      //Answer No 76
      else if(widget.CheckCompleteQuestion == "Did you have any other costs due to the move?" && widget.CheckQuestion == "Costs")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Broker’s fee") {
      //Question No 77
            return homecalculationContainer("","Relocation","How much was the broker’s fee?","Broker",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Travel to apartment viewings") {
//Question No 78
            return homecalculationContainer("","Relocation","How much were your travel costs for apartment viewings?","Apartment viewings",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Double rent") {
//Question No 79
            return homecalculationContainer("","Relocation","How much did you pay in rent for the unused apartment?","Double rent payments",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Damages during transport") {
//Question No 80
            return homecalculationContainer("","Relocation","How much were the damages due to transport?","Damages during transport",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Private tutoring") {
//Question No 81
            return homecalculationContainer("","Relocation","How much did you spend on tutoring due to change of school?","Private tutoring",420.0,"calculation",Questions.relocationText);
          }
          else if(widget.CheckAnswer[m] == "Other expenses") {
//Question No 82
            return homecalculationContainer("","Relocation","Please enter any other costs you had due to relocation?","Other costs",420.0,"calculation",Questions.relocationText);
          }

          else if(widget.CheckAnswer[m] == "No") {

            if(Questions.relocationLength <= Questions.totalRelocation)
            {
              //Question No 67
              return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
            }
            else{
              //Question No 3
              return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
            }
          }
        }
      }


      //Answer No 77
      else if(widget.CheckCompleteQuestion =="How much was the broker’s fee?" && widget.CheckQuestion == "Broker")
      {
        if(Questions.relocationLength <= Questions.totalRelocation)
          {
            //Question No 67
            return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
          }
         else{
           //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }


      }


      //Answer No 78
      else if(widget.CheckCompleteQuestion =="How much were your travel costs for apartment viewings?" && widget.CheckQuestion == "Apartment viewings")
      {
        if(Questions.relocationLength <= Questions.totalRelocation)
        {
          //Question No 67
          return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
        }
        else{
          //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }


      }

      //Answer No 79
      else if(widget.CheckCompleteQuestion =="How much did you pay in rent for the unused apartment?" && widget.CheckQuestion == "Double rent payments")
      {
        if(Questions.relocationLength <= Questions.totalRelocation)
        {
          //Question No 67
          return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
        }
        else{
          //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }


      }

      //Answer No 80
      else if(widget.CheckCompleteQuestion =="How much were the damages due to transport?" && widget.CheckQuestion == "Damages during transport")
      {
        if(Questions.relocationLength <= Questions.totalRelocation)
        {
          //Question No 67
          return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
        }
        else{
          //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }


      }


      //Answer No 81
      else if(widget.CheckCompleteQuestion =="How much did you spend on tutoring due to change of school?" && widget.CheckQuestion == "Private tutoring")
      {
        if(Questions.relocationLength <= Questions.totalRelocation)
        {
          //Question No 67
          return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
        }
        else{
          //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }
      }

      //Answer No 82
      else if(widget.CheckCompleteQuestion =="Please enter any other costs you had due to relocation?" && widget.CheckQuestion == "Other costs")
      {
        if(Questions.relocationLength <= Questions.totalRelocation)
        {
          //Question No 67
          return homesixoptioncontainer("","Relocation","What is the reason for your relocation No. ${Questions.relocationLength}?","Reason of relocation",["Started a new job","Moved in or out of a second household","Saving 1 hour per day","Employer moved","Transferred to other employer’s location","At employer’s request","Moving in or out of company flat","Other provable occupational reasons","None of them"],210.0,"",Questions.relocationText);
        }
        else{
          //Question No 3
          return homemultitwooptionContainer("", "Household services", "Did you receive any of the following bills for your home?", "Utility bill, 'WEG' statement", ["Utility Bill", "Home owner statement ('WEG')", "None"], ["images/disabilityoption.png", "images/alimonypaidoption.png", "images/survivorspension.png"], 420.0,"None","");
        }

      }






      //============= Big Detail (Relocation End) =========================






      //============= Big Detail (House Hold Services Start) =========================

      //Answer No 3
      else if(widget.CheckCompleteQuestion == "Did you receive any of the following bills for your home?" && widget.CheckQuestion == "Utility bill, 'WEG' statement")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Utility Bill") {
            //Question No 5
            return homeyesnoContainer("","Household services","Would you like to enter more than one utility bill?","More bills",210.0,"","");
          }
          else if(widget.CheckAnswer[m] == "Home owner statement ('WEG')") {
            //Question No 17
            return homeyesnoContainer("","Household services","Would you like to enter more than one 'WEG' statement?","More than one",210.0,"","");

          }
          else if(widget.CheckAnswer[m] == "None") {
           //Question No 9
            //For No 210.0
            //For nursing care 210.0
            //For rest 320.0
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }
        }
      }




      //Answer no 5
      else if(widget.CheckCompleteQuestion =="Would you like to enter more than one utility bill?" && widget.CheckQuestion == "More bills")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 6
          //For No 420.0
          //For Yes 210.0
          return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.)?","Certificate",420.0,"","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 7
          return homecalculationContainer("","Household services","How many utility statements would you like to enter?","Number of bills",420.0,"calculation","");
        }
      }


      //Answer No 7
      else if(widget.CheckCompleteQuestion =="How many utility statements would you like to enter?" && widget.CheckQuestion == "Number of bills"){
       //Question No 58
        //For No 420.0
        //For Yes 210.0

        //Multiple data
        return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");

      }



//Multiple Single
      else if((widget.CheckCompleteQuestion =="Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.)?" || widget.CheckCompleteQuestion == "Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?") && (widget.CheckQuestion == "Certificate" || widget.CheckQuestion =="Certificate ${Questions.utilityBillLength}"))
      {
        if(widget.CheckCompleteQuestion == "Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.)?")
        {
          //Answer No 6
          //Single Data
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 8
          //For No services 420
          //For Rest 210.0
          return homemultipleoptionsContainerNo("","Household services","Which of the following services are included in your utility bill?","Services",["Cleaning / pest control","Gardening","Facility manager","Maintenance / repair","Chimney sweeper","Winter service","Other services","No services"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No services","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 179

          return homecalculationContainer("","Household services","What was the bill amount for services or craftsmen on your utilities statement (excluding heating, electricity, insurances etc.)?","Amount utilities",420.0,"calculation","");
        }

        }
        //answer No 58

//Multiple Data
       else if(widget.CheckCompleteQuestion == "Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?")
        {

          if(widget.CheckAnswer[0] == "No")
          {
            //Question No 59
            //For No services 420
            //For Rest 210.0

            return homemultipleoptionsContainerNo("","Household services","Which of the following services are included in your utility bill no. ${Questions.utilityBillLength}?","Services ${Questions.utilityBillLength}",["Cleaning / pest control","Gardening","Facility manager","Maintenance / repair","Chimney sweeper","Winter service","Other services","No services"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No services","STATEMENT ${Questions.utilityBillLength}");
          }

          else if(widget.CheckAnswer[0] == "Yes")
          {
            //Question No 179

            return homecalculationContainer("","Household services","What was the bill amount for services or craftsmen on your utilities statement (excluding heating, electricity, insurances etc.)?","Amount for ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");
          }

        }


      }



      //Answer No 179
      else if(widget.CheckCompleteQuestion =="What was the bill amount for services or craftsmen on your utilities statement (excluding heating, electricity, insurances etc.)?" && (widget.CheckQuestion == "Amount utilities" || widget.CheckQuestion == "Amount for ${Questions.utilityBillLength -1}"))
      {

        //Single Option
        if(widget.CheckQuestion == "Amount utilities"){
          //Question No 9
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }

        //Multiple Option
        else{
        if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
          //Question No 58
          return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
        }

        //Single Option
        else{
          //Question No 9
        return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

        }

        }

        }



      //Answer No 8

      else if((widget.CheckCompleteQuestion == "Which of the following services are included in your utility bill?" || widget.CheckCompleteQuestion == "Which of the following services are included in your utility bill no. ${Questions.utilityBillLength}?" ) && (widget.CheckQuestion == "Services" || widget.CheckQuestion == "Services ${Questions.utilityBillLength}"))
      {
        //For Single
        //Answer No 8
        if(widget.CheckCompleteQuestion == "Which of the following services are included in your utility bill?"){
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Cleaning / pest control") {
           //Question No 10
            return homecalculationContainer("","Household services","How much is your share for cleaning / pest control relating to your flat?","Share cleaning/pest control",420.0,"calculation","");

          }

          else if(widget.CheckAnswer[m] == "Gardening") {
           //Question No 11
            return homecalculationContainer("","Household services","How much is your share for gardening relating to your flat?","Share gardening",420.0,"calculation","");

          }

          else if(widget.CheckAnswer[m] == "Facility manager") {
            //Question No 12
            return homecalculationContainer("","Household services","How much is your share for janitorial services relating to your flat?","Share janitorial service",420.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "Maintenance / repair") {
            //Question No 13
            return homecalculationContainer("","Household services","How much is your share for maintenance / repair relating to your flat?","Share maintenance/repair",420.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "Chimney sweeper") {
            //Question No 14
            return homecalculationContainer("","Household services","How much is your share for chimney sweeper relating to your flat?","Share chimney sweeper",420.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "Winter service") {
            //Question No 15
            return homecalculationContainer("","Household services","How much is your share for winter services relating to your flat?","Share winter services",420.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "Other services") {
            //Question No 16
            return homecalculationContainer("","Household services","How much is your share for other services from utility bill no. relating to your flat (excluding heating, electricity, insurances etc.)?","Share other services",420.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "No services") {
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");


          }


        }
        }

        //For Multiple
        //Answer No 59
        else if(widget.CheckCompleteQuestion == "Which of the following services are included in your utility bill no. ${Questions.utilityBillLength}?"){
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Cleaning / pest control") {
            //Question No 10

            return homecalculationContainer("","Household services","How much is your share for cleaning / pest control from utility bill no. ${Questions.utilityBillLength} relating to your flat?","Share cleaning/pest control ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");

          }

          else if(widget.CheckAnswer[m] == "Gardening") {
            //Question No 11
            return homecalculationContainer("","Household services","How much is your share for gardening from utility bill no. ${Questions.utilityBillLength} relating to your flat?","Share gardening ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");

          }

          else if(widget.CheckAnswer[m] == "Facility manager") {
            //Question No 12
            return homecalculationContainer("","Household services","How much is your share for janitorial services from utility bill no. ${Questions.utilityBillLength} relating to your flat?","Share janitorial service ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");
          }

          else if(widget.CheckAnswer[m] == "Maintenance / repair") {
            //Question No 13
            return homecalculationContainer("","Household services","How much is your share for maintenance / repair from utility bill no. ${Questions.utilityBillLength} relating to your flat?","Share maintenance/repair ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");
          }

          else if(widget.CheckAnswer[m] == "Chimney sweeper") {
            //Question No 14
            return homecalculationContainer("","Household services","How much is your share for chimney sweeper from utility bill no. ${Questions.utilityBillLength} relating to your flat?","Share chimney sweeper ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");
          }

          else if(widget.CheckAnswer[m] == "Winter service") {
            //Question No 15
            return homecalculationContainer("","Household services","How much is your share for winter services from utility bill no. ${Questions.utilityBillLength} relating to your flat?","Share winter services ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");
          }

          else if(widget.CheckAnswer[m] == "Other services") {
            //Question No 16
            return homecalculationContainer("","Household services","How much is your share for other services from utility bill no. ${Questions.utilityBillLength} relating to your flat (excluding heating, electricity, insurances etc.)?","Share other services ${Questions.utilityBillLength}",420.0,"calculation","STATEMENT ${Questions.utilityBillLength}");
          }

          else if(widget.CheckAnswer[m] == "No services") {
            int noServiceQuestion = Questions.utilityBillLength +1;
            if(noServiceQuestion <= Questions.totalUtilityBill) {
              //Question No 58
              return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${noServiceQuestion}?","Certificate ${noServiceQuestion}",420.0,"","STATEMENT ${noServiceQuestion}");
            }

            //Single Option
            else{
              //Question No 9
              return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

            }


          }


        }
        }

      }



      // ========= Services Utility Bill Start ============ //


      //Answer No 10
      else if((widget.CheckCompleteQuestion =="How much is your share for cleaning / pest control relating to your flat?" || widget.CheckCompleteQuestion =="How much is your share for cleaning / pest control from utility bill no. ${Questions.utilityBillLength -1} relating to your flat?") && (widget.CheckQuestion == "Share cleaning/pest control" || widget.CheckQuestion == "Share cleaning/pest control ${Questions.utilityBillLength -1}"))
        {
         //Question No 9
          //Single Option
        if(widget.CheckCompleteQuestion == "How much is your share for cleaning / pest control relating to your flat?"){
        return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }

        }


      //Answer No 11
      else if((widget.CheckCompleteQuestion =="How much is your share for gardening relating to your flat?" || widget.CheckCompleteQuestion=="How much is your share for gardening from utility bill no. ${Questions.utilityBillLength -1} relating to your flat?") && (widget.CheckQuestion == "Share gardening" || widget.CheckQuestion == "Share gardening ${Questions.utilityBillLength -1}"))

      {
        //Question No 9
        //Single Option
        print("gussa ha");
        if(widget.CheckCompleteQuestion == "How much is your share for gardening relating to your flat?"){
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }
      }


      //Answer No 12
      else if((widget.CheckCompleteQuestion =="How much is your share for janitorial services relating to your flat?" || widget.CheckCompleteQuestion =="How much is your share for janitorial services from utility bill no. ${Questions.utilityBillLength -1} relating to your flat?") && (widget.CheckQuestion == "Share janitorial service" || widget.CheckQuestion == "Share janitorial service ${Questions.utilityBillLength -1}"))
      {
        //Question No 9
        //Single Option
        print("gussa ha");
        if(widget.CheckCompleteQuestion == "How much is your share for janitorial services relating to your flat?"){
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }


      }


      //Answer No 13
      else if((widget.CheckCompleteQuestion =="How much is your share for maintenance / repair relating to your flat?" || widget.CheckCompleteQuestion == "How much is your share for maintenance / repair from utility bill no. ${Questions.utilityBillLength -1} relating to your flat?") && (widget.CheckQuestion == "Share maintenance/repair" || widget.CheckQuestion == "Share maintenance/repair ${Questions.utilityBillLength -1}"))
      {

        //Question No 9
        //Single Option
        print("gussa ha");
        if(widget.CheckCompleteQuestion == "How much is your share for maintenance / repair relating to your flat?"){
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }





      }


      //Answer No 14
      else if((widget.CheckCompleteQuestion =="How much is your share for chimney sweeper relating to your flat?" || widget.CheckCompleteQuestion =="How much is your share for chimney sweeper from utility bill no. ${Questions.utilityBillLength -1} relating to your flat?") && (widget.CheckQuestion == "Share chimney sweeper" || widget.CheckQuestion == "Share chimney sweeper ${Questions.utilityBillLength -1}"))
      {
        //Question No 9
        //Single Option
        print("gussa ha");
        if(widget.CheckCompleteQuestion == "How much is your share for chimney sweeper relating to your flat?"){
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }

      }


      //Answer No 15
      else if((widget.CheckCompleteQuestion =="How much is your share for winter services relating to your flat?" || widget.CheckCompleteQuestion =="How much is your share for winter services from utility bill no. ${Questions.utilityBillLength -1} relating to your flat?") && (widget.CheckQuestion == "Share winter services"  || widget.CheckQuestion == "Share winter services ${Questions.utilityBillLength -1}"))
      {

        //Question No 9
        //Single Option
        print("gussa ha");
        if(widget.CheckCompleteQuestion == "How much is your share for winter services relating to your flat?"){
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }


      }


      //Answer No 16
      else if((widget.CheckCompleteQuestion =="How much is your share for other services from utility bill no. relating to your flat (excluding heating, electricity, insurances etc.)?" || widget.CheckCompleteQuestion =="How much is your share for other services from utility bill no. ${Questions.utilityBillLength -1} relating to your flat (excluding heating, electricity, insurances etc.)?") && (widget.CheckQuestion == "Share other services" || widget.CheckQuestion == "Share other services ${Questions.utilityBillLength -1}"))
      {
        //Question No 9
        //Single Option
        print("gussa ha");
        if(widget.CheckCompleteQuestion == "How much is your share for other services from utility bill no. relating to your flat (excluding heating, electricity, insurances etc.)?"){
          return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }


        //Multiple Option
        else{
          if(Questions.utilityBillLength <= Questions.totalUtilityBill) {
            //Question No 58
            return homeyesnoContainer("","Household services","Did you receive a separate certificate that only includes the sum for household services and/or craftsman services according to §35a EStG(excluding heating, electricity, insurances etc.) for utility bill no. ${Questions.utilityBillLength}?","Certificate ${Questions.utilityBillLength}",420.0,"","STATEMENT ${Questions.utilityBillLength}");
          }

          //Single Option
          else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");

          }

        }
      }



      // ========= Services Utility Bill End ============ //








      //Answer No 17
      else if(widget.CheckCompleteQuestion =="Would you like to enter more than one 'WEG' statement?" && widget.CheckQuestion == "More than one")
      {
        if(widget.CheckAnswer[0] == "No")
        {
            //Question No 18
          return homecalculationContainer("","Household services","How much was invoiced for utility services on your 'WEG' bill?","Amount",210.0,"calculation","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 19
          return homecalculationContainer("","Household services","How many 'WEG' statements would you like to enter?","Number of 'WEG' statements",210.0,"calculation","");
        }
      }



      //Answer No 19
      else if(widget.CheckCompleteQuestion =="How many 'WEG' statements would you like to enter?" && widget.CheckQuestion == "Number of 'WEG' statements")
      {
        //Question No 18
        return homecalculationContainer("","Household services","How much was invoiced for utility services on your 'WEG' bill?","'WEG' ${Questions.WEGLength}",210.0,"calculation","WEG BILL ${Questions.WEGLength}");
      }




      //Answer No 18

      else if(widget.CheckCompleteQuestion =="How much was invoiced for utility services on your 'WEG' bill?" && (widget.CheckQuestion == "Amount" || widget.CheckQuestion == "'WEG' ${Questions.WEGLength -1}"))
      {
        //Single Option
        if(widget.CheckQuestion == "Amount"){
          //Question No 9
        return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
        }

        //Multiple Option
        else{
          if(Questions.WEGLength <= Questions.totalWEG)
            {
              //Question No 18
              return homecalculationContainer("","Household services","How much was invoiced for utility services on your 'WEG' bill?","'WEG' ${Questions.WEGLength}",210.0,"calculation","WEG BILL ${Questions.WEGLength}");
            }
            else{
            //Question No 9
            return homemultipleoptionsContainerNo("","Household services","Did you order any of the following work or services for your household?","Made use of",["Cleaning","Winter service","Gardening","Nursing care","Pet Care","Craftsmen","Chimney sweep","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png"],210.0,"No","");
          }

        }
        }







      //Answer No 9
      else if(widget.CheckCompleteQuestion == "Did you order any of the following work or services for your household?" && widget.CheckQuestion == "Made use of")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Cleaning") {
            //Question No 21

            return homemultitwooptionContainer("", "Household services", "Who provided the cleaning service?", "Provided by", ["Service company", "Employee"], ["images/disabilityoption.png", "images/alimonypaidoption.png"], 210.0,"","");
          }

          else if(widget.CheckAnswer[m] == "Winter service") {

            //Question No 26
            return homemultitwooptionContainer("", "Household services", "Who provided the winter service?", "Provided by", ["Service company", "Employee"], ["images/disabilityoption.png", "images/alimonypaidoption.png"], 210.0,"","");
          }

          else if(widget.CheckAnswer[m] == "Gardening") {
            //Question No 30
            return homemultitwooptionContainer("", "Household services", "Who provided you with the gardening service?", "Provider", ["Service company", "Employee"], ["images/disabilityoption.png", "images/alimonypaidoption.png"], 210.0,"","");
          }

          else if(widget.CheckAnswer[m] == "Nursing care") {
            //Question No 34
            return homecalculationContainer("","Household services","How much did you spend on nursing care?","Household help nursing care",210.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "Pet Care") {
            //Question No 35
            return homemultitwooptionContainer("", "Household services", "Who provided the pet care service?", "Provided by", ["Service company", "Employee"], ["images/disabilityoption.png", "images/alimonypaidoption.png"], 210.0,"","");
          }

          else if(widget.CheckAnswer[m] == "Craftsmen") {
            //Question No 39
            //For No 420.0
            //For Yes 210.0
            return homeyesnoContainer("","Household services","Would you like to enter several craftsmen services?","More than one",420.0,"","");
          }

          else if(widget.CheckAnswer[m] == "Chimney sweep") {
            //Question No 43
            return homecalculationContainer("","Household services","How much did you spend on the chimney sweep?","Costs chimney sweep",210.0,"calculation","");
          }

          else if(widget.CheckAnswer[m] == "No") {

            //Question No 98
            return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

          }


        }
      }


      //Answer No 21

      else if(widget.CheckCompleteQuestion == "Who provided the cleaning service?" && widget.CheckQuestion == "Provided by")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Service company") {
            //Question No 22
            return homecalculationContainer("","Household services","How much was the cleaning?","Costs cleaning company",210.0,"calculation","");
          }
          else if(widget.CheckAnswer[m] == "Employee") {
            //Question No 23
            return homeyesnoContainer("","Household services","Were the cleaning services provided as part of a marginal employment (mini-job)?","Cleaning: mini job",210.0,"","");

          }

        }
      }


      //Answer No 22
      else if(widget.CheckCompleteQuestion == "How much was the cleaning?" && widget.CheckQuestion == "Costs cleaning company")
      {
        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

      }


      //Answer No 23
      else if(widget.CheckCompleteQuestion =="Were the cleaning services provided as part of a marginal employment (mini-job)?" && widget.CheckQuestion == "Cleaning: mini job")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question 24
          return homecalculationContainer("","Household services","How much did you pay the household help for the cleaning service?","Household help cleaning",210.0,"calculation","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 25
          return homecalculationContainer("","Household services","How much did you spend on (employed) cleaning services?","Cleaning services (employed)",210.0,"calculation","");
        }
      }


      //Answer No 24
      else if(widget.CheckCompleteQuestion =="How much did you pay the household help for the cleaning service?" && widget.CheckQuestion == "Household help cleaning") {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }


      //Answer No 25
       else if(widget.CheckCompleteQuestion =="How much did you spend on (employed) cleaning services?" && widget.CheckQuestion == "Cleaning services (employed)") {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }





      //Answer No 26

      else if(widget.CheckCompleteQuestion == "Who provided the winter service?" && widget.CheckQuestion == "Provided by")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Service company") {
            //Question No 27
            return homecalculationContainer("","Household services","How much was the winter service?","Amount table",210.0,"calculation","");
          }
          else if(widget.CheckAnswer[m] == "Employee") {
            //Question No 28
            return homeyesnoContainer("","Household services","Were the winter service provided as part of marginal employment (mini-job)?","Winter service: Mini job",210.0,"","");

          }

        }
      }


      //Answer No 27
      else if(widget.CheckCompleteQuestion == "How much was the winter service?" && widget.CheckQuestion == "Amount table")
      {
        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

      }


       //Answer No 28
      else if(widget.CheckCompleteQuestion =="Were the winter service provided as part of marginal employment (mini-job)?" && widget.CheckQuestion == "Winter service: Mini job")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 29
          return homecalculationContainer("","Household services","How much did you pay the person who provided the service?","Amount",210.0,"calculation","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 29
          return homecalculationContainer("","Household services","How much did you pay the person who provided the service?","Household help winter service",210.0,"calculation","");
        }
      }



      //Answer No 29
      else if(widget.CheckCompleteQuestion =="How much did you pay the person who provided the service?" && (widget.CheckQuestion == "Amount" || widget.CheckQuestion == "Household help winter service")) {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }



//Answer No 30
      else if(widget.CheckCompleteQuestion == "Who provided you with the gardening service?" && widget.CheckQuestion == "Provider")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Service company") {
            //Question No 31
            return homecalculationContainer("","Household services","How much was the gardening?","Gardening company",210.0,"calculation","");
          }
          else if(widget.CheckAnswer[m] == "Employee") {
            //Question No 32
            return homeyesnoContainer("","Household services","Was the gardening provided as part of marginal employment (mini-job)?","Gardening: mini job",210.0,"","");

          }

        }
      }



      //Answer No 31
      else if(widget.CheckCompleteQuestion == "How much was the gardening?" && widget.CheckQuestion == "Gardening company")
      {
        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

      }



      //Answer No 32
      else if(widget.CheckCompleteQuestion =="Was the gardening provided as part of marginal employment (mini-job)?" && widget.CheckQuestion == "Gardening: mini job")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 33
          return homecalculationContainer("","Household services","How much did you pay the person who did the gardening?","Household help gardening",210.0,"calculation","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 33
          return homecalculationContainer("","Household services","How much did you pay the person who did the gardening?","Amount",210.0,"calculation","");
        }
      }


      //Answer No 33
      else if(widget.CheckCompleteQuestion =="How much did you pay the person who did the gardening?" && (widget.CheckQuestion == "Household help gardening" || widget.CheckQuestion == "Amount")) {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }


      //Answer No 34
      else if(widget.CheckCompleteQuestion =="How much did you spend on nursing care?" &&  widget.CheckQuestion == "Household help nursing care") {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }



      //Answer No 35
      else if(widget.CheckCompleteQuestion == "Who provided the pet care service?" && widget.CheckQuestion == "Provided by")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Service company") {
            //Question No 36
            return homecalculationContainer("","Household services","How much did you pay the service company for the pet care?","Pet care",210.0,"calculation","");
          }
          else if(widget.CheckAnswer[m] == "Employee") {
            //Question No 37
            return homeyesnoContainer("","Household services","Was the pet care provided as part of a marginal employment(mini-job)?","Petcare: mini job",210.0,"","");

          }

        }
      }


      //Answer No 36
      else if(widget.CheckCompleteQuestion =="How much did you pay the service company for the pet care?" &&  widget.CheckQuestion == "Pet care") {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }


      //Answer No 37

      else if(widget.CheckCompleteQuestion =="Was the pet care provided as part of a marginal employment(mini-job)?" && widget.CheckQuestion == "Petcare: mini job")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 38
          return homecalculationContainer("","Household services","How much did you pay the person who took care of your pet?","Amount pet care",210.0,"calculation","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 40
          return homecalculationContainer("","Household services","How much did you pay your household help for taking care of your pet?","Household help pet care",210.0,"calculation","");
        }
      }

      //Answer No 38
      else if(widget.CheckCompleteQuestion =="How much did you pay the person who took care of your pet?" &&  widget.CheckQuestion == "Amount pet care") {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }



      //Answer No 40
      else if(widget.CheckCompleteQuestion =="How much did you pay your household help for taking care of your pet?" &&  widget.CheckQuestion == "Household help pet care") {

        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }




      //Answer No 39

      else if(widget.CheckCompleteQuestion =="Would you like to enter several craftsmen services?" && widget.CheckQuestion == "More than one")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question 41

          return homesixoptioncontainer("","Household services","What kind of work did the craftsmen do?","Training",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"","");

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 49
          return homecalculationContainer("","Household services","How many services by craftsmen would you like to enter?","Craftsmen services",210.0,"calculation","");
        }
      }



      //Answer No 43
      else if(widget.CheckCompleteQuestion =="How much did you spend on the chimney sweep?" && widget.CheckQuestion == "Costs chimney sweep")
      {
        //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");
      }


      //Answer No 49
      else if(widget.CheckCompleteQuestion =="How many services by craftsmen would you like to enter?" && widget.CheckQuestion == "Craftsmen services")
      {
        //Question No 50
        return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
      }





      //Answer No 41
      else if((widget.CheckCompleteQuestion =="What kind of work did the craftsmen do?" || widget.CheckCompleteQuestion == "What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?") && (widget.CheckQuestion == "Training" || widget.CheckQuestion == "Craftsman service ${Questions.craftsmenLength}"))
      {


        if(widget.CheckAnswer[0] == "Maintenance")
        {
        //Question No 42
        return homecalculationContainer("","Household services","How much have you spent on maintenance?","Amount maintenance",210.0,"calculation",Questions.craftsmenText);

        }

        else if(widget.CheckAnswer[0] == "Repairs")
        {
          //Question No 44
          return homecalculationContainer("","Household services","How much did you spend on repairs?","Amount repairs",210.0,"calculation",Questions.craftsmenText);
        }

        else if(widget.CheckAnswer[0] == "Paintwork")
        {
          //Question No 45
          return homecalculationContainer("","Household services","How much did you spend on paintwork?","Amount paintwork",210.0,"calculation",Questions.craftsmenText);
        }

        else if(widget.CheckAnswer[0] == "Modernisations")
        {
          //Question No 46
          return homecalculationContainer("","Household services","How much did you spend on modernisation?","Costs modernisation",210.0,"calculation",Questions.craftsmenText);
        }

        else if(widget.CheckAnswer[0] == "Extension work")
        {
          //Question No 47
          return homecalculationContainer("","Household services","How much did you spend on extension work?","Amount extension work",210.0,"calculation",Questions.craftsmenText);
        }

        else if(widget.CheckAnswer[0] == "Plumbing")
        {
          //Question No 48
          return homecalculationContainer("","Household services","How much did you spend on supply works?","Amount supply works",210.0,"calculation",Questions.craftsmenText);
        }

      }


      //Answer No 42
      else if(widget.CheckCompleteQuestion =="How much have you spent on maintenance?" && widget.CheckQuestion == "Amount maintenance")
      {

        if(Questions.craftsmenLength <= Questions.totalCraftsmen && Questions.craftsmenLength > 0){
          //Question No 50
          return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
        }
        else{
       //Question No 98
        return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

      }

      }

      //Answer No 44
      else if(widget.CheckCompleteQuestion =="How much did you spend on repairs?" && widget.CheckQuestion == "Amount repairs")
      {
        if(Questions.craftsmenLength <= Questions.totalCraftsmen && Questions.craftsmenLength > 0){
          //Question No 50
          return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
        }
        else{
          //Question No 98
          return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

        }

      }

      //Answer No 45
      else if(widget.CheckCompleteQuestion =="How much did you spend on paintwork?" && widget.CheckQuestion == "Amount paintwork")
      {
        if(Questions.craftsmenLength <= Questions.totalCraftsmen && Questions.craftsmenLength > 0){
          //Question No 50
          return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
        }
        else{
          //Question No 98
          return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

        }
      }


      //Answer No 46
      else if(widget.CheckCompleteQuestion =="How much did you spend on modernisation?" && widget.CheckQuestion == "Costs modernisation")
      {
        if(Questions.craftsmenLength <= Questions.totalCraftsmen && Questions.craftsmenLength > 0){
          //Question No 50
          return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
        }
        else{
          //Question No 98
          return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

        }
      }

      //Answer No 47
      else if(widget.CheckCompleteQuestion =="How much did you spend on extension work?" && widget.CheckQuestion == "Amount extension work")
      {
        if(Questions.craftsmenLength <= Questions.totalCraftsmen && Questions.craftsmenLength > 0){
          //Question No 50
          return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
        }
        else{
          //Question No 98
          return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

        }
      }

      //Answer No 48
      else if(widget.CheckCompleteQuestion =="How much did you spend on supply works?" && widget.CheckQuestion == "Amount supply works")
      {
        if(Questions.craftsmenLength <= Questions.totalCraftsmen && Questions.craftsmenLength > 0){
          //Question No 50
          return homesixoptioncontainer("","Household services","What kind of services were done by craftsmen no. ${Questions.craftsmenLength}?","Craftsman service ${Questions.craftsmenLength}",["Maintenance","Repairs","Paintwork","Modernisations","Extension work","Plumbing"],210.0,"",Questions.craftsmenText);
        }
        else{
          //Question No 98
          return homeyesnoContainer("","Home","Did you have a second household due to work in 2019?","Second household",210.0,"","");

        }
      }



      //============= Big Detail (House Hold Services End)  =========================


      //============= Big Detail (Home Start) =========================


      //Answer No 98
      else if(widget.CheckCompleteQuestion =="Did you have a second household due to work in 2019?" && widget.CheckQuestion == "Second household")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          return FinishCategory("Home Category","Work Category");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 99
          return homeyesnoContainer("","Home","Did you bear at least 10% of your first household's costs?","10% of costs",210.0,"","");
        }
      }


      //Answer No 99
      else if(widget.CheckCompleteQuestion =="Did you bear at least 10% of your first household's costs?" && widget.CheckQuestion == "10% of costs")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          return FinishCategory("Home Category","Work Category");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 100
          //For No 320.0
          //For yes 210.0
          return homeyesnoContainer("","Home","You have stated you have a second household. Did you have more than one second household?","Multiple second households",210.0,"","");
        }
      }


      //Answer No 100

      else if(widget.CheckCompleteQuestion =="You have stated you have a second household. Did you have more than one second household?" && widget.CheckQuestion == "Multiple second households")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 101

          return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"","");
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
        //Question No 102
          return homecalculationContainer("","Home","How many second households would you like to enter?","Quantity",210.0,"calculation","");
        }
      }

      //Answer No 102
      else if(widget.CheckCompleteQuestion =="How many second households would you like to enter?" && widget.CheckQuestion == "Quantity")
      {
        //Question No 101
        return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
      }


      //Answer No 101

      else if(widget.CheckCompleteQuestion =="What is living situation in your second household?" && widget.CheckQuestion == "Living there")
      {
        if(widget.CheckAnswer[0] == "Rented apartment")
        {
            //Question No 103
          return homeaddressContainer("","Home","What is the address of your second household?","Address second household",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Own home")
        {
//Question No 103
          return homeaddressContainer("","Home","What is the address of your second household?","Address second household",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "With friends or family")
        {
         //Question No 103
          return homeaddressContainer("","Home","What is the address of your second household?","Address second household",210.0,"",Questions.secondHouseHoldText);
        }
      }


      //Answer No 103
      else if(widget.CheckCompleteQuestion =="What is the address of your second household?" && widget.CheckQuestion == "Address second household")
      {
       //Question No 104
        return homedateContainer("","Home","When did you move into your second household?","Moving to",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 104
      else if(widget.CheckCompleteQuestion =="When did you move into your second household?" && widget.CheckQuestion == "Moving to")
      {
       //Question No 105
        //For No 210.0
        //For Yes 420.0
        return homeyesnoContainer("","Home","Were you still living there by the end of year?","Living end of 2019",210.0,"",Questions.secondHouseHoldText);
      }



      //Answer No 105

      else if(widget.CheckCompleteQuestion =="Were you still living there by the end of year?" && widget.CheckQuestion == "Living end of 2019")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 106
          return homedateContainer("","Home","When did you move out of your second household?","Moved out on",420.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 107
          return homesixoptioncontainer("","Home","Why did you have a second household?","Reason for double housekeeping",["Transfer to another location","Change of employer","New workplace","Shorter commute","Private reasons"],210.0,"",Questions.secondHouseHoldText);
        }
      }


      //Answer No 106
      else if(widget.CheckCompleteQuestion =="When did you move out of your second household?" && widget.CheckQuestion == "Moved out on")
      {
        //Question No 107
        return homesixoptioncontainer("","Home","Why did you have a second household?","Reason for double housekeeping",["Transfer to another location","Change of employer","New workplace","Shorter commute","Private reasons"],210.0,"",Questions.secondHouseHoldText);
      }


      //Answer No 107
      else if(widget.CheckCompleteQuestion =="Why did you have a second household?" && widget.CheckQuestion == "Reason for double housekeeping")
      {

        if(widget.CheckAnswer[0] == "Transfer to another location")
        {
         //Question No 108
          return homeyesnoContainer("","Home","Have you had an external activity at this place before?","External activity before",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Change of employer")
        {
          //Question No 108
          return homeyesnoContainer("","Home","Have you had an external activity at this place before?","External activity before",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "New workplace")
        {
          //Question No 108
          return homeyesnoContainer("","Home","Have you had an external activity at this place before?","External activity before",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Shorter commute")
        {
          //Question No 108
          return homeyesnoContainer("","Home","Have you had an external activity at this place before?","External activity before",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Private reasons")
        {
          if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
            return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
          }

          else {
            return FinishCategory("Home Category", "Work Category");
          }
        }
      }


      //Answer No 108
      else if(widget.CheckCompleteQuestion =="Have you had an external activity at this place before?" && widget.CheckQuestion == "External activity before")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 109
          return homeyesnoContainer("","Home","Is the address of your main residence in 2019 equal to your current address?","Current address main residence",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 109
          return homeyesnoContainer("","Home","Is the address of your main residence in 2019 equal to your current address?","Current address main residence",210.0,"",Questions.secondHouseHoldText);
        }
      }


      //Answer No 109
      else if(widget.CheckCompleteQuestion =="Is the address of your main residence in 2019 equal to your current address?" && widget.CheckQuestion == "Current address main residence")
      {
        if(widget.CheckAnswer[0] == "No")
        {
        //Question No 110
          return homeaddressContainer("","Home","What is the address of your main residence in 2019?","Main residence 2019",210.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 111
          return homedateContainer("","Home","Since when do you have your primary residence at this address?","Primary residence since",420.0,"",Questions.secondHouseHoldText);
        }
      }

      //Answer No 110
      else if(widget.CheckCompleteQuestion =="What is the address of your main residence in 2019?" && widget.CheckQuestion == "Main residence 2019")
      {
       //Question No 111
        return homedateContainer("","Home","Since when do you have your primary residence at this address?","Primary residence since",420.0,"",Questions.secondHouseHoldText);
      }


      //Answer No 111
      else if(widget.CheckCompleteQuestion =="Since when do you have your primary residence at this address?" && widget.CheckQuestion == "Primary residence since")
      {
       //Question No 112
        return homemultipleoptionsContainerNo("","Home","How did you travel between your households?","Mode of transport",["Car","Bus and train","Airplane","Car sharing","Company car","Motorcycle","Collective transport","Free collective transport","Ferry"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],210.0,"None",Questions.secondHouseHoldText);
      }



      // ======== Travel Between Household Start ========
      //Answer No 112
      else if(widget.CheckCompleteQuestion =="How did you travel between your households?" && widget.CheckQuestion == "Mode of transport")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Car") {
            //Question No 113
            Questions.modeOfTransport = "Car";
            //Agar ya car ka liya agaya to phir multiple option ma baqi kisi ka liya nhi aiga
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }
          else if(widget.CheckAnswer[m] == "Bus and train") {
            //Question No 113
            Questions.modeOfTransport = "Bus and train";
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Airplane") {
            //Question No 113
            Questions.modeOfTransport = "Airplane";
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Car sharing") {
            //Question No 113
            Questions.modeOfTransport = "Car sharing";
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Company car") {
            //Question New
            Questions.modeOfTransport = "Company car";
            return homecalculationContainer("","Home","How often did you travel between your first and second household?","No. regular drives",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Motorcycle") {
            //Question 113
            Questions.modeOfTransport = "Motorcycle";
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Collective transport") {
            //Question 113
            Questions.modeOfTransport = "Collective transport";
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Free collective transport") {
            //Question New
            Questions.modeOfTransport = "Free collective transport";
            return homecalculationContainer("","Home","How often did you travel between your first and second household?","No. regular drives",210.0,"",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Ferry") {
            //Question 113
            Questions.modeOfTransport = "Ferry";
            return homecalculationContainer("","Home","How many times did you travel between your first and second household?","Number of journeys",210.0,"",Questions.secondHouseHoldText);

          }


        }

      }


      //Answer No 113

      else if(widget.CheckCompleteQuestion =="How many times did you travel between your first and second household?" && widget.CheckQuestion == "Number of journeys")
      {



        if(Questions.modeOfTransport == "Car"){
          //Yaha sa container change hoga is tara ka
           //Question No 114
            return homecalculationContainer("","Home","Where was the start and end point of your car journey?","By car",420.0,"",Questions.secondHouseHoldText);
        }

        else if(Questions.modeOfTransport == "Bus and train"){
//Yaha sa container change hoga is tara ka
          //Question No 115
          return homecalculationContainer("","Home","Where was the start and end point of your journey by train or bus?","By train or bus",210.0,"",Questions.secondHouseHoldText);
        }

        else if(Questions.modeOfTransport == "Airplane"){
          //Question No 125
          return homecalculationContainer("","Home","How much did you spend on flight tickets?","Flight costs",210.0,"",Questions.secondHouseHoldText);
        }

        else if(Questions.modeOfTransport == "Car sharing"){
          //Yaha sa container change hoga is tara ka
          //Question No 116
          return homecalculationContainer("","Home","Where was the start and end point of your journey via car sharing?","Car sharing",210.0,"",Questions.secondHouseHoldText);
        }

        else if(Questions.modeOfTransport == "Motorcycle"){
          //Yaha sa container change hoga is tara ka
          //Question No 117
          return homecalculationContainer("","Home","Please enter the route you traveled by motorcycle?","By motorcycle",420.0,"",Questions.secondHouseHoldText);
        }

        else if(Questions.modeOfTransport == "Collective transport"){
          //Yaha sa container change hoga is tara ka
          //Question No 118
          return homecalculationContainer("","Home","Where was the start and end point of your journey via company transport?","Company transport",210.0,"",Questions.secondHouseHoldText);
        }


        else if(Questions.modeOfTransport == "Ferry"){
          //Question No 126
          return homecalculationContainer("","Home","How much did you spend on ferry tickets?","Ferry costs",420.0,"",Questions.secondHouseHoldText);
        }



      }


      //Answer No 114

      else if(widget.CheckCompleteQuestion =="Where was the start and end point of your car journey?" && widget.CheckQuestion == "By car")
      {

        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);

      }


      //Answer No 115
      else if(widget.CheckCompleteQuestion =="Where was the start and end point of your journey by train or bus?" && widget.CheckQuestion == "By train or bus")
      {

        //Question No 119
        //For No 420.0
        //For Yes 210.0
        return homeyesnoContainer("","Home","We have calculated an amount of €4.80 as travelling expenses. Were your actual costs for public transport higher than this?","Higher costs",210.0,"",Questions.secondHouseHoldText);

      }


      //Answer No 119
      else if(widget.CheckCompleteQuestion =="We have calculated an amount of €4.80 as travelling expenses. Were your actual costs for public transport higher than this?" && widget.CheckQuestion == "Higher costs")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 127
          return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 120
          return homecalculationContainer("","Home","How much did you spend on public transport?","Costs bus / train",210.0,"calculation",Questions.secondHouseHoldText);
        }
      }


      //Answer No 120
      else if(widget.CheckCompleteQuestion =="How much did you spend on public transport?" && widget.CheckQuestion == "Costs bus / train")
      {
        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
      }


      //Answer No 125
      else if(widget.CheckCompleteQuestion =="How much did you spend on flight tickets?" && widget.CheckQuestion == "Flight costs")
      {
        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
      }



      //Answer No 116
      else if(widget.CheckCompleteQuestion =="Where was the start and end point of your journey via car sharing?" && widget.CheckQuestion == "Car sharing")
      {

        //Question No 121
        //For No 420.0
        //For Yes 210.0
        return homeyesnoContainer("","Home","We have calculated an amount of €4.80 as travelling expenses. Were your actual costs for car sharing higher than this?","Higher costs",210.0,"",Questions.secondHouseHoldText);

      }


      //Answer No 121

      else if(widget.CheckCompleteQuestion =="We have calculated an amount of €4.80 as travelling expenses. Were your actual costs for car sharing higher than this?" && widget.CheckQuestion == "Higher costs")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 127
          return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 122
          return homecalculationContainer("","Home","How much did you spend on car sharing?","Costs car sharing",420.0,"calculation",Questions.secondHouseHoldText);
        }
      }

      //Answer No 122

      else if(widget.CheckCompleteQuestion =="How much did you spend on car sharing?" && widget.CheckQuestion == "Costs car sharing")
      {
        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
      }


      //Answer New
    else if(widget.CheckCompleteQuestion =="How often did you travel between your first and second household?" && widget.CheckQuestion == "No. regular drives")
    {
    //Question No 127
    return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
    }


    //Answer No 117
      else if(widget.CheckCompleteQuestion =="Please enter the route you traveled by motorcycle?" && widget.CheckQuestion == "By motorcycle")
      {
        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
      }



      //Answer No 118
      else if(widget.CheckCompleteQuestion =="Where was the start and end point of your journey via company transport?" && widget.CheckQuestion == "Company transport")
      {

        //Question No 123
        //For No 420.0
        //For Yes 210.0
        return homeyesnoContainer("","Home","We have calculated an amount of €4.80 as travelling expenses. Were your actual costs for company transport higher than this?","Costs company transport",210.0,"",Questions.secondHouseHoldText);

      }


      //Answer No 123
      else if(widget.CheckCompleteQuestion =="We have calculated an amount of €4.80 as travelling expenses. Were your actual costs for company transport higher than this?" && widget.CheckQuestion == "Costs company transport")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 127
          return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 124
          return homecalculationContainer("","Home","How much did you spend on company transport?","Costs company transport",210.0,"calculation",Questions.secondHouseHoldText);
        }
      }


      //Answer No 124
      else if(widget.CheckCompleteQuestion =="How much did you spend on company transport?" && widget.CheckQuestion == "Costs company transport")
      {
        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
      }



      //Answer No 126
      else if(widget.CheckCompleteQuestion =="How much did you spend on ferry tickets?" && widget.CheckQuestion == "Ferry costs")
      {
        //Question No 127
        return homemultipleoptionsContainerNo("","Home","What kind of costs did you have for your second home?","Costs second home",["Rent","Additional property expenses","Furnishing","Parking space","None"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png"],210.0,"None",Questions.secondHouseHoldText);
      }

      // ====== Travel Between Household End ======

      // ====== Costs Second Home Starts ======

      //Answer No 127
      else if(widget.CheckCompleteQuestion =="What kind of costs did you have for your second home?" && widget.CheckQuestion == "Costs second home")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Rent")
          {
           //Question No 128
            return homecalculationContainer("","Home","How much was annual basic rent?","Basic rent",420.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Additional property expenses")
          {
          //Question No 129
            return homecalculationContainer("","Home","What were your ancillary costs?","Ancillary costs",420.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Furnishing")
          {
          //Question No 131
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 488 EUR on any piece of furniture or household appliance?",">488 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Desk","Kitchen","Wardrobe","Sofa","Shelf","Other furniture","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Parking space")
          {
          //Question No 130
            return homecalculationContainer("","Home","How much did you spend on your parking space?","Parking space",420.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "None")
          {
            //Question No 167
            return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);
          }




        }

      }


      //Answer No 128
      else if(widget.CheckCompleteQuestion =="How much was annual basic rent?" && widget.CheckQuestion == "Basic rent")
      {
     //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);
      }


      //Answer No 129
      else if(widget.CheckCompleteQuestion =="What were your ancillary costs?" && widget.CheckQuestion == "Ancillary costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);
      }


      //Answer No 130
      else if(widget.CheckCompleteQuestion =="How much did you spend on your parking space?" && widget.CheckQuestion == "Parking space")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);
      }


      //====== more than 488 start ====== //
      //Answer No 131
      else if(widget.CheckCompleteQuestion =="Did you spend more than 488 EUR on any piece of furniture or household appliance?" && widget.CheckQuestion == ">488 EUR")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Dryer")
          {
             Questions.Appliance = "Dryer";
             //Question No 132
             return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Refrigerator")
          {
            Questions.Appliance = "Refrigerator";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Microwave")
          {
            Questions.Appliance = "Microwave";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Computer")
          {
            Questions.Appliance = "Computer";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Computer accessory")
          {
            Questions.Appliance = "Computer accessory";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "TV")
          {
            Questions.Appliance = "TV";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Dishwasher")
          {
            Questions.Appliance = "Dishwasher";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Washing Machine")
          {
            Questions.Appliance = "Washing Machine";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Bed")
          {
            Questions.Appliance = "Bed";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Desk")
          {
            Questions.Appliance = "Desk";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Kitchen")
          {
            Questions.Appliance = "Kitchen";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Wardrobe")
          {
            Questions.Appliance = "Wardrobe";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Sofa")
          {
            Questions.Appliance = "Sofa";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Shelf")
          {
            Questions.Appliance = "Shelf";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Other furniture")
          {
            Questions.Appliance = "Other furniture";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "No")
          {
            Questions.Appliance = "No";
            //Question No 132
            return homemultipleoptionsContainerNo("","Home","Did you spend more than 952 EUR on any appliance or piece of furniture?",">952 EUR",["Dryer","Refrigerator","Microwave","Computer","Computer accessory","TV","Dishwasher","Washing Machine","Bed","Table","Kitchen","Wardrobe","Sofa","Shelves","Other","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png"],420.0,"No",Questions.secondHouseHoldText);
          }
        }
      }

      //====== more than 488 end ====== //


      //====== more than 952 start ====== //

      //Answer No 132
      else if(widget.CheckCompleteQuestion =="Did you spend more than 952 EUR on any appliance or piece of furniture?" && widget.CheckQuestion == ">952 EUR")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Dryer")
          {
            //Question No 133
            return homecalculationContainer("","Home","How much did you spend on the dryer?","Amount: dryer",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Refrigerator")
          {
           //Question No 135
            return homecalculationContainer("","Home","How much did you spend on the refrigerator?","Amount refrigerator",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Microwave")
          {
            //Question No 137
            return homecalculationContainer("","Home","How much did you spend on the microwave?","Amount: microwave",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Computer")
          {
            //Question No 139
            return homecalculationContainer("","Home","How much did you spend on the computer?","Amount: computer",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Computer accessory")
          {
            //Question No 141
            return homecalculationContainer("","Home","How much did you spend on the computer accessory?","Amount: computer accessory",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "TV")
          {
            //Question No 143
            return homecalculationContainer("","Home","How much did you spend on the TV?","Amount: TV",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Dishwasher")
          {
           //Question No 145
            return homecalculationContainer("","Home","How much did you spend on the dishwasher?","Amount: dishwasher",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Washing Machine")
          {
           //Question No 147
            return homecalculationContainer("","Home","How much did you spend on the washing machine?","Amount: washing machine",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Bed")
          {
            //Question No 149
            return homecalculationContainer("","Home","How much did you spend on the bed?","Amount: bed",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Table")
          {
            //Question No 151
            return homecalculationContainer("","Home","How much did you spend on the table?","Amount: table",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Kitchen")
          {
            //Question No 153
            return homecalculationContainer("","Home","How much did you spend on the kitchen?","Amount: kitchen",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Wardrobe")
          {
            //Question No 155
            return homecalculationContainer("","Home","How much did you spend on the wardrobe?","Amount: wardrobe",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Sofa")
          {
            //Question No 157
            return homecalculationContainer("","Home","How much did you spend on the sofa?","Amount: sofa",210.0,"calculation",Questions.secondHouseHoldText);

          }

          else if(widget.CheckAnswer[m] == "Shelves")
          {
            //Question No 159
            return homecalculationContainer("","Home","How much did you spend on the shelf?","Amount: shelf",210.0,"calculation",Questions.secondHouseHoldText);


          }

          else if(widget.CheckAnswer[m] == "Other")
          {
//Question No 161

            return homecalculationContainer("","Home","Which other fixtures did you buy?","Other fixture",210.0,"",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "No")
          {

            if(Questions.Appliance == "Dryer") {
              //Question No 133
              return homecalculationContainer("","Home","How much did you spend on the dryer?","Amount: dryer",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Refrigerator") {
              //Question No 135
              return homecalculationContainer("","Home","How much did you spend on the refrigerator?","Amount refrigerator",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Microwave") {
              //Question No 137
              return homecalculationContainer("","Home","How much did you spend on the microwave?","Amount: microwave",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Computer") {
              //Question No 139
              return homecalculationContainer("","Home","How much did you spend on the computer?","Amount: computer",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Computer accessory") {
              //Question No 141
              return homecalculationContainer("","Home","How much did you spend on the computer accessory?","Amount: computer accessory",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "TV") {
              //Question No 143
              return homecalculationContainer("","Home","How much did you spend on the TV?","Amount: TV",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Dishwasher") {
              //Question No 145
              return homecalculationContainer("","Home","How much did you spend on the dishwasher?","Amount: dishwasher",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Washing Machine") {
              //Question No 147
              return homecalculationContainer("","Home","How much did you spend on the washing machine?","Amount: washing machine",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Bed") {
              //Question No 149
              return homecalculationContainer("","Home","How much did you spend on the bed?","Amount: bed",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Desk") {
              //Question No 151
              return homecalculationContainer("","Home","How much did you spend on the table?","Amount: table",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Kitchen") {
              //Question No 153
              return homecalculationContainer("","Home","How much did you spend on the kitchen?","Amount: kitchen",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Wardrobe") {
              //Question No 155
              return homecalculationContainer("","Home","How much did you spend on the wardrobe?","Amount: wardrobe",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Sofa") {
              //Question No 157
              return homecalculationContainer("","Home","How much did you spend on the sofa?","Amount: sofa",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Shelf") {
              //Question No 159
              return homecalculationContainer("","Home","How much did you spend on the shelf?","Amount: shelf",210.0,"calculation",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "Other furniture") {
              //Question No 161
              return homecalculationContainer("","Home","Which other fixtures did you buy?","Other fixture",210.0,"",Questions.secondHouseHoldText);
            }
            else if(Questions.Appliance == "No") {
              //Question No 167
              return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);
            }


          }
        }
      }

      //Dryer Starts

      //Answer No 133
      else if(widget.CheckCompleteQuestion =="How much did you spend on the dryer?" && widget.CheckQuestion == "Amount: dryer")
      {
//Question No 134
        return homedateContainer("","Home","When did you buy the dryer?","Date: dryer",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 134
      else if(widget.CheckCompleteQuestion =="When did you buy the dryer?" && widget.CheckQuestion == "Date: dryer")
      {
       //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }


      //Dryer Ends



      //Refrigerator Starts

      //Answer No 135
      else if(widget.CheckCompleteQuestion =="How much did you spend on the refrigerator?" && widget.CheckQuestion == "Amount refrigerator")
      {
//Question No 136
        return homedateContainer("","Home","When did you buy the refrigerator?","Date: refrigerator",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 136
      else if(widget.CheckCompleteQuestion =="When did you buy the refrigerator?" && widget.CheckQuestion == "Date: refrigerator")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }


      //Refrigerator Ends



      //Microwave Starts

      //Answer No 137
      else if(widget.CheckCompleteQuestion =="How much did you spend on the microwave?" && widget.CheckQuestion == "Amount: microwave")
      {
//Question No 138
        return homedateContainer("","Home","When did you buy the microwave?","Date: microwave",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 138
      else if(widget.CheckCompleteQuestion =="When did you buy the microwave?" && widget.CheckQuestion == "Date: microwave")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //Microwave Ends


      //Computer Starts

      //Answer No 141
      else if(widget.CheckCompleteQuestion =="How much did you spend on the computer accessory?" && widget.CheckQuestion == "Amount: computer accessory")
      {
//Question No 142
        return homedateContainer("","Home","When did you buy the computer accessory?","Date: computer accessory",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 142
      else if(widget.CheckCompleteQuestion =="When did you buy the computer accessory?" && widget.CheckQuestion == "Date: computer accessory")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //Computer Ends



      //Computer accessory Starts

      //Answer No 139
      else if(widget.CheckCompleteQuestion =="How much did you spend on the computer?" && widget.CheckQuestion == "Amount: computer")
      {
//Question No 140
        return homedateContainer("","Home","When did you buy the computer?","Date: computer",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 140
      else if(widget.CheckCompleteQuestion =="When did you buy the computer?" && widget.CheckQuestion == "Date: computer")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //Computer accessory Ends



      //TV Starts

      //Answer No 143
      else if(widget.CheckCompleteQuestion =="How much did you spend on the TV?" && widget.CheckQuestion == "Amount: TV")
      {
//Question No 144
        return homedateContainer("","Home","When did you buy the TV?","Date: TV",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 144
      else if(widget.CheckCompleteQuestion =="When did you buy the TV?" && widget.CheckQuestion == "Date: TV")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //TV Ends



      //dishwasher Starts

      //Answer No 145
      else if(widget.CheckCompleteQuestion =="How much did you spend on the dishwasher?" && widget.CheckQuestion == "Amount: dishwasher")
      {
//Question No 146
        return homedateContainer("","Home","When did you buy the dishwasher?","Date: dishwasher",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 146
      else if(widget.CheckCompleteQuestion =="When did you buy the dishwasher?" && widget.CheckQuestion == "Date: dishwasher")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //dishwasher Ends



      //washing machine Starts

      //Answer No 147
      else if(widget.CheckCompleteQuestion =="How much did you spend on the washing machine?" && widget.CheckQuestion == "Amount: washing machine")
      {
//Question No 148
        return homedateContainer("","Home","When did you buy the washing machine?","Date: washing machine",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 148
      else if(widget.CheckCompleteQuestion =="When did you buy the washing machine?" && widget.CheckQuestion == "Date: washing machine")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //washing machine Ends


      //bed Starts

      //Answer No 149
      else if(widget.CheckCompleteQuestion =="How much did you spend on the bed?" && widget.CheckQuestion == "Amount: bed")
      {
//Question No 150
        return homedateContainer("","Home","When did you buy the bed?","Date: bed",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 150
      else if(widget.CheckCompleteQuestion =="When did you buy the bed?" && widget.CheckQuestion == "Date: bed")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //bed Ends



//table Starts

      //Answer No 151
      else if(widget.CheckCompleteQuestion =="How much did you spend on the table?" && widget.CheckQuestion == "Amount: table")
      {
//Question No 152
        return homedateContainer("","Home","When did you buy the table?","Date: table",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 152
      else if(widget.CheckCompleteQuestion =="When did you buy the table?" && widget.CheckQuestion == "Date: table")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //table Ends



      //kitchen Starts

      //Answer No 153
      else if(widget.CheckCompleteQuestion =="How much did you spend on the kitchen?" && widget.CheckQuestion == "Amount: kitchen")
      {
//Question No 154

        return homedateContainer("","Home","When did you buy the kitchen?","Date: kitchen",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 154
      else if(widget.CheckCompleteQuestion =="When did you buy the kitchen?" && widget.CheckQuestion == "Date: kitchen")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //kitchen Ends


      //wardrobe Starts

      //Answer No 155
      else if(widget.CheckCompleteQuestion =="How much did you spend on the wardrobe?" && widget.CheckQuestion == "Amount: wardrobe")
      {
//Question No 156
        return homedateContainer("","Home","When did you buy the wardrobe?","Date: wardrobe",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 156
      else if(widget.CheckCompleteQuestion =="When did you buy the wardrobe?" && widget.CheckQuestion == "Date: wardrobe")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //wardrobe Ends


      //sofa Starts

      //Answer No 157
      else if(widget.CheckCompleteQuestion =="How much did you spend on the sofa?" && widget.CheckQuestion == "Amount: sofa")
      {
//Question No 158
        return homedateContainer("","Home","When did you buy the sofa?","Date: sofa",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 158
      else if(widget.CheckCompleteQuestion =="When did you buy the sofa?" && widget.CheckQuestion == "Date: sofa")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //sofa Ends



      //shelf Starts

      //Answer No 159
      else if(widget.CheckCompleteQuestion =="How much did you spend on the shelf?" && widget.CheckQuestion == "Amount: shelf")
      {
//Question No 160
        return homedateContainer("","Home","When did you buy the shelf?","Date: shelf",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 161
      else if(widget.CheckCompleteQuestion =="When did you buy the shelf?" && widget.CheckQuestion == "Date: shelf")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }


      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //shelf Ends



//other fixture Starts

      //Answer No 161
      else if(widget.CheckCompleteQuestion =="Which other fixtures did you buy?" && widget.CheckQuestion == "Other fixture")
      {
//Question No 162
        return homedateContainer("","Home","How much did you spend on the ${Questions.otherFixture}?","Amount: other",210.0,"",Questions.secondHouseHoldText);

      }

      //Answer No 162
      else if(widget.CheckCompleteQuestion =="How much did you spend on the ${Questions.otherFixture}?" && widget.CheckQuestion == "Amount: other")
      {
//Question No 163
        return homedateContainer("","Home","When did you buy the ${Questions.otherFixture}?","Date: other",210.0,"",Questions.secondHouseHoldText);

      }



      //Answer No 163
      else if(widget.CheckCompleteQuestion =="When did you buy the ${Questions.otherFixture}?" && widget.CheckQuestion == "Date: other")
      {
//        //Question No 166
//        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation","");
          //Question No 164
        return homeyesnoContainer("","Home","We appreciate you depreciate the ${Questions.otherFixture} over a period of 10 years. Do you agree?","Usual depreciation",210.0,"",Questions.secondHouseHoldText);
      }


      //Answer No 164

      else if(widget.CheckCompleteQuestion =="We appreciate you depreciate the ${Questions.otherFixture} over a period of 10 years. Do you agree?" && widget.CheckQuestion == "Usual depreciation")
      {
        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 165
          return homecalculationContainer("","Home","How many years are you going to use the ${Questions.otherFixture} for?","Correct depreciation",420.0,"",Questions.secondHouseHoldText);
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 166
          return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);
        }
      }


      //Answer No 165
      else if(widget.CheckCompleteQuestion =="How many years are you going to use the ${Questions.otherFixture} for?" && widget.CheckQuestion == "Correct depreciation")
      {
        //Question No 166
        return homecalculationContainer("","Home","What other furnishing costs did you have?","Furnishing costs",420.0,"calculation",Questions.secondHouseHoldText);

      }




      //Answer No 166
      else if(widget.CheckCompleteQuestion =="What other furnishing costs did you have?" && widget.CheckQuestion == "Furnishing costs")
      {
        //Question No 167
        return homemultipleoptionsContainerNo("","Home","Did you have any other costs due to double housekeeping?","Type of costs",["Dry cleaning costs","Broadcasting fee","Second residence tax","Trips to flat viewings","Broker’s fee","Other costs","No"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/disabilityoption.png","images/disabilityoption.png","images/disabilityoption.png"],210.0,"No",Questions.secondHouseHoldText);

      }

      //other fixture Ends

      //====== more than 952 end ====== //




      //Double housekeeping start
      //Answer No 167
      else if(widget.CheckCompleteQuestion =="Did you have any other costs due to double housekeeping?" && widget.CheckQuestion == "Type of costs")
      {
        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Dry cleaning costs")
          {

          //Question No 168
            return homecalculationContainer("","Home","How much was the cleaning?","Cleaning costs",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Broadcasting fee")
          {
           //Question No 169
           return homecalculationContainer("","Home","How much did you spend on the broadcasting license fee?","Costs broadcasting fee",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Second residence tax")
          {
           //Question No 170
            return homecalculationContainer("","Home","How much did you spend on taxes for your second household?","Second home tax",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Trips to flat viewings")
          {
            //Question No 171
            return homecalculationContainer("","Home","How much have you spent on journeys to apartment viewings?","Apartment viewings",210.0,"calculation",Questions.secondHouseHoldText);
          }

          else if(widget.CheckAnswer[m] == "Broker’s fee")
          {
            //Question No 172
            return homecalculationContainer("","Home","How much was the brokerage fee?","Broker's fee",210.0,"calculation",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "Other costs")
          {
             //Question No 173
            return homecalculationContainer("","Home","What type of other costs did you had?","Kind of costs",210.0,"",Questions.secondHouseHoldText);
          }
          else if(widget.CheckAnswer[m] == "No")
          {
            if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
              return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
            }

            else {
              return FinishCategory("Home Category", "Work Category");
            }
          }

          }

          }


      //Answer No 168
      else if(widget.CheckCompleteQuestion =="How much was the cleaning?" && widget.CheckQuestion == "Cleaning costs")
      {

       if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
         return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
       }

       else {
        return FinishCategory("Home Category", "Work Category");
      }
      }


      //Answer No 169
      else if(widget.CheckCompleteQuestion =="How much did you spend on the broadcasting license fee?" && widget.CheckQuestion == "Costs broadcasting fee")
      {
        if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
          return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
        }

        else {
          return FinishCategory("Home Category", "Work Category");
        }

      }


      //Answer No 170
      else if(widget.CheckCompleteQuestion =="How much did you spend on taxes for your second household?" && widget.CheckQuestion == "Second home tax")
      {
        if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
          return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
        }

        else {
          return FinishCategory("Home Category", "Work Category");
        }

      }

      //Answer No 171
      else if(widget.CheckCompleteQuestion =="How much have you spent on journeys to apartment viewings?" && widget.CheckQuestion == "Apartment viewings")
      {
        if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
          return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
        }

        else {
          return FinishCategory("Home Category", "Work Category");
        }

      }

      //Answer No 172
      else if(widget.CheckCompleteQuestion =="How much was the brokerage fee?" && widget.CheckQuestion == "Broker's fee")
      {
        if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
          return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
        }

        else {
          return FinishCategory("Home Category", "Work Category");
        }

      }

      //Answer No 173
      else if(widget.CheckCompleteQuestion =="What type of other costs did you had?" && widget.CheckQuestion == "Kind of costs")
      {
        //Question No 174
        return homecalculationContainer("","Home","How much did you spend on that?","Amount other",210.0,"",Questions.secondHouseHoldText);

      }

//Answer No 174
      else if(widget.CheckCompleteQuestion =="How much did you spend on that?" && widget.CheckQuestion == "Amount other")
      {
        if((Questions.secondHouseHoldLength <= Questions.totalSecondHouseHold) && Questions.secondHouseHoldLength > 0){
          return homethreeoptioncontainer("","Home","What is living situation in your second household?","Living there",["Rented apartment","Own home","With friends or family"],210.0,"",Questions.secondHouseHoldText);
        }

        else {
          return FinishCategory("Home Category", "Work Category");
        }

      }









      //Double housekeeping end




      // ====== Costs Second Home Ends ======

      //============= Big Detail (Home End) =========================


    }
  }


  Widget homeaddressContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeAddressContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:210.0,additionalData:AdditionalData,multipleData:MultipleData);

  }


  Widget homeyesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeYesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:210.0,additionalData:AdditionalData,multipleData:MultipleData);
  }


  Widget homemultitwooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeMultiTwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:320.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget homemultipleoptionsContainerNo(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeMultipleOptionsContainerNo(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:420.0,additionalData:AdditionalData,multipleData:MultipleData);
  }


  Widget homecalculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeCalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:210.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

  Widget homesixoptioncontainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeSixOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:420.0,additionalData:AdditionalData,multipleData:MultipleData);
  }


  Widget homethreeoptioncontainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeThreeOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:320.0,additionalData:AdditionalData,multipleData:MultipleData);
  }


  Widget homedateContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return HomeDateContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:210.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

}