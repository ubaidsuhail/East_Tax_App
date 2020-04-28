import 'package:easy_taxx/show.dart';
import 'package:easy_taxx/training.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/livingsituation_flow/mainQuestions.dart';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:responsive_container/responsive_container.dart';
//void main() => runApp(MaterialApp(home:HomeScreen()));

class Container3 extends StatefulWidget {
  String Identity;
  String Question;
  String QuestionOption;
  double Containersize;
  String BigQuestion;


  Container3({this.Identity,this.BigQuestion,this.Question,this.QuestionOption,this.Containersize});

    @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<Container3> {

  bool open = false;
  bool v3 = false;
  Questions qu=Questions();
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


  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .004;
    //double maxHeight = MediaQuery.of(context).size.height * .3;
    double maxHeight = widget.Containersize;
    return AnimatedContainer(
        duration: Duration(milliseconds: 800),
        height: open ? maxHeight : minHeight,
        width: MediaQuery.of(context).size.width,

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
                                    color: Questions.LivingCheck == 1 || Questions.LivingCheck == 2 || Questions.livcolContainer == 1 ? Colors.blueAccent : Colors.deepPurple[400]  ,
                                  ),
                                  height: 130.0,
                                  width: 450.0,

                                  child: Padding(padding: EdgeInsets.only(left: 20.0,top: 45.0),
                                    child: Text(widget.Question,style: TextStyle(fontSize:20.0,color: Colors.white),),),

                                ),
                                SizedBox(height: 10.0,),
                                Container(
                                    decoration: new BoxDecoration(boxShadow: [
                                      new BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 5.0,
                                      ),
                                    ]),
                                    width: MediaQuery.of(context).size.width,
                                    child:
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: (){
                                            //Questions.animatedContainer = 420.0;
                                            qu.addAnswer(widget.Identity,widget.BigQuestion, widget.QuestionOption, ['No'], 55.0);

                                            Navigator.of(context).pop();
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return mainQuestions(CheckQuestion : widget.QuestionOption,CheckAnswer : ["No"]);
                                            }));
                                          },

                                          child:
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.465,
                                            height: 50.0,
                                            color: Colors.white,
                                            child: Center(
                                              child: Text('No',style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 || Questions.livcolContainer == 1 ? Colors.lightBlue : Colors.deepPurple[300]),),
                                            ),
                                          ),),
                                        GestureDetector(
                                          onTap: (){
                                            //Questions.animatedContainer = 420.0;
                                            qu.addAnswer(widget.Identity,widget.BigQuestion, widget.QuestionOption, ['Yes'], 55.0);

                                            Navigator.of(context).pop();
                                            Navigator.push(context, MaterialPageRoute(builder: (context) {
                                              return mainQuestions(CheckQuestion : widget.QuestionOption,CheckAnswer : ["Yes"]);
                                            }));
                                            },
                                          child:
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.475,
                                            height: 50.0,
                                            color: Colors.white,
                                            child: Center(
                                              child: Text('Yes',style: TextStyle(color:Questions.LivingCheck == 1 || Questions.LivingCheck == 2 || Questions.livcolContainer ==1 ? Colors.lightBlue : Colors.deepPurple[300])),
                                            ),
                                          ),),
                                      ],
                                    ))
                              ],
                            ),

                          ))



    );


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
}