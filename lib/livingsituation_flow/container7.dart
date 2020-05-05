import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';

class Container7 extends StatefulWidget {
  String Identity;
  String Question;
  String QuestionOption;
  double Containersize;
  String BigQuestion;


  Container7({this.Identity,this.BigQuestion,this.Question,this.QuestionOption,this.Containersize});
  @override
  _Container7State createState() => _Container7State();
}

class _Container7State extends State<Container7> {
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

    double maxHeight = widget.Containersize;
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
                                                color: Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Colors.blueAccent : Colors.deepPurple[400],
                                              ),
                                              height: 140.0,
                                              width: 450.0,

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
                                              child: Text("",style: TextStyle(fontSize:12.5,color: Colors.black),),
                                            ),

                                            Positioned(
                                              top: 52.0,
                                              left: MediaQuery.of(context).size.width / 30.0,
                                              right: MediaQuery.of(context).size.width / 30.0,

                                              child: Text(widget.Question,style: TextStyle(fontSize:17.5,color: Colors.white,wordSpacing: 3.0),),
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
                                              child: Text("Confirm",style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Colors.lightBlue : Colors.deepPurple[300])),
                                            ),)
                                          ],
                                        ))),

                                      ],
                                    ),

                                  )));

  }


  void AddData()
  {
    print("ddate is"+dates.text.toString());

    qu.addAnswer(widget.Identity,widget.BigQuestion, widget.QuestionOption, [dates.text.toString()], 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return mainQuestions(CheckQuestion : widget.QuestionOption,CheckAnswer : ["ok"]);
    }));
  }


}
