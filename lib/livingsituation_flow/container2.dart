import 'package:easy_taxx/livingsituation_flow/container3.dart';
import 'package:easy_taxx/livingsituation_flow/container3.dart';
import 'package:easy_taxx/show.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
//void main() => runApp(MaterialApp(home:HomeScreen()));



class Container2 extends StatefulWidget {
  String Identity;
  String Question;
  String QuestionOption;
  double Containersize;
  List AnswerOption = [];
  List AnswerImages = [];
  String BigQuestion;


  Container2({this.Identity,this.BigQuestion,this.Question,this.QuestionOption,this.AnswerOption,this.AnswerImages,this.Containersize});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Container2> {
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
    double maxHeight = widget.Containersize;
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
                  Container(
                    height: 200.0,
                    width: 450.0,


//                                        color: Colors.red,
                    child: ListView.builder
                      (
                        itemCount: widget.AnswerOption.length,
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

                                          Image(image:AssetImage(widget.AnswerImages[index]),width: 22.0,height: 35.0,),
                                          SizedBox(width: 20.0,),
                                          Text(widget.AnswerOption[index],style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Colors.lightBlue : Colors.deepPurple[300]),),
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
                          child:Text('Confirm',style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 ? Colors.lightBlue : Colors.deepPurple[300]))
                      ),

                    ),
                  ),
                ],
              ),

            )));


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

  void addBoolValue(){
    for(int i = 0 ; i < widget.AnswerOption.length; i++)
    {
      values.add(false);
      print('hello');
    }
  }


  void Confirm()
  {
    List data = [];
    for(int i = 0 ; i < widget.AnswerOption.length; i++)
    {
      if(values[i] == true)
      {
        data.add(widget.AnswerOption[i]);
      }

    }
    //Questions.animatedContainer = 210.0;
    qu.addAnswer(widget.Identity,widget.BigQuestion, widget.QuestionOption, data, 55.0);

    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return mainQuestions(CheckQuestion : widget.QuestionOption,CheckAnswer : data);
    }));
  }
}