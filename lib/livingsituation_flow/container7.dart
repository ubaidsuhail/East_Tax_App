import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/datamodels/designfile.dart';
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
                                                color: Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF) : Colors.deepPurple[400],
                                              ),
                                              height: 145.0,
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
                                                  child: Text("",style: TextStyle(fontSize:12.5,color: Colors.black),),
                                                )),

                                            Positioned(
                                              top: 52.0,
                                              left: MediaQuery.of(context).size.width / 30.0,
                                              right: MediaQuery.of(context).size.width / 30.0,

                                              child:Padding(
                                                  padding: EdgeInsets.only(left: 10.0),
                                                  child:Text(widget.Question,style: TextStyle(fontSize:questionFontSize,color: Colors.white,wordSpacing: 3.0,fontWeight: FontWeight.w600),)),

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
                                                height: 55.0,
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
                                              width: MediaQuery.of(context).size.width*0.20,
                                            child:GestureDetector(
                                              onTap: (){
                                               AddData();
                                              },
                                              child: Text("Confirm",style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF) : Colors.deepPurple[300],fontWeight: FontWeight.w600,fontSize: 16.0)),
                                            ),)
                                          ],
                                        )),

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
