import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/income_flow/incomemainquestions.dart';

class ValuableNameContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;


  ValuableNameContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize});
  @override
  _Container7State createState() => _Container7State();
}

class _Container7State extends State<ValuableNameContainer> {
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
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.lightBlue,
                    ),
                    height: 130.0,
                    width: 450.0,

                    child: Padding(padding: EdgeInsets.only(left: 20.0,top: 45.0),
                      child: Text(widget.completeQuestion,style: TextStyle(fontSize:20.0,color: Colors.white),),),

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
                                width: MediaQuery.of(context).size.width*0.15,
                                child:GestureDetector(
                                  onTap: (){
                                    AddData();
                                  },
                                  child: Text("Confirm",style: TextStyle(color:Colors.lightBlue)),
                                ),)
                            ],
                          ))),

                ],
              ),

            )));

  }


  void AddData()
  {
      // print("no domain");
    Questions.singleValuableName = calculations.text.toString();
      qu.IncomeAddAnswer(widget.identity, widget.bigQuestion, widget.completeQuestion, widget.questionOption, [calculations.text.toString()], 55.0);

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return IncomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion: widget.questionOption, CheckAnswer: ["ok"]);
      }));
    }



}
