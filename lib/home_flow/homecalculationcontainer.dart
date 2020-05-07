import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/home_flow/homemainquestions.dart';

class HomeCalculationContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;


  HomeCalculationContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _HomeCalculationContainerState createState() => _HomeCalculationContainerState();
}

class _HomeCalculationContainerState extends State<HomeCalculationContainer> {
  TextEditingController calculations = TextEditingController();
  Questions qu =Questions();
  bool open = false;
  void timer() {
    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open = true;
//        single=true;
      });
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timer();
  }
  @override
  Widget build(BuildContext context) {

    double minHeight = MediaQuery
        .of(context)
        .size
        .height * .004;
//    double maxHeight = MediaQuery
//        .of(context)
//        .size
//        .height * .3;

    //double maxHeight = 210.0;
    double maxHeight = widget.completeQuestion == "What was the bill amount for services or craftsmen on your utilities statement (excluding heating, electricity, insurances etc.)?" ? 270.0:widget.containerSize;
    // var maskTextInputFormatter = MaskTextInputFormatter(mask: "## / ## / ####");
//filter: { "#": RegExp(r'[0-9]')

    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,
//                    constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          //color: Colors.grey[200],
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child:
        SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child:
            InkWell(
//                            onTap: () => setState(() => open = !open),
              child:
              Column(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
                        ),
                        height: widget.completeQuestion == "What was the bill amount for services or craftsmen on your utilities statement (excluding heating, electricity, insurances etc.)?" ? 190.0:140.0,
                        width: MediaQuery.of(context).size.width,

                      ),


                      Positioned(
                          right: MediaQuery.of(context).size.width* 0.04 ,
                          top: 7.0,
                          child: GestureDetector(
                              onTap: (){

                              },
                              child:Image(image: AssetImage("images/question_mark.png"),width: 23.0,height: 23.0,))
                      ),

                      Positioned(
                          left: MediaQuery.of(context).size.width / 30.0,
                          top: 30.0,
                          child:Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: Text(widget.multipleData,style: TextStyle(fontSize:12.5,color: Colors.black),),
                          )),

                      Positioned(
                        top: 52.0,
                        left: MediaQuery.of(context).size.width / 30.0,
                        right: MediaQuery.of(context).size.width / 30.0,

                        child:Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child:Text(widget.completeQuestion,style: TextStyle(fontSize:19.0,color: Colors.white,wordSpacing: 3.0,fontWeight: FontWeight.w600),)),

                      )

                    ],
                  ),
                  SizedBox(height: 10.0,),

                  Card(
                      elevation: 6.0,
                      child:Container(
                        //margin: EdgeInsets.only(right: 60.0),
//                                      decoration: new BoxDecoration(boxShadow: [
//                                        new BoxShadow(
//                                          color: Colors.grey,
//                                          blurRadius: 5.0,
//                                        ),
//                                      ]),
                          width: MediaQuery.of(context).size.width,
                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                  color:Colors.white,
                                  width: MediaQuery.of(context).size.width*0.45,
                                  height: 60.0,
//                    color: Colors.wh,
                                  child: TextFormField(
                                    controller: calculations,
                                    //inputFormatters: [maskTextInputFormatter],
                                    //keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

                                        hintText: "0",
                                        contentPadding: EdgeInsets.only(left: 15.0)
                                    ),
                                  )
                              ),

                              Container(
                                //margin: EdgeInsets.only(left: 20.0),
                                // color: Colors.blue,
                                width: MediaQuery.of(context).size.width*0.20,
                                child:GestureDetector(
                                  onTap: (){
                                    AddData();
                                  },
                                  child: Text("Confirm",style: TextStyle(color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),fontWeight: FontWeight.w600,fontSize: 16.0)),
                                ),)
                            ],
                          ))),

                ],
              ),

            )));

  }


  void AddData()
  {
//Relocation
    if(widget.completeQuestion == "How often did you move for job-related reasons in 2019?" && widget.questionOption == "Number of moves")
  {

    Questions.totalRelocation = int.parse(calculations.text);
    print("Total Relocation:"+Questions.totalSecondHouseHold.toString());
    Questions.relocationLength += 1;
    Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

  }
//Relocation
    else if(widget.completeQuestion == "How much was the broker’s fee?" && widget.questionOption == "Broker" && Questions.relocationLength > 0)
    {
      Questions.relocationLength += 1;
      Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

    }
//Relocation
    else if(widget.completeQuestion == "How much were your travel costs for apartment viewings?" && widget.questionOption == "Apartment viewings" && Questions.relocationLength > 0)
    {
      Questions.relocationLength += 1;
      Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

    }
//Relocation
    else if(widget.completeQuestion == "How much did you pay in rent for the unused apartment?" && widget.questionOption == "Double rent payments" && Questions.relocationLength > 0)
    {
      Questions.relocationLength += 1;
      Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

    }
//Relocation
    else if(widget.completeQuestion == "How much were the damages due to transport?" && widget.questionOption == "Damages during transport" && Questions.relocationLength > 0)
    {
      Questions.relocationLength += 1;
      Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

    }
//Relocation
    else if(widget.completeQuestion == "How much did you spend on tutoring due to change of school?" && widget.questionOption == "Private tutoring" && Questions.relocationLength > 0)
    {
      Questions.relocationLength += 1;
      Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

    }
//Relocation
    else if(widget.completeQuestion == "Please enter any other costs you had due to relocation?" && widget.questionOption == "Other costs" && Questions.relocationLength > 0)
    {
      Questions.relocationLength += 1;
      Questions.relocationText ="RELOCATION "+Questions.relocationLength.toString();

    }


//House hold Services
    else if(widget.completeQuestion == "How many utility statements would you like to enter?" && widget.questionOption == "Number of bills")
      {

        Questions.totalUtilityBill = int.parse(calculations.text);
        print("Total utility bills:"+Questions.totalUtilityBill.toString());
        Questions.utilityBillLength += 1;

      }

//House hold Services
    else if(widget.completeQuestion == "What was the bill amount for services or craftsmen on your utilities statement (excluding heating, electricity, insurances etc.)?" && widget.questionOption == "Amount for ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;

    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for cleaning / pest control from utility bill no. ${Questions.utilityBillLength} relating to your flat?" && widget.questionOption == "Share cleaning/pest control ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for gardening from utility bill no. ${Questions.utilityBillLength} relating to your flat?" && widget.questionOption == "Share gardening ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for janitorial services from utility bill no. ${Questions.utilityBillLength} relating to your flat?" && widget.questionOption == "Share janitorial service ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for maintenance / repair from utility bill no. ${Questions.utilityBillLength} relating to your flat?" && widget.questionOption == "Share maintenance/repair ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for chimney sweeper from utility bill no. ${Questions.utilityBillLength} relating to your flat?" && widget.questionOption == "Share chimney sweeper ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for winter services from utility bill no. ${Questions.utilityBillLength} relating to your flat?" && widget.questionOption == "Share winter services ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How much is your share for other services from utility bill no. ${Questions.utilityBillLength} relating to your flat (excluding heating, electricity, insurances etc.)?" && widget.questionOption == "Share other services ${Questions.utilityBillLength}")
    {
      Questions.utilityBillLength += 1;
      print("utility print is:"+Questions.utilityBillLength.toString());
    }
//House hold Services
    else if(widget.completeQuestion == "How many 'WEG' statements would you like to enter?" && widget.questionOption == "Number of 'WEG' statements")
    {
      Questions.totalWEG = int.parse(calculations.text);
      print("Total WEG:"+Questions.totalUtilityBill.toString());
      Questions.WEGLength += 1;
    }
    //House hold Services
    else if(widget.completeQuestion == "How much was invoiced for utility services on your 'WEG' bill?" && widget.questionOption == "'WEG' ${Questions.WEGLength}")
    {
      Questions.WEGLength += 1;
    }
//House hold Services
    else if(widget.completeQuestion == "Which other fixtures did you buy?" && widget.questionOption == "Other fixture")
    {
      Questions.otherFixture = calculations.text.toString();
    }

    //House hold Services
    else if(widget.completeQuestion == "How many services by craftsmen would you like to enter?" && widget.questionOption == "Craftsmen services")
    {
      Questions.totalCraftsmen = int.parse(calculations.text);
      print("Total SecondHouseHold:"+Questions.totalCraftsmen.toString());
      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }


    //House hold Services
    else if(widget.completeQuestion == "How much have you spent on maintenance?" && widget.questionOption == "Amount maintenance" && Questions.craftsmenLength > 0)
    {

      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }
//House hold Services
    else if(widget.completeQuestion == "How much did you spend on repairs?" && widget.questionOption == "Amount repairs" && Questions.craftsmenLength > 0)
    {

      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }
//House hold Services
    else if(widget.completeQuestion == "How much did you spend on paintwork?" && widget.questionOption == "Amount paintwork" && Questions.craftsmenLength > 0)
    {

      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }
//House hold Services
    else if(widget.completeQuestion == "How much did you spend on modernisation?" && widget.questionOption == "Costs modernisation" && Questions.craftsmenLength > 0)
    {

      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }
//House hold Services
    else if(widget.completeQuestion == "How much did you spend on extension work?" && widget.questionOption == "Amount extension work" && Questions.craftsmenLength > 0)
    {

      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }
//House hold Services
    else if(widget.completeQuestion == "How much did you spend on supply works?" && widget.questionOption == "Amount supply works" && Questions.craftsmenLength > 0)
    {

      Questions.craftsmenLength += 1;
      Questions.craftsmenText = "CRAFTSMAN SERVICE "+Questions.craftsmenLength.toString();
    }





    //Home
    else if(widget.completeQuestion == "How many second households would you like to enter?" && widget.questionOption == "Quantity")
    {
      Questions.totalSecondHouseHold = int.parse(calculations.text);
      print("Total SecondHouseHold:"+Questions.totalSecondHouseHold.toString());
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }
//Home
    else if(widget.completeQuestion == "How much was the cleaning?" && widget.questionOption == "Cleaning costs" && Questions.secondHouseHoldLength > 0)
    {
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }
    //Home
    else if(widget.completeQuestion == "How much did you spend on the broadcasting license fee?" && widget.questionOption == "Costs broadcasting fee" && Questions.secondHouseHoldLength > 0)
    {
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }
    //Home
    else if(widget.completeQuestion == "How much did you spend on taxes for your second household?" && widget.questionOption == "Second home tax" && Questions.secondHouseHoldLength > 0)
    {
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }
    //Home
    else if(widget.completeQuestion == "How much have you spent on journeys to apartment viewings?" && widget.questionOption == "Apartment viewings" && Questions.secondHouseHoldLength > 0)
    {
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }
//Home
    else if(widget.completeQuestion == "How much was the brokerage fee?" && widget.questionOption == "Broker's fee" && Questions.secondHouseHoldLength > 0)
    {
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }
    //Home
    else if(widget.completeQuestion == "How much did you spend on that?" && widget.questionOption == "Amount other" && Questions.secondHouseHoldLength > 0)
    {
      Questions.secondHouseHoldLength += 1;
      Questions.secondHouseHoldText =Questions.secondHouseHoldLength.toString() + ". SECOND HOUSEHOLD";
    }



    else{
      print("data add");

    }

    qu.HomeAddAnswer(widget.identity, widget.bigQuestion, widget.completeQuestion, widget.questionOption, [calculations.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion: widget.questionOption, CheckAnswer: ["ok"]);
    }));



  }



}
