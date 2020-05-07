import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/family_flow/familymainquestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:auto_size_text/auto_size_text.dart';




class FamilyMultipleOptionsContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  List answerOption = [];
  List answerImages = [];
  String additionalData;
  String multipleData;


  FamilyMultipleOptionsContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.answerOption,this.answerImages,this.containerSize,this.additionalData,this.multipleData});
  @override
  _FamilyMultipleOptionsContainerState createState() => _FamilyMultipleOptionsContainerState();
}

class _FamilyMultipleOptionsContainerState extends State<FamilyMultipleOptionsContainer> {
  bool open = false;
  bool v3 = false;
  Questions qu =Questions();
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
    timer();
    addBoolValue();
  }


  void timer()
  {

    Timer(Duration(seconds: 1), () {
      print("Yeah, this line is printed after 3 second");
      setState(() {
        open=true;
      });
    });
  }
  //List<String> items = ["Employeed","Minijob(e.g 4.50 basis)","Studying","others","Employeed","Minijob(e.g 4.50 basis)","Studying","others",];

  List values = [];

  //bool containerColor = false;



  @override

  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .008;
    //double maxHeight = MediaQuery.of(context).size.height * .59;
    double maxHeight = widget.containerSize;
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
                        height: 140.0,
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
                  Container(
                    height: 200.0,
                    width: 450.0,


//                                        color: Colors.red,
                    child: ListView.builder
                      (
                        itemCount: widget.answerOption.length,
                        itemBuilder: (BuildContext ctxt, int index) {
                          return GestureDetector(

                              child:
                              Container(
                                  color: Colors.white,

                                  child:
                                  Column(
                                    children: <Widget>[
                                      Divider(
                                        height: 1.0,
                                        thickness: 1.0,
                                      ),
                                      Row(
                                        children: <Widget>[

                                          Checkbox(

                                            value: this.values[index],
                                            onChanged: (bool value) {
                                              print(value);

                                              setState(() {
                                                this.values[index] = value;
                                                //containerColor = ! containerColor;

                                              });
                                            },

                                          ),

//                                          Icon(Icons.timer),
                                          Image(image:AssetImage(widget.answerImages[index]),width: 22.0,height: 35.0,),
                                          SizedBox(width: 20.0,),
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.65,
                                            child:AutoSizeText(widget.answerOption[index],style: TextStyle(color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF)),
                                              minFontSize: 14,
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,),
                                          )

                                        ],
                                      )
                                    ],
                                  )
                              ));
                        }
                    ),

                  ),

                  Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          new BoxShadow(
                            color: Colors.grey,
                            blurRadius: 5.0,
                          ),

                        ]),
                    width: MediaQuery.of(context).size.width,
                    height: 70.0,
//                    color: Colors.wh,
                    child: Center(
                      child: GestureDetector(onTap:(){
                        Confirm();
                      },
                          child:Text('Confirm',style: TextStyle(color: Color.fromARGB(0XFF, 0X38, 0Xb6, 0XFF),fontWeight: FontWeight.w600,fontSize: 16.0))
                      ),

                    ),
                  ),
                ],
              ),

            )));


  }


  void addBoolValue(){
    for(int i = 0 ; i < widget.answerOption.length; i++)
    {
      values.add(false);
      print('hello');
    }
  }


  void Confirm()
  {
    List data = [];
    for(int i = 0 ; i < widget.answerOption.length; i++)
    {
      if(values[i] == true)
      {
        data.add(widget.answerOption[i]);
      }

    }



      qu.FamilyAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion,widget.questionOption, data, 55.0);

      Navigator.of(context).pop();
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return FamilyMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : data);
      }));




  }
}