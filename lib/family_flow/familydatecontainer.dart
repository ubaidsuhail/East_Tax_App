import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/family_flow/familymainquestions.dart';

class FamilyDateContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;


  FamilyDateContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _FamilyDateContainerState createState() => _FamilyDateContainerState();
}

class _FamilyDateContainerState extends State<FamilyDateContainer> {
  TextEditingController dates = TextEditingController();
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

    //double maxHeight = 220.0;
    double maxHeight = widget.containerSize;
    var maskTextInputFormatter = MaskTextInputFormatter(mask: "## / ## / ####");
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
                          color: Colors.blueAccent,
                        ),
                        height: 140.0,
                        width: 450.0,

                      ),

                      Positioned(
                        left: 10.0,
                        top: 13.0,
                        child: Text(widget.multipleData,style: TextStyle(fontSize:12.5,color: Colors.black),),
                      ),

                      Positioned(
                        top: 35.0,
                        left: 10.0,
                        right: 10.0,

                        child: Text(widget.completeQuestion,style: TextStyle(fontSize:17.5,color: Colors.white,wordSpacing: 3.0),),
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
                                    controller: dates,
                                    inputFormatters: [maskTextInputFormatter],
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

                                        hintText: ('DD / MM / YYYY '),
                                        contentPadding: EdgeInsets.only(left: 15.0)
                                    ),
                                  )
                              ),

                              Container(
                                //margin: EdgeInsets.only(left: 20.0),
                                // color: Colors.blue,
                                width: MediaQuery.of(context).size.width*0.15,
                                child:GestureDetector(
                                  onTap: (){
                                    AddData();
                                  },
                                  child: Text("Confirm",style: TextStyle(color: Colors.blueAccent,)),
                                ),)
                            ],
                          ))),

                ],
              ),

            )));

  }


  void AddData()
  {

    if(widget.completeQuestion == "When did your child live there?" && widget.questionOption == "Period living there")
    {
      Questions.childAddressLength += 1;
      Questions.childAddressText ="ADDRESS "+Questions.childAddressLength.toString();
    }
    else if(widget.completeQuestion == "From when to when were you getting grants for child care?" && widget.questionOption == "Period grant")
    {
      Questions.kindergartenLength += 1;
      Questions.kindergartenText ="KINDERGARTEN "+Questions.kindergartenLength.toString();
    }
    else if(widget.completeQuestion == "When did you receive grants for childcare?" && widget.questionOption == "Period financial support" && Questions.childMinderText.contains("CHILD MINDER"))
    {
      Questions.childMinderLength += 1;
      Questions.kindergartenText ="CHILD MINDER "+Questions.childMinderLength.toString();
    }

    else if(widget.completeQuestion == "When did you receive grants for childcare?" && widget.questionOption == "Period financial support" && Questions.nannyText.contains("NANNY"))
    {
      Questions.nannyLength += 1;
      Questions.nannyText ="NANNY "+Questions.nannyLength.toString();
    }

    else if(widget.completeQuestion == "When did you receive grants for childcare?" && widget.questionOption == "Period financial support" && Questions.babySitterText.contains("BABYSITTER"))
    {
      Questions.babySitterLength += 1;
      Questions.babySitterText ="BABYSITTER "+Questions.babySitterLength.toString();
    }

    else if(widget.completeQuestion == "When did you receive grants for childcare?" && widget.questionOption == "Period financial support" && Questions.aupairText.contains("AU PAIR"))
    {
      Questions.aupairLength += 1;
      Questions.aupairText ="AU PAIR "+Questions.aupairLength.toString();
    }

    else if(widget.completeQuestion == "When did you receive grants for childcare?" && widget.questionOption == "Period financial support" && Questions.dayCareText.contains("DAYCARE CENTER"))
    {
      Questions.dayCareLength += 1;
      Questions.dayCareText ="DAYCARE CENTER "+Questions.aupairLength.toString();
    }



    qu.FamilyAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion, widget.questionOption, [dates.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return FamilyMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["ok"]);
    }));
  }



}
