import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/home_flow/homefulladdress.dart';
import 'package:easy_taxx/datamodels/designfile.dart';

class HomeAddressContainer extends StatefulWidget {
  String identity;
  String completeQuestion;
  String questionOption;
  double containerSize;
  String bigQuestion;
  String additionalData;
  String multipleData;


  HomeAddressContainer({this.identity,this.bigQuestion,this.completeQuestion,this.questionOption,this.containerSize,this.additionalData,this.multipleData});
  @override
  _HomeAddressContainerState createState() => _HomeAddressContainerState();
}

class _HomeAddressContainerState extends State<HomeAddressContainer> {
  TextEditingController address = TextEditingController();
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
                                    onTap: (){
                                      AddData();
                                    },
                                    enabled: true,
                                    controller: address,
                                    //inputFormatters: [maskTextInputFormatter],
                                    //keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,

                                        hintText: "Address:",
                                        contentPadding: EdgeInsets.only(left: 15.0)
                                    ),
                                  )
                              ),

//                              Container(
//                                //margin: EdgeInsets.only(left: 20.0),
//                                // color: Colors.blue,
//                                width: MediaQuery.of(context).size.width*0.15,
//                                child:GestureDetector(
//                                  onTap: (){
//                                    AddData();
//                                  },
//                                  child: Text("Confirm",style: TextStyle(color:Colors.lightBlue)),
//                                ),)
                            ],
                          )),

                ],
              ),

            )));

  }


  void AddData()
  {
    print("ddate is"+address.text.toString());

//    qu.IncomeAddAnswer(widget.identity,widget.bigQuestion,widget.completeQuestion, widget.questionOption, [address.text.toString()], 55.0);
//
//    Navigator.of(context).pop();
//    Navigator.push(context, MaterialPageRoute(builder: (context) {
//      return IncomeMainQuestions(CheckCompleteQuestion : widget.completeQuestion,CheckQuestion : widget.questionOption,CheckAnswer : ["ok"]);
//    }));




    Navigator.of(context).pop();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeFullAddress(identity: widget.identity,bigQuestion:widget.bigQuestion,completeQuestion: widget.completeQuestion,questionOption: widget.questionOption,containerSize: widget.containerSize);
    }));

  }


}
