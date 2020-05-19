import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/work_flow/workmainquestions.dart';
import 'package:easy_taxx/datamodels/designfile.dart';

class WorkCalculationContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;
  List suggestion;


  WorkCalculationContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData,this.suggestion});
  @override
  _WorkCalculationContainerState createState() => _WorkCalculationContainerState();
}

class _WorkCalculationContainerState extends State<WorkCalculationContainer> {
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
    double maxHeight = widget.containerSize;
    // var maskTextInputFormatter = MaskTextInputFormatter(mask: "## / ## / ####");
//filter: { "#": RegExp(r'[0-9]')

    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,
//                    constraints: BoxConstraints(minHeight: minHeight, maxHeight: maxHeight),
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 10.0,bottom: 10.0),
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
                        margin: EdgeInsets.only(left: 10.0,right: 10.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),
                        ),
                        height: 150.0,
                        width: MediaQuery.of(context).size.width,

                      ),


                      Positioned(
                          right: MediaQuery.of(context).size.width* 0.04 ,
                          top: 7.0,
                          child: GestureDetector(
                              onTap: (){

                              },
                              child:Image(image: AssetImage("images/question_mark.png"),width: questionMarkWidth,height: questionMarkHeight,))
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
                            child:Text(widget.completeQuestion,style: TextStyle(fontSize:questionFontSize,color: Colors.white,wordSpacing: 3.0,fontWeight: FontWeight.w600),)),

                      )

                    ],
                  ),
                  SizedBox(height: 8.0,),
                  Container(
                    //margin: EdgeInsets.only(top: 5.0),
                    height: 2.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: new BoxDecoration(boxShadow: [
                      new BoxShadow(
                        color: Colors.grey[300],
                        blurRadius: 0.8,

                      ),
                    ]),

                  ),


                  Container(
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
                              width: MediaQuery.of(context).size.width*0.70,
                              height: 50.0,
//                    color: Colors.wh,
                              child: TextFormField(
                                controller: calculations,
                                //inputFormatters: [maskTextInputFormatter],
                                //keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                    border: InputBorder.none,

                                    hintText: widget.additionalData == "calculation" ? "€0" : "example" ,
                                    contentPadding: EdgeInsets.only(left: 15.0)
                                ),
                                keyboardType:widget.additionalData == "calculation" ? TextInputType.number : TextInputType.emailAddress ,
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
                      )),

                ],
              ),

            )));

  }


  void AddData()
  {
    if(widget.completeQuestion == "How many more home offices would ${Questions.workYouIdentity} like enter?" && widget.questionOption == "Number of home offices")
    {
      Questions.homeOfficeLength = 0;
      Questions.totalHomeOffice = int.parse(calculations.text);
      print("Total Home Office"+Questions.totalHomeOffice.toString());
      Questions.homeOfficeLength += 1;
      Questions.homeOfficeText ="HOME OFFICE "+Questions.homeOfficeLength.toString();
    }

    else if(widget.completeQuestion == "How many items cost more than 488 EUR?" && widget.questionOption == "Quantity")
    {
      Questions.workFurnitureLength = 0;
      Questions.totalWorkFurniture = int.parse(calculations.text);
      print("Total Furniture Length"+Questions.totalWorkFurniture.toString());
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "How long are ${Questions.workYouIdentity} going to use the desk for?" && widget.questionOption == "Usage desk")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "How long are ${Questions.workYouIdentity} going to use the office chair for?" && widget.questionOption == "Usage office chair")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "How long are ${Questions.workYouIdentity} going to use the shelf for?" && widget.questionOption == "Bookshelf usage")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "How long are ${Questions.workYouIdentity} going to use the lamp for?" && widget.questionOption == "Usage lamp")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "How many years are ${Questions.workYouIdentity} going to use the filing cabinet for?" && widget.questionOption == "Usage filing cabinet")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "For how many years will ${Questions.workYouIdentity} use the carpet?" && widget.questionOption == "Other depreciation period")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "What kind of furniture/equipment did ${Questions.financeYouIdentity} buy?" && widget.questionOption == "Type")
    {
      Questions.otherFurniture = calculations.text;
    }

    else if(widget.completeQuestion == "For how many years will ${Questions.workYouIdentity} use the ${Questions.otherFurniture}?" && widget.questionOption == "Depreciation period")
    {
      Questions.workFurnitureLength += 1;
      Questions.workFurnitureText ="FURNITURE "+Questions.workFurnitureLength.toString();
    }

    else if(widget.completeQuestion == "How much did ${Questions.workYouIdentity} spend on these items in total?" && widget.questionOption == "Total amount")
    {
      Questions.homeOfficeLength += 1;
      Questions.homeOfficeText ="HOME OFFICE "+Questions.homeOfficeLength.toString();
    }

    qu.WorkAddAnswer(widget.identity, widget.bigQuestion, widget.completeQuestion, widget.questionOption, [calculations.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return WorkMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion: widget.questionOption, CheckAnswer: ["ok"]);
    }));



  }



}
