import 'package:easy_taxx/livingsituation_flow/container1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:easy_taxx/MainAppQuestion/questions.dart';
import 'package:easy_taxx/finishcategory.dart';
import 'package:easy_taxx/family_flow/familycalculationcontainer.dart';
import 'package:easy_taxx/family_flow/familydatecontainer.dart';
import 'package:easy_taxx/family_flow/familymultipleoptionscontainer.dart';
import 'package:easy_taxx/family_flow/familyyesnocontainer.dart';
import 'package:easy_taxx/family_flow/familythreeoptioncontainer.dart';
import 'package:easy_taxx/family_flow/familydifferentoptioncontainer.dart';
import 'package:easy_taxx/family_flow/familyaddresscontainer.dart';
import 'package:easy_taxx/family_flow/familytwooptioncontainer.dart';


//void main() => runApp(MaterialApp(home:HomeScreen()));

class FamilyMainQuestions extends StatefulWidget {
  String CheckCompleteQuestion;
  String CheckQuestion;
  List CheckAnswer;

  FamilyMainQuestions({Key key,this.CheckCompleteQuestion,this.CheckQuestion,this.CheckAnswer}) : super(key : key);



  @override
  _FamilyMainQuestionsState createState() => _FamilyMainQuestionsState();
}

class _FamilyMainQuestionsState extends State<FamilyMainQuestions> {
  Questions qu =Questions();
  var dynamicContainer = List<Widget>();
  var dynamicContainerbig = List<Widget>();
  bool detail =true;
  String detailOption;
  double screenHeight = 0.0;
  double screenHeightbig = 0.0;
  List screenHeightbiglist = [];
  String detailsHeight;
  int countLongContainer = 0;
  int i,j=0,l=0,co;
  int k=0;
  int heightcount = 0;
  List heightList = [];
  List screenheightList = [];
  int hlength=0;
  bool a= false;


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
    //timer();
    Screenheight();
    DynamicContainer();
  }

  void Screenheight()
  {
    print("question length:"+Questions.familyAnswerShow.length.toString());

    for(k=l;k<Questions.familyAnswerShow.length;k++)
    {
      print("how manysdsdsd");
      screenHeightbig  = 0.0;
      if(Questions.familyAnswerShow[k]['identity'] == "You" || Questions.familyAnswerShow[k]['identity'] == "You & Partner" || Questions.familyAnswerShow[k]['identity'] == "Partner")
      {
        screenHeight = screenHeight +70.0;
      }
      else if(Questions.familyAnswerShow[k]['details'] == "")
      {
        screenHeight = screenHeight +60.0;
        detail= true;
      }
      else{
        detailsHeight = Questions.familyAnswerShow[k]['details'];

        for(l=k;l<Questions.familyAnswerShow.length;l++)
        {
          if(Questions.familyAnswerShow[l]['details'] == detailsHeight)
          {
            print("height");
            heightcount ++;
          }
          else
          {
            //k = l-1;
            break;
          }

        }

        k = l-1;

        print("height screen is:"+heightcount.toString());
        heightList.add(heightcount);
        print("height list:"+heightList.toString());
        heightcount =0;
        screenheightList = [];
        for(int he = 0;he < heightList.length; he++)
        {
          screenheightList.add((heightList[he]*60.0) + 60.0 +2);

        }

        print(screenheightList.toString());
//        for(int h=0;h<screenheightList.length;h++)
//          {
//            screenHeightbig = screenheightList[h] + 5.0;
//          }

        //calculate screen height according to new big container
        screenHeight = screenHeight + screenheightList[screenheightList.length - 1] +5.0;




      }
      print("k:"+k.toString()+"l:"+l.toString());
    }
    //screenHeightbig = screenHeightbig +2;
    screenHeight = screenHeight + Questions.familyAnimatedContainer;
    // screenHeight = screenHeight;
    print("Screen Height:"+screenHeight.toString());
//    print("Screen Height big:"+screenHeightbig.toString());

    detail = true;





  }


  void DynamicContainer(){
    hlength=0;
    // print("question length:"+Questions.answerShow.length.toString());
    for (i=j;i<Questions.familyAnswerShow.length;i++) {
      print("value oif i is:"+i.toString());


      print("dat is:"+i.toString());
      //You and your and your partner identity
      if(Questions.familyAnswerShow[i]['identity'] == "You" || Questions.familyAnswerShow[i]['identity'] == "You & Partner" || Questions.familyAnswerShow[i]['identity'] == "Partner")
      {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 10.0,left: 10.0, right: 10.0),
              height: Questions.familyAnswerShow[i]['containerheight'],
              width: 450.0,
              child:Text(Questions.familyAnswerShow[i]['identity'],style: TextStyle(fontSize: 40.0)) ,
            )
        );
      }
      else if(Questions.familyAnswerShow[i]['details'] == "") {
        dynamicContainer.add(
            Container(
              margin: EdgeInsets.only(top: 2.5, bottom: 2.5, left: 10.0, right: 10.0),
              height: Questions.familyAnswerShow[i]['containerheight'],
              width: 450.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(width: 1.0, color: Colors.lightBlue)
              ),
              child: Padding(
                  padding: EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      //Text(Questions.answerShow[i]['question']),
                      Text(Questions.familyAnswerShow[i]['question'],style: TextStyle(fontWeight: FontWeight.bold),),
                      Row(children: <Widget>[
                        //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                        Text(Questions.familyAnswerShow[i]['answer'][0]),
                        SizedBox(width: 10.0,),
                        Icon(Icons.arrow_forward_ios, size: 12.0,
                          color: Colors.lightBlue,)
                      ],)
                    ],)),
            ));
      }

      //data that contains long container
      else
      {
        detailOption = Questions.familyAnswerShow[i]['details'];
        print(detailOption);
        countLongContainer = 0;
//print("ahsjasjasksss");

        //set length of data in details that how much data comes
        for(co = i ; co < Questions.familyAnswerShow.length; co++)
        {
          if(Questions.familyAnswerShow[co]['details'] == detailOption) {
            countLongContainer++;
            //print("data after container");

          }
          else
          {
            break;
          }
        }

        countLongContainer = countLongContainer+i;
        //print("count long container:"+countLongContainer.toString()+" "+i.toString());

        for(j=i;j<countLongContainer;j++) {
//print("4<5");
          if(Questions.familyAnswerShow[j]['details'] == detailOption && detail == true) {
            dynamicContainerbig.add(
              Container(
                  height: 55.0,
                  width: 450.0,
                  color: Colors.white,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Text(Questions.answerShow[i]['question']),
                          Text(Questions.familyAnswerShow[i]['details'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.0),),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Text(""),
                            SizedBox(width: 10.0,),
                          ],)
                        ],))),

            );

            dynamicContainerbig.add(
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child:Container(
                      margin: EdgeInsets.only(top:2.0,bottom:2.0),
                      height: 1.0,
                      color: Colors.grey[200],

                    )));
            //so that details data not come again and again
            detail = false;
          }
          // after details data
          if(Questions.familyAnswerShow[j]['details'] == detailOption && detail == false)
          {
            dynamicContainerbig.add(
              Container(
                  color: Colors.white,
                  height: 55.0,
                  width: 450.0,
                  child: Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //Text(Questions.answerShow[i]['question']),
                          Text(Questions.familyAnswerShow[j]['question'],style: TextStyle(color: Colors.grey),),
                          Row(children: <Widget>[
                            //Text(Questions.answerShow[i]['answer'],style: TextStyle(color: Colors.lightBlue)),
                            Text(Questions.familyAnswerShow[j]['answer'][0]),
                            SizedBox(width: 10.0,),
                            Icon(Icons.arrow_forward_ios, size: 12.0,
                              color: Colors.lightBlue,)
                          ],)
                        ],))),

            );

            dynamicContainerbig.add(
                Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child:Container(
                      margin: EdgeInsets.only(top:2.0,bottom:2.0),
                      height: 1.0,
                      color: Colors.grey[200],

                    )));
          }

        }
//per container 5
        dynamicContainer.add(
            Container(
                height:  screenheightList[hlength] ,
                margin: EdgeInsets.only(bottom:2.5,top:2.5,left: 10.0,right: 10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(width: 1.0,color: Colors.lightBlue)
                ),
                child:Column(
                  children:dynamicContainerbig,
                )
            ));

        i=j-1;
        detail = true;
        dynamicContainerbig=[];
        hlength++;

        //print("value oif j is:"+j.toString());

      }
    }
  }





  @override
  Widget build(BuildContext context) {
    double minHeight = MediaQuery.of(context).size.height * .008;
    double maxHeight = MediaQuery.of(context).size.height * .82;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child:Icon(Icons.arrow_back,color: Colors.lightBlue,size: 18.0,)
          ),
          title: Text('Family',style: TextStyle(color: Colors.black,fontSize: 14.0),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            reverse: true,
            child: Container(
              color: Colors.white,
              // height: 667.0,
              //height:Questions.answerShow.length <3 ? MediaQuery.of(context).size.height*0.87 : (Questions.answerShow.length*60.0)+420.0,
              //height:Questions.answerShow.length <3 ? 624.0 : (Questions.answerShow.length*60.0)+420.0,
              //height: MediaQuery.of(context).size.height*0.87,

              height: MediaQuery.of(context).size.height*0.87 >= screenHeight ? MediaQuery.of(context).size.height*0.87 : screenHeight ,
              width: MediaQuery.of(context).size.width,
              child:
              Stack(

                children: <Widget>[

                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      child:
                      Column(

                        children: <Widget>[

//
                          Column(children: dynamicContainer,),
                          FamilyChangeContainer(),

                        ],

                      ),
                    ),),

//                Positioned(
//                  bottom: 0,
//                  child:changeContainer(),
//                ),

                ],
              ),)

        ));


  }



  Widget FamilyChangeContainer()
  {
    if(Questions.familyAnswerShow.length == 0)
    {
      //Question No 1
      return familycalculationContainer("","","How many children do you have?","Number of children",220.0,"loop","");

    }
    else{

      //Answer No 1
      if(widget.CheckCompleteQuestion =="How many children do you have?" && widget.CheckQuestion == "Number of children")
      {
        //Question No 2
        return familycalculationContainer("","Child ${Questions.childLength}","What is your child's first name?","First name child",220.0,"",Questions.childText);
      }

      //Answer No 2
      else if(widget.CheckCompleteQuestion =="What is your child's first name?" && widget.CheckQuestion == "First name child")
      {
        //Question No 3
        return familycalculationContainer("","Child ${Questions.childLength}","What is ${Questions.childFirstName}'s last name?","Child's last name",220.0,"",Questions.childText);

      }

      //Answer No 3
      else if(widget.CheckCompleteQuestion =="What is ${Questions.childFirstName}'s last name?" && widget.CheckQuestion == "Child's last name")
      {
        //Question No 4
        return familydateContainer("","Child ${Questions.childLength}","When was ${Questions.childFirstName} born?","Child's date of birth",430.0,"",Questions.childText);

      }

      //Answer No 4
      else if(widget.CheckCompleteQuestion =="When was ${Questions.childFirstName} born?" && widget.CheckQuestion == "Child's date of birth")
      {
        //Question No 5
        return familymultipleoptionsContainer("","Child ${Questions.childLength}","Where did your child live?","Living situation child",["With us parents","Patchwork family","Only with me","With the other parent","At place of training","With Step-/Grandparents","Somewhere else"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png","images/check.png","images/check.png"],430.0,"",Questions.childText);

      }

      //Answer No 5
      else if(widget.CheckCompleteQuestion =="Where did your child live?" && widget.CheckQuestion == "Living situation child")
      {

        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "With us parents")
          {
            //Question No 6
            //For Costs due to diability 220.0
            //For rest 430.0
            Questions.childrenLive = "With us parents";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);

          }

          else if(widget.CheckAnswer[m] == "Patchwork family")
          {
            //Question No 6
            Questions.childrenLive = "Patchwork family";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(widget.CheckAnswer[m] == "Only with me")
          {
           //Question No 6
            Questions.childrenLive = "Only with me";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(widget.CheckAnswer[m] == "With the other parent")
          {
           //Question No 6
            Questions.childrenLive = "With the other parent";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }
          else if(widget.CheckAnswer[m] == "At place of training")
          {
            //Question No 6
            Questions.childrenLive = "At place of training";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(widget.CheckAnswer[m] == "With Step-/Grandparents")
          {
            //Question No 6
            Questions.childrenLive = "With Step-/Grandparents";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(widget.CheckAnswer[m] == "Somewhere else")
          {
            //Question No 6
            Questions.childrenLive = "Somewhere else";
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","Have you had any of the following expenses for your child?","Expenses child",["Care costs","School fees","Health insurance contributions","Costs due to disability","None of this applies"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }
        }
      }


      //Answer No 6
      else if(widget.CheckCompleteQuestion =="Have you had any of the following expenses for your child?" && widget.CheckQuestion == "Expenses child")
      {

        for(int m=0;m<widget.CheckAnswer.length;m++) {

          if(widget.CheckAnswer[m] == "Care costs")
          {

            Questions.childrenExpense = "Care costs";

            if(Questions.childrenLive == "With us parents")
            {
              //Question No 7
              return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Patchwork family")
            {
              //Question No 8
              return familydifferentoptionContainer("","Child ${Questions.childLength}","What relationship existed between you and the child?","Relationship to child",["Biological child","Adopted child","Foster child","Grandchild","Stepchild"],220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Only with me")
            {
              //Question No 9
              return familycalculationContainer("","Child ${Questions.childLength}","Enter your child's Tax-ID.","Tax-ID child",220.0,"tax",Questions.childText);
            }

            else if(Questions.childrenLive == "With the other parent" || Questions.childrenLive == "At place of training" || Questions.childrenLive == "With Step-/Grandparents" || Questions.childrenLive == "Somewhere else")
            {
              //Question No 10
              return familycalculationContainer("","Child ${Questions.childLength}","In how many different places has your child lived?","Number of places lived",220.0,"loop",Questions.childText);
            }


          }


          else if(widget.CheckAnswer[m] == "School fees")
          {
            Questions.childrenExpense = "School fees";
            if(Questions.childrenLive == "With us parents")
            {
              //Question No 7
              return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Patchwork family")
            {
              //Question No 8
              return familydifferentoptionContainer("","Child ${Questions.childLength}","What relationship existed between you and the child?","Relationship to child",["Biological child","Adopted child","Foster child","Grandchild","Stepchild"],220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Only with me")
            {
              //Question No 9
              return familycalculationContainer("","Child ${Questions.childLength}","Enter your child's Tax-ID.","Tax-ID child",220.0,"tax",Questions.childText);
            }

            else if(Questions.childrenLive == "With the other parent" || Questions.childrenLive == "At place of training" || Questions.childrenLive == "With Step-/Grandparents" || Questions.childrenLive == "Somewhere else")
            {
              //Question No 10
              return familycalculationContainer("","Child ${Questions.childLength}","In how many different places has your child lived?","Number of places lived",220.0,"loop",Questions.childText);
            }
          }

          else if(widget.CheckAnswer[m] == "Health insurance contributions")
          {
            Questions.childrenExpense = "Health insurance contributions";
            if(Questions.childrenLive == "With us parents")
            {
              //Question No 7
              return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Patchwork family")
            {
              //Question No 8
              return familydifferentoptionContainer("","Child ${Questions.childLength}","What relationship existed between you and the child?","Relationship to child",["Biological child","Adopted child","Foster child","Grandchild","Stepchild"],220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Only with me")
            {
              //Question No 9
              return familycalculationContainer("","Child ${Questions.childLength}","Enter your child's Tax-ID.","Tax-ID child",220.0,"tax",Questions.childText);
            }

            else if(Questions.childrenLive == "With the other parent" || Questions.childrenLive == "At place of training" || Questions.childrenLive == "With Step-/Grandparents" || Questions.childrenLive == "Somewhere else")
            {
              //Question No 10
              return familycalculationContainer("","Child ${Questions.childLength}","In how many different places has your child lived?","Number of places lived",220.0,"loop",Questions.childText);
            }
          }

          else if(widget.CheckAnswer[m] == "Costs due to disability")
          {
            Questions.childrenExpense = "Costs due to disability";
//            //Question No 7
//            return familyyesnoContainer("","Child ${Questions.childLength}","Do you wish to transfer your child's disability flat-rate amount to yourself?","Transfer of flat-rate amount",220.0,"",Questions.childText);

          }
          else if(widget.CheckAnswer[m] == "None of this applies")
          {
            Questions.childrenExpense = "None of this applies";
            if(Questions.childrenLive == "With us parents")
            {
              //Question No 7
              return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Patchwork family")
            {
              //Question No 8
              return familydifferentoptionContainer("","Child ${Questions.childLength}","What relationship existed between you and the child?","Relationship to child",["Biological child","Adopted child","Foster child","Grandchild","Stepchild"],220.0,"",Questions.childText);
            }

            else if(Questions.childrenLive == "Only with me")
            {
              //Question No 9
              return familycalculationContainer("","Child ${Questions.childLength}","Enter your child's Tax-ID.","Tax-ID child",220.0,"tax",Questions.childText);
            }

            else if(Questions.childrenLive == "With the other parent" || Questions.childrenLive == "At place of training" || Questions.childrenLive == "With Step-/Grandparents" || Questions.childrenLive == "Somewhere else")
            {
              //Question No 10
              return familycalculationContainer("","Child ${Questions.childLength}","In how many different places has your child lived?","Number of places lived",220.0,"loop",Questions.childText);
            }
          }

        }
      }


      //Answer No 8
      else if(widget.CheckCompleteQuestion =="What relationship existed between you and the child?" && widget.CheckQuestion == "Relationship to child")
      {
       //Question No 41
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationship between you and the child last the entire year?","Year-round parent-child relationship",220.0,"",Questions.childText);
      }



      //Answer No 9
      else if(widget.CheckCompleteQuestion =="Enter your child's Tax-ID." && widget.CheckQuestion == "Tax-ID child")
      {
        //Question No 7
        return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
      }

      //Answer No 10
      else if(widget.CheckCompleteQuestion =="In how many different places has your child lived?" && widget.CheckQuestion == "Number of places lived")
      {
        //Question No 11
        return familyaddressContainer("","Child ${Questions.childLength}","What was the address of your child?","Address child",220.0,"",Questions.childAddressText);
      }

      //Answer No 11
      else if(widget.CheckCompleteQuestion =="What was the address of your child?" && widget.CheckQuestion == "Address child")
      {
        //Question No 12
        //Ya container badd ma change hoga
        return familydateContainer("","Child ${Questions.childLength}","When did your child live there?","Period living there",220.0,"",Questions.childAddressText);
      }

      //Answer No 12
      else if(widget.CheckCompleteQuestion =="When did your child live there?" && widget.CheckQuestion == "Period living there")
      {
       if(Questions.childAddressLength <= Questions.totalChildAddress)
       {
         //Question No 11
         return familyaddressContainer("","Child ${Questions.childLength}","What was the address of your child?","Address child",220.0,"",Questions.childAddressText);
       }
       else
         {
           //Question No 7
           return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
       }
      }

      //Answer No 7
      else if(widget.CheckCompleteQuestion =="Do you know the details of the other parent?" && widget.CheckQuestion == "Other parent's details")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 13
          return familythreeoptionContainer("","Child ${Questions.childLength}","Please choose the reason why you do not know the details of the other parent.","Reason",["No contact","Not possible to get details","Officially unascertainable"],430.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 14
          return familycalculationContainer("","Child ${Questions.childLength}","What is the other parent's full name?","Name of other parent",220.0,"",Questions.childText);
        }

      }

      //Answer No 13
      else if(widget.CheckCompleteQuestion =="Please choose the reason why you do not know the details of the other parent." && widget.CheckQuestion == "Reason")
      {

        if(widget.CheckAnswer[0] == "No contact" || widget.CheckAnswer[0] == "Not possible to get details" || widget.CheckAnswer[0] == "Officially unascertainable")
        {
          //Children Lives
          if(Questions.childrenLive == "With us parents" || Questions.childrenLive == "Somewhere else")
          {
            if(Questions.childrenExpense == "Care costs")
            {
              //Question No 60
              return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
            }

            else if(Questions.childrenExpense == "School fees")
            {
              //Question No 61
              return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
            }
            else if(Questions.childrenExpense == "Health insurance contributions")
            {
              //Question No 62
              return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
            }
            else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
            {
              //Question No 63
              return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
            }
          }

          else if(Questions.childrenLive == "Only with me")
          {
            //Question No 23
            return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
          }

          else if(Questions.childrenLive == "With the other parent")
          {
            //Question No 38
            return familyyesnoContainer("","Child ${Questions.childLength}","Did the other parent request a transfer of the allowance for childcare, education or training needs?","Allowance transfer",220.0,"",Questions.childText);
          }

          else if(Questions.childrenLive == "At place of training")
          {
            //Question No 23
            return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
          }
          else if(Questions.childrenLive == "With Step-/Grandparents")
          {
            //Question No 39
            return familyyesnoContainer("","Child ${Questions.childLength}","Do you want to transfer the child allowance to the step or grandparents?","Allowance transfer",220.0,"",Questions.childText);
          }

        }

      }


      //Answer No 14
      else if(widget.CheckCompleteQuestion =="What is the other parent's full name?" && widget.CheckQuestion == "Name of other parent")
      {
        //Question No 15
        return familydateContainer("","Child ${Questions.childLength}","What is the other parent's date of birth?","Date of birth other parent",220.0,"",Questions.childText);
      }

      //Answer No 15
      else if(widget.CheckCompleteQuestion =="What is the other parent's date of birth?" && widget.CheckQuestion == "Date of birth other parent")
      {
        //Question No 16
        return familyaddressContainer("","Child ${Questions.childLength}","What is the other parent's (last known) address?","Address other parent",220.0,"",Questions.childText);

      }

      //Answer No 16
      else if(widget.CheckCompleteQuestion =="What is the other parent's (last known) address?" && widget.CheckQuestion == "Address other parent")
      {
        //Question No 17
        //For No 430.0
        //For Yes 220.0
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationship between your child and the other parent last the entire year?","Year-round parent-child relationship",220.0,"",Questions.childText);
      }

      //Answer No 17
      else if(widget.CheckCompleteQuestion =="Did the parent-child relationship between your child and the other parent last the entire year?" && widget.CheckQuestion == "Year-round parent-child relationship")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 18
          return familythreeoptionContainer("","Child ${Questions.childLength}","How did the relationship change in 2019?","Change parent-child relationship",["It began","It ended","It existed temporarily"],220.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Children Lives
          if(Questions.childrenLive == "With us parents" || Questions.childrenLive == "Somewhere else")
          {
            if(Questions.childrenExpense == "Care costs")
            {
              //Question No 60
              return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
            }

            else if(Questions.childrenExpense == "School fees")
            {
              //Question No 61
              return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
            }
            else if(Questions.childrenExpense == "Health insurance contributions")
            {
              //Question No 62
              return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
            }
            else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
            {
              //Question No 63
              return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
            }
          }

          else if(Questions.childrenLive == "Only with me")
          {
            //Question No 23
            return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
          }

          else if(Questions.childrenLive == "With the other parent")
          {
            //Question No 38
            return familyyesnoContainer("","Child ${Questions.childLength}","Did the other parent request a transfer of the allowance for childcare, education or training needs?","Allowance transfer",220.0,"",Questions.childText);
          }

          else if(Questions.childrenLive == "At place of training")
          {
            //Question No 23
            return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
          }
          else if(Questions.childrenLive == "With Step-/Grandparents")
          {
            //Question No 39
            return familyyesnoContainer("","Child ${Questions.childLength}","Do you want to transfer the child allowance to the step or grandparents?","Allowance transfer",220.0,"",Questions.childText);
          }
        }

      }

      //Answer No 18
      else if(widget.CheckCompleteQuestion =="How did the relationship change in 2019?" && widget.CheckQuestion == "Change parent-child relationship")
      {

        if(widget.CheckAnswer[0] == "It began")
        {
          //Question No 19
          return familydateContainer("","Child ${Questions.childLength}","When did the parent-child relationship start?","Start parent-child relationship",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "It ended")
        {
          //Question No 20
          //For No 430.0
          //For Yes 220.0
          return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationship end due to the death of the other parent?","End due to death",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "It existed temporarily")
        {
          //Question No 21
          //Ya container change hoga
          return familydateContainer("","Child ${Questions.childLength}","From when to when did the parent-child relationship last?","Duration parent-child relationship",430.0,"",Questions.childText);
        }
      }


      //Answer No 19
      else if(widget.CheckCompleteQuestion =="When did the parent-child relationship start?" && widget.CheckQuestion == "Start parent-child relationship")
      {
        //Children Lives
        if(Questions.childrenLive == "With us parents" || Questions.childrenLive == "Somewhere else")
        {
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }
        }

        else if(Questions.childrenLive == "Only with me")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }

        else if(Questions.childrenLive == "With the other parent")
        {
          //Question No 38
          return familyyesnoContainer("","Child ${Questions.childLength}","Did the other parent request a transfer of the allowance for childcare, education or training needs?","Allowance transfer",220.0,"",Questions.childText);
        }

        else if(Questions.childrenLive == "At place of training")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }
        else if(Questions.childrenLive == "With Step-/Grandparents")
        {
          //Question No 39
          return familyyesnoContainer("","Child ${Questions.childLength}","Do you want to transfer the child allowance to the step or grandparents?","Allowance transfer",220.0,"",Questions.childText);
        }
      }


      //Answer No 20
      else if(widget.CheckCompleteQuestion =="Did the parent-child relationship end due to the death of the other parent?" && widget.CheckQuestion == "End due to death")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Children Lives
          if(Questions.childrenLive == "With us parents" || Questions.childrenLive == "Somewhere else")
          {
            if(Questions.childrenExpense == "Care costs")
            {
              //Question No 60
              return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
            }

            else if(Questions.childrenExpense == "School fees")
            {
              //Question No 61
              return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
            }
            else if(Questions.childrenExpense == "Health insurance contributions")
            {
              //Question No 62
              return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
            }
            else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
            {
              //Question No 63
              return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
            }
          }

          else if(Questions.childrenLive == "Only with me")
          {
            //Question No 23
            return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
          }

          else if(Questions.childrenLive == "With the other parent")
          {
            //Question No 38
            return familyyesnoContainer("","Child ${Questions.childLength}","Did the other parent request a transfer of the allowance for childcare, education or training needs?","Allowance transfer",220.0,"",Questions.childText);
          }

          else if(Questions.childrenLive == "At place of training")
          {
            //Question No 23
            return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
          }
          else if(Questions.childrenLive == "With Step-/Grandparents")
          {
            //Question No 39
            return familyyesnoContainer("","Child ${Questions.childLength}","Do you want to transfer the child allowance to the step or grandparents?","Allowance transfer",220.0,"",Questions.childText);
          }
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 22
          return familydateContainer("","Child ${Questions.childLength}","When did the parent-child relationship end?","End parent-child relationship",220.0,"",Questions.childText);
        }

      }

      //Answer No 22
      else if(widget.CheckCompleteQuestion =="When did the parent-child relationship end?" && widget.CheckQuestion == "End parent-child relationship")
      {

        //Children Lives
        if(Questions.childrenLive == "With us parents" || Questions.childrenLive == "Somewhere else")
        {
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }
        }

        else if(Questions.childrenLive == "Only with me")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }

        else if(Questions.childrenLive == "With the other parent")
        {
          //Question No 38
          return familyyesnoContainer("","Child ${Questions.childLength}","Did the other parent request a transfer of the allowance for childcare, education or training needs?","Allowance transfer",220.0,"",Questions.childText);
        }

        else if(Questions.childrenLive == "At place of training")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }
        else if(Questions.childrenLive == "With Step-/Grandparents")
        {
          //Question No 39
          return familyyesnoContainer("","Child ${Questions.childLength}","Do you want to transfer the child allowance to the step or grandparents?","Allowance transfer",220.0,"",Questions.childText);
        }






      }

      //Answer No 21
      else if(widget.CheckCompleteQuestion =="From when to when did the parent-child relationship last?" && widget.CheckQuestion == "Duration parent-child relationship")
      {
        //Children Lives
        if(Questions.childrenLive == "With us parents" || Questions.childrenLive == "Somewhere else")
        {
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }
        }

        else if(Questions.childrenLive == "Only with me")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }

        else if(Questions.childrenLive == "With the other parent")
        {
          //Question No 38
          return familyyesnoContainer("","Child ${Questions.childLength}","Did the other parent request a transfer of the allowance for childcare, education or training needs?","Allowance transfer",220.0,"",Questions.childText);
        }

        else if(Questions.childrenLive == "At place of training")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }
        else if(Questions.childrenLive == "With Step-/Grandparents")
        {
          //Question No 39
          return familyyesnoContainer("","Child ${Questions.childLength}","Do you want to transfer the child allowance to the step or grandparents?","Allowance transfer",220.0,"",Questions.childText);
        }
      }


      // ====== Patchwork Family Starts ====== //

      //Answer no 41
      else if(widget.CheckCompleteQuestion =="Did the parent-child relationship between you and the child last the entire year?" && widget.CheckQuestion == "Year-round parent-child relationship")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 43
          return familythreeoptionContainer("","Child ${Questions.childLength}","How has the parent-child relationship changed during 2019?","Change parent-child relationship",["It began","It ended","It existed temporarily"],220.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 42
          return familyyesnoContainer("","Child ${Questions.childLength}","Did the child have parent-child relations with another person?","Other person",220.0,"",Questions.childText);
        }

      }


      //Answer No 43
      else if(widget.CheckCompleteQuestion =="How has the parent-child relationship changed during 2019?" && widget.CheckQuestion == "Change parent-child relationship")
      {

        if(widget.CheckAnswer[0] == "It began")
        {
          //Question No 44
          return familydateContainer("","Child ${Questions.childLength}","When did the parent - child relationship start?","Start parent-child relationship",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "It ended")
        {
         //Question No 45
          return familydateContainer("","Child ${Questions.childLength}","When did the parent - child relationship end?","End parent-child relationship",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "It existed temporarily")
        {
          //Question no 46
          //Ya container change hoga
          return familydateContainer("","Child ${Questions.childLength}","How long did the parent-child relationship last?","Duration parent-child relationship",430.0,"",Questions.childText);
        }
      }

      //Answer No 44
      else if(widget.CheckCompleteQuestion =="When did the parent - child relationship start?" && widget.CheckQuestion == "Start parent-child relationship")
      {
        //Question No 42
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the child have parent-child relations with another person?","Other person",220.0,"",Questions.childText);
      }

      //Answer No 45
      else if(widget.CheckCompleteQuestion =="When did the parent - child relationship end?" && widget.CheckQuestion == "End parent-child relationship")
      {
        //Question No 42
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the child have parent-child relations with another person?","Other person",220.0,"",Questions.childText);
      }

      //Answer No 46
      else if(widget.CheckCompleteQuestion =="How long did the parent-child relationship last?" && widget.CheckQuestion == "Duration parent-child relationship")
      {
        //Question No 42
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the child have parent-child relations with another person?","Other person",220.0,"",Questions.childText);
      }


      //Answer No 42
      else if(widget.CheckCompleteQuestion =="Did the child have parent-child relations with another person?" && widget.CheckQuestion == "Other person")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 47
          return familythreeoptionContainer("","Child ${Questions.childLength}","Why was there no parental relationship to another person?","Reason",["Parent died","Parent unknown","No contact"],220.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 49
          return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the address of the other parent?","Address of the other parent",220.0,"",Questions.childText);
        }

      }

      //Answer No 47
      else if(widget.CheckCompleteQuestion =="Why was there no parental relationship to another person?" && widget.CheckQuestion == "Reason")
      {

        if(widget.CheckAnswer[0] == "Parent died")
        {
          //Question No 48
          return familydateContainer("","Child ${Questions.childLength}","When did the other parent die?","Date of death",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "Parent unknown")
        {
          //Question No 23
          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "No contact")
        {
          //Question No 49
          return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the address of the other parent?","Address of the other parent",220.0,"",Questions.childText);
        }
      }


      //Answer No 48
      else if(widget.CheckCompleteQuestion =="When did the other parent die?" && widget.CheckQuestion == "Date of death")
      {
        //Question No 23
        return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
      }

      //Answer No 49
      else if(widget.CheckCompleteQuestion =="Do you know the address of the other parent?" && widget.CheckQuestion == "Address of the other parent")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 50
          return familythreeoptionContainer("","Child ${Questions.childLength}","Please state here the reason why the details of the other parent are unknown.","Reason",["No contact","Not possible to get details","Officially unascertainable"],220.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 51
          return familythreeoptionContainer("","Child ${Questions.childLength}","What type of parent-child relationship was there between your child and the other parent?","Type of relationship",["Biological child","Adopted child","Foster child"],220.0,"",Questions.childText);
        }

      }


      //Answer No 50
      else if(widget.CheckCompleteQuestion =="Please state here the reason why the details of the other parent are unknown." && widget.CheckQuestion == "Reason")
      {
        //Question No 23
        return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
      }

      //Answer No 51
      else if(widget.CheckCompleteQuestion =="What type of parent-child relationship was there between your child and the other parent?" && widget.CheckQuestion == "Type of relationship")
      {
        //Question No 52
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationship between ${Questions.childFirstName} and the other parent last the entire year ?","Year-round parent-child relationship",220.0,"",Questions.childText);
      }

      //Answer No 52
      else if(widget.CheckCompleteQuestion =="Did the parent-child relationship between ${Questions.childFirstName} and the other parent last the entire year ?" && widget.CheckQuestion == "Year-round parent-child relationship")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 53
          return familythreeoptionContainer("","Child ${Questions.childLength}","How has the parent - child relationship changed during 2019?","Change parent-child relationship",["It began","It ended","It existed temporarily"],220.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 57
          return familycalculationContainer("","Child ${Questions.childLength}","What is the other parent's full name?","Name of the person",220.0,"",Questions.childText);
        }

      }

      //Answer No 53
      else if(widget.CheckCompleteQuestion =="How has the parent - child relationship changed during 2019?" && widget.CheckQuestion == "Change parent-child relationship")
      {

        if(widget.CheckAnswer[0] == "It began")
        {
          //Question No 54
          return familydateContainer("","Child ${Questions.childLength}","When did the parent-child relationships start?","Start parent-child relationship",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "It ended")
        {
          //Question No 55
          return familydateContainer("","Child ${Questions.childLength}","When did the parent-child relationships end?","End parent-child relationship",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "It existed temporarily")
        {
          //Question no 56
          //Ya container change hoga
          return familydateContainer("","Child ${Questions.childLength}","How long did the parent-child relationships last?","Duration parent-child relationship",430.0,"",Questions.childText);
        }
      }

//Answer No 54
      else if(widget.CheckCompleteQuestion =="When did the parent-child relationships start?" && widget.CheckQuestion == "Start parent-child relationship")
      {
       //Question No 57
        return familycalculationContainer("","Child ${Questions.childLength}","What is the other parent's full name?","Name of the person",220.0,"",Questions.childText);
      }

      //Answer No 55
      else if(widget.CheckCompleteQuestion =="When did the parent-child relationships end?" && widget.CheckQuestion == "End parent-child relationship")
      {
        //Question No 58
        return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationships end due to the death of the other parent?","End due to death",220.0,"",Questions.childText);
      }

      //Answer No 56
      else if(widget.CheckCompleteQuestion =="How long did the parent-child relationships last?" && widget.CheckQuestion == "Duration parent-child relationship")
      {
        //Question No 57
        return familycalculationContainer("","Child ${Questions.childLength}","What is the other parent's full name?","Name of the person",220.0,"",Questions.childText);
      }

      else if(widget.CheckCompleteQuestion =="Did the parent-child relationships end due to the death of the other parent?" && widget.CheckQuestion == "End due to death")
      {
        //Question No 57
        return familycalculationContainer("","Child ${Questions.childLength}","What is the other parent's full name?","Name of the person",220.0,"",Questions.childText);
      }


      //Answer No 57
      else if(widget.CheckCompleteQuestion =="What is the other parent's full name?" && widget.CheckQuestion == "Name of the person")
      {
        //Question No 58
        return familydateContainer("","Child ${Questions.childLength}","What is the other parent's date of birth?","Date of birth of the person",220.0,"",Questions.childText);
      }

      //Answer No 58
      else if(widget.CheckCompleteQuestion =="What is the other parent's date of birth?" && widget.CheckQuestion == "Date of birth of the person")
      {
        //Question No 59
        return familyaddressContainer("","Child ${Questions.childLength}","What is the other parent's (last known) address?","Address of the person",220.0,"",Questions.childText);
      }

      //Answer No 59
      else if(widget.CheckCompleteQuestion =="What is the other parent's (last known) address?" && widget.CheckQuestion == "Address of the person")
      {
        //Question No 23
        return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to request more than 50% of the child allowance?","Share child allowance",220.0,"",Questions.childText);
      }






      // ====== Patchwork Family Ends ====== //




      //Iska baad care costs wagera ka ho

// ====== Only with me Starts and At place of training Starts ======
      //Answer No 23
      else if(widget.CheckCompleteQuestion =="Would you like to request more than 50% of the child allowance?" && widget.CheckQuestion == "Share child allowance")
      {

        if(widget.CheckAnswer[0] == "No")
        {

          if(Questions.childrenLive == "Only with me")
          {
            //Question No 24
            return familyyesnoContainer("","Child ${Questions.childLength}","Did ${Questions.childFirstName} live with you the whole year?","All year",220.0,"",Questions.childText);
          }
          else if(Questions.childrenLive == "At place of training" || Questions.childrenLive == "Patchwork family")
            {
              //child expenses
              if(Questions.childrenExpense == "Care costs")
              {
                //Question No 60
                return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
              }

              else if(Questions.childrenExpense == "School fees")
              {
                //Question No 61
                return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
              }
              else if(Questions.childrenExpense == "Health insurance contributions")
              {
                //Question No 62
                return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
              }
              else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
              {
                //Question No 63
                return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
              }

          }


        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
        //Question No 33
          return familythreeoptionContainer("","Child ${Questions.childLength}","Why are you requesting the child allowance transfer?","Reason",["Alimony not paid","Inability to pay","I'm raising the child on my own"],220.0,"",Questions.childText);
        }

      }


      //Answer No 24
      else if(widget.CheckCompleteQuestion =="Did ${Questions.childFirstName} live with you the whole year?" && widget.CheckQuestion == "All year")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question No 25
          return familydateContainer("","Child ${Questions.childLength}","From when to when was ${Questions.childFirstName} offcially registered at your place?","Registered period",220.0,"",Questions.childText);

        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
         //Question No 26
          return familyyesnoContainer("","Child ${Questions.childLength}","Did you receive child benefit pay for ${Questions.childFirstName}?","Child benefit received",220.0,"",Questions.childText);
        }

      }


      //Answer no 25
      else if(widget.CheckCompleteQuestion =="From when to when was ${Questions.childFirstName} offcially registered at your place?" && widget.CheckQuestion == "Registered period")
      {
        //Question No 26
        return familyyesnoContainer("","Child ${Questions.childLength}","Did you receive child benefit pay for ${Questions.childFirstName}?","Child benefit received",220.0,"",Questions.childText);
      }


      //Answer No 26
      else if(widget.CheckCompleteQuestion =="Did you receive child benefit pay for ${Questions.childFirstName}?" && widget.CheckQuestion == "Child benefit received")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //child expenses
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }


        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 27
          return familyyesnoContainer("","Child ${Questions.childLength}","Did you receive child benefits for ${Questions.childFirstName} for the whole year?","Year-round child benefit",220.0,"",Questions.childText);
        }

      }

      //Answer No 27
      else if(widget.CheckCompleteQuestion =="Did you receive child benefits for ${Questions.childFirstName} for the whole year?" && widget.CheckQuestion == "Year-round child benefit")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question no 28
          //Ya container bad ma change hoga
          return familydateContainer("","Child ${Questions.childLength}","During which period did you receive child benefits?","Period child benefit",220.0,"",Questions.childAddressText);


        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 29
          return familyyesnoContainer("","Child ${Questions.childLength}","Was your partner living with you the entire year?","Year round with you",220.0,"",Questions.childText);
        }

      }


      //Answer No 28
      else if(widget.CheckCompleteQuestion =="During which period did you receive child benefits?" && widget.CheckQuestion == "Period child benefit")
      {
        //Question No 29
        return familyyesnoContainer("","Child ${Questions.childLength}","Was your partner living with you the entire year?","Year round with you",220.0,"",Questions.childText);
      }


      //Answer No 29
      else if(widget.CheckCompleteQuestion =="Was your partner living with you the entire year?" && widget.CheckQuestion == "Year round with you")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //Question no 30
          //Ya container bad ma change hoga
          return familydateContainer("","Child ${Questions.childLength}","When was your partner living with you?","Period with partner",220.0,"",Questions.childText);


        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 31
          return familycalculationContainer("","Child ${Questions.childLength}","What is your partner's first and last name?","Name of partner",220.0,"",Questions.childText);
        }

      }

      //Answer No 30
      else if(widget.CheckCompleteQuestion =="When was your partner living with you?" && widget.CheckQuestion == "Period with partner")
      {
        //Question No 31
        return familycalculationContainer("","Child ${Questions.childLength}","What is your partner's first and last name?","Name of partner",220.0,"",Questions.childText);
      }

      //Answer No 31
      else if(widget.CheckCompleteQuestion =="What is your partner's first and last name?" && widget.CheckQuestion == "Name of partner")
      {
        //Question No 32
        return familycalculationContainer("","Child ${Questions.childLength}","What was your partner's occupation?","Occupation partner",220.0,"",Questions.childText);
      }

      //Answer No 32
      else if(widget.CheckCompleteQuestion =="What was your partner's occupation?" && widget.CheckQuestion == "Occupation partner")
      {
        //child expenses
        if(Questions.childrenExpense == "Care costs")
        {
          //Question No 60
          return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
        }

        else if(Questions.childrenExpense == "School fees")
        {
          //Question No 61
          return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
        }
        else if(Questions.childrenExpense == "Health insurance contributions")
        {
          //Question No 62
          return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
        }
        else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
        {
          //Question No 63
          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
        }

      }



      //Answer No 33
      else if(widget.CheckCompleteQuestion =="Why are you requesting the child allowance transfer?" && widget.CheckQuestion == "Reason")
      {

        if(widget.CheckAnswer[0] == "Alimony not paid")
        {
          //Question No 34
          return familyyesnoContainer("","Child ${Questions.childLength}","Can you prove that the other parent paid less than 75% of the agreed child support?","Under 75%",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "Inability to pay")
        {
          //Question No 35
          return familyyesnoContainer("","Child ${Questions.childLength}","Did you receive any support payments according to the Unterhaltsvorschussgesetz?","Child Support acc. to law",220.0,"",Questions.childText);
        }

        else if(widget.CheckAnswer[0] == "I'm raising the child on my own")
        {
         //Question No 37
          return familydateContainer("","Child ${Questions.childLength}","For what period was your child registered at your residence only?","Child's residence",220.0,"",Questions.childText);
        }
      }

      //Answer No 34
      else if(widget.CheckCompleteQuestion =="Can you prove that the other parent paid less than 75% of the agreed child support?" && widget.CheckQuestion == "Under 75%")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          if(Questions.childrenLive == "Only with me")
          {
            //Question No 24
            return familyyesnoContainer("","Child ${Questions.childLength}","Did ${Questions.childFirstName} live with you the whole year?","All year",220.0,"",Questions.childText);
          }
          else if(Questions.childrenLive == "At place of training" || Questions.childrenLive == "Patchwork family")
          {
            //child expenses
            if(Questions.childrenExpense == "Care costs")
            {
              //Question No 60
              return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
            }

            else if(Questions.childrenExpense == "School fees")
            {
              //Question No 61
              return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
            }
            else if(Questions.childrenExpense == "Health insurance contributions")
            {
              //Question No 62
              return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
            }
            else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
            {
              //Question No 63
              return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
            }

          }
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 35
          return familyyesnoContainer("","Child ${Questions.childLength}","Did you receive any support payments according to the Unterhaltsvorschussgesetz?","Child Support acc. to law",220.0,"",Questions.childText);
        }

      }

      //Answer no 35
      else if(widget.CheckCompleteQuestion =="Did you receive any support payments according to the Unterhaltsvorschussgesetz?" && widget.CheckQuestion == "Child Support acc. to law")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          if(Questions.childrenLive == "Only with me")
          {
            //Question No 24
            return familyyesnoContainer("","Child ${Questions.childLength}","Did ${Questions.childFirstName} live with you the whole year?","All year",220.0,"",Questions.childText);
          }
          else if(Questions.childrenLive == "At place of training" || Questions.childrenLive == "Patchwork family")
          {
            //child expenses
            if(Questions.childrenExpense == "Care costs")
            {
              //Question No 60
              return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
            }

            else if(Questions.childrenExpense == "School fees")
            {
              //Question No 61
              return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
            }
            else if(Questions.childrenExpense == "Health insurance contributions")
            {
              //Question No 62
              return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
            }
            else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
            {
              //Question No 63
              return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
            }


          }
        }

        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 36
          //Ya container bad ma change hoga
          return familydateContainer("","Child ${Questions.childLength}","From when to when did you receive support payments according to the Unterhaltsvorschussgesetz?","Period support payments",220.0,"",Questions.childText);
        }

      }

      //Answer No 36
      else if(widget.CheckCompleteQuestion =="From when to when did you receive support payments according to the Unterhaltsvorschussgesetz?" && widget.CheckQuestion == "Period support payments")
      {
        if(Questions.childrenLive == "Only with me")
        {
          //Question No 24
          return familyyesnoContainer("","Child ${Questions.childLength}","Did ${Questions.childFirstName} live with you the whole year?","All year",220.0,"",Questions.childText);
        }
        else if(Questions.childrenLive == "At place of training" || Questions.childrenLive == "Patchwork family")
        {
          //child expenses
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }


        }
      }

      //Answer No 37
      else if(widget.CheckCompleteQuestion =="For what period was your child registered at your residence only?" && widget.CheckQuestion == "Child's residence")
      {
        if(Questions.childrenLive == "Only with me")
        {
          //Question No 24
          return familyyesnoContainer("","Child ${Questions.childLength}","Did ${Questions.childFirstName} live with you the whole year?","All year",220.0,"",Questions.childText);
        }
        else if(Questions.childrenLive == "At place of training" || Questions.childrenLive == "Patchwork family")
        {
          //child expenses
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }


        }
      }
// ====== Only with me Ends and At place of training Ends ======


      // ====== With the other parent Starts ======

      //Answer No 38
      else if(widget.CheckCompleteQuestion =="Did the other parent request a transfer of the allowance for childcare, education or training needs?" && widget.CheckQuestion == "Allowance transfer")
      {

        if(widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes")
        {
          //child expenses
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }

        }


      }

      // ====== With the other parent Ends ======


      // ====== With the Step/grand parent Starts ======

      //Answer No 39
      else if(widget.CheckCompleteQuestion =="Do you want to transfer the child allowance to the step or grandparents?" && widget.CheckQuestion == "Allowance transfer")
      {

        if(widget.CheckAnswer[0] == "No")
        {
          //child expenses
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }

        }
        else if(widget.CheckAnswer[0] == "Yes")
        {
          //Question No 40
          return familyyesnoContainer("","Child ${Questions.childLength}","Did you fill in annex K for the transfer of the child allowance?","Annex K",220.0,"",Questions.childText);

        }

      }

      //Answer No 40
      else if(widget.CheckCompleteQuestion =="Did you fill in annex K for the transfer of the child allowance?" && widget.CheckQuestion == "Annex K")
      {

        if(widget.CheckAnswer[0] == "No" || widget.CheckAnswer[0] == "Yes")
        {
          //child expenses
          if(Questions.childrenExpense == "Care costs")
          {
            //Question No 60
            return familymultipleoptionsContainer("","Child ${Questions.childLength}","How was your child cared for?","Childcare costs",["Nursery / kindergarten","Child minder","Nanny","Babysitter","Au pair","Daycare center"],["images/disabilityoption.png","images/alimonypaidoption.png","images/survivorspension.png","images/check.png","images/check.png"],430.0,"None of this applies",Questions.childText);
          }

          else if(Questions.childrenExpense == "School fees")
          {
            //Question No 61
            return familycalculationContainer("","Child ${Questions.childLength}","For how many schools did you pay tuition fees?","Schools attended",430.0,"loop",Questions.childText);
          }
          else if(Questions.childrenExpense == "Health insurance contributions")
          {
            //Question No 62
            return familytwooptionContainer("","Child ${Questions.childLength}","What type of contract is the health insurance policy?","Supplementary health insurance",["Domestic health insurance","Foreign health insurance"],430.0,"",Questions.childText);
          }
          else if(Questions.childrenExpense == "Costs due to disability" || Questions.childrenExpense == "None of this applies")
          {
            //Question No 63
            return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
          }

        }

      }


      // ====== With the Step/grand parent Ends ======

















//      //Answer No 7
//      else if(widget.CheckCompleteQuestion =="Do you wish to transfer your child's disability flat-rate amount to yourself?" && widget.CheckQuestion == "Transfer of flat-rate amount")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 8
//          //For No 220.0
//          //For Yes 430.0
//          return familyyesnoContainer("","Child ${Questions.childLength}","Was ${Questions.childFirstName} able to support themselves?","Financial independence of child",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//         //Question No 30
//          return familythreeoptionContainer("","Child ${Questions.childLength}","What impairment does ${Questions.childFirstName} suffer from?","Health impairment",["Blind or visually impaired","Permanently helpless","Impaired mobility","Generally impaired"],220.0,"",Questions.childText);
//        }
//
//      }
//
//
//      //Answer No 30
//      else if(widget.CheckCompleteQuestion =="What impairment does ${Questions.childFirstName} suffer from?" && widget.CheckQuestion == "Health impairment")
//      {
//
//        if(widget.CheckAnswer[0] == "Blind or visually impaired")
//        {
//         //Question No 31
//          return familycalculationContainer("","Child ${Questions.childLength}","Which degree of disability (GdB) does ${Questions.childFirstName} have?","Degree of disability",220.0,"percentage",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Permanently helpless")
//        {
//          //Question No 31
//          return familycalculationContainer("","Child ${Questions.childLength}","Which degree of disability (GdB) does ${Questions.childFirstName} have?","Degree of disability",220.0,"percentage",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Impaired mobility")
//        {
//          //Question No 31
//          return familycalculationContainer("","Child ${Questions.childLength}","Which degree of disability (GdB) does ${Questions.childFirstName} have?","Degree of disability",220.0,"percentage",Questions.childText);
//        }
//        else if(widget.CheckAnswer[0] == "Generally impaired")
//        {
//          //Question No 31
//          return familycalculationContainer("","Child ${Questions.childLength}","Which degree of disability (GdB) does ${Questions.childFirstName} have?","Degree of disability",220.0,"percentage",Questions.childText);
//        }
//      }
//
//
//
//      //Answer No 31
//      else if(widget.CheckCompleteQuestion =="Which degree of disability (GdB) does ${Questions.childFirstName} have?" && widget.CheckQuestion == "Degree of disability")
//      {
//        //Question No 32
//        return familydateContainer("","Child ${Questions.childLength}","Since when is the disability certificate valid?","Valid since",220.0,"",Questions.childText);
//      }
//
//
//      //Answer No 32
//      else if(widget.CheckCompleteQuestion =="Since when is the disability certificate valid?" && widget.CheckQuestion == "Valid since")
//      {
//        //Question No 33
//        return familyyesnoContainer("","Child ${Questions.childLength}","Is the certificate valid indefinitely?","Valid indefinitely",220.0,"",Questions.childText);
//      }
//
//
//      //Answer No 33
//      else if(widget.CheckCompleteQuestion =="Is the certificate valid indefinitely?" && widget.CheckQuestion == "Valid indefinitely")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 34
//          return familydateContainer("","Child ${Questions.childLength}","Until when is the disability certificate valid?","Valid until",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 35
//          return familyyesnoContainer("","Child ${Questions.childLength}","Are you and the other parent splitting the disability flat-rate amount equally?","Split 50%",220.0,"",Questions.childText);
//        }
//
//      }
//
//      //Answer No 34
//      else if(widget.CheckCompleteQuestion =="Until when is the disability certificate valid?" && widget.CheckQuestion == "Valid until")
//      {
//        //Question No 35
//        return familyyesnoContainer("","Child ${Questions.childLength}","Are you and the other parent splitting the disability flat-rate amount equally?","Split 50%",220.0,"",Questions.childText);
//      }
//
//
//      //Answer No 35
//      else if(widget.CheckCompleteQuestion =="Are you and the other parent splitting the disability flat-rate amount equally?" && widget.CheckQuestion == "Split 50%")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//        //Question No 36
//          return familycalculationContainer("","Child ${Questions.childLength}","What share are you requesting for yourself?","Your share",220.0,"percentage",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 8
//          return familyyesnoContainer("","Child ${Questions.childLength}","Was ${Questions.childFirstName} able to support themselves?","Financial independence of child",220.0,"",Questions.childText);
//        }
//
//      }
//
//      //Answer No 36
//      else if(widget.CheckCompleteQuestion =="What share are you requesting for yourself?" && widget.CheckQuestion == "Your share")
//      {
//        //Question No 8
//        return familyyesnoContainer("","Child ${Questions.childLength}","Was ${Questions.childFirstName} able to support themselves?","Financial independence of child",220.0,"",Questions.childText);
//      }
//
//
//
//
//
//
//
//      //Answer No 8
//      else if(widget.CheckCompleteQuestion =="Was ${Questions.childFirstName} able to support themselves?" && widget.CheckQuestion == "Financial independence of child")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 9
//          return familydateContainer("","Child ${Questions.childLength}","When did the event that led to your child's disability occur?","Start of disability",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Ya krna baqi ha
//
//        }
//
//      }
//
//      //Answer No 9
//      else if(widget.CheckCompleteQuestion =="When did the event that led to your child's disability occur?" && widget.CheckQuestion == "Start of disability")
//      {
//        //Question No 10
//        return familyyesnoContainer("","Child ${Questions.childLength}","Is ${Questions.childFirstName} younger than 25?","Under 25",220.0,"",Questions.childText);
//      }
//
//
//      //Answer No 10
//      else if(widget.CheckCompleteQuestion =="Is ${Questions.childFirstName} younger than 25?" && widget.CheckQuestion == "Under 25")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//         //Question No 11
//          //For No 340.0
//          //For yes
//          return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 11
//          return familyyesnoContainer("","Child ${Questions.childLength}","Do you know the details of the other parent?","Other parent's details",220.0,"",Questions.childText);
//        }
//
//      }
//
//
//
//
//      //jhhjh
//
//
//      //Answer No 11
//      else if(widget.CheckCompleteQuestion =="Do you know the details of the other parent?" && widget.CheckQuestion == "Other parent's details")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 12
//          return familythreeoptionContainer("","Child ${Questions.childLength}","Please choose the reason why you do not know the details of the other parent.","Reason",["No contact","Not possible to get details","Officially unascertainable"],430.0,"",Questions.childText);
//
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//         //Question No 14
//          return familycalculationContainer("","Child ${Questions.childLength}","What is the other parent's full name?","Name of other parent",220.0,"",Questions.childText);
//        }
//
//      }
//
//
//      //Answer No 12
//      else if(widget.CheckCompleteQuestion =="Please choose the reason why you do not know the details of the other parent." && widget.CheckQuestion == "Reason")
//      {
//
//        if(widget.CheckAnswer[0] == "No contact")
//        {
//         //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//
//        }
//
//        else if(widget.CheckAnswer[0] == "Not possible to get details")
//        {
//         //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//
//        }
//
//        else if(widget.CheckAnswer[0] == "Officially unascertainable")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//
//        }
//      }
//
//
//      //Answer No 14
//      else if(widget.CheckCompleteQuestion =="What is the other parent's full name?" && widget.CheckQuestion == "Name of other parent")
//      {
//        //Question No 15
//        return familydateContainer("","Child ${Questions.childLength}","What is the other parent's date of birth?","Date of birth other parent",220.0,"",Questions.childText);
//      }
//
//
//
//      //Answer No 15
//      else if(widget.CheckCompleteQuestion =="What is the other parent's date of birth?" && widget.CheckQuestion == "Date of birth other parent")
//      {
//        //Question No 16
//        return familyaddressContainer("","Child ${Questions.childLength}","What is the other parent's (last known) address?","Address other parent",220.0,"",Questions.childText);
//
//      }
//
//      //Answer No 16
//      else if(widget.CheckCompleteQuestion =="What is the other parent's (last known) address?" && widget.CheckQuestion == "Address other parent")
//      {
//        //Question No 17
//        //Ya container change hoga
//        return familydateContainer("","Child ${Questions.childLength}","When did the other parent live abroad?","Period living abroad",220.0,"",Questions.childText);
//
//      }
//
//      //Answer No 17
//      else if(widget.CheckCompleteQuestion =="When did the other parent live abroad?" && widget.CheckQuestion == "Period living abroad")
//      {
//        //Question No 18
//        //For No 430.0
//        //For Yes 220.0
//        return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationship between your child and the other parent last the entire year?","Year-round parent-child relationship",220.0,"",Questions.childText);
//
//      }
//
//      //Answer No 18
//      else if(widget.CheckCompleteQuestion =="Did the parent-child relationship between your child and the other parent last the entire year?" && widget.CheckQuestion == "Year-round parent-child relationship")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 19
//          return familythreeoptionContainer("","Child ${Questions.childLength}","How did the relationship change in 2019?","Change parent-child relationship",["It began","It ended","It existed temporarily"],220.0,"",Questions.childText);
//
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//        }
//
//      }
//
//      //Answer No 19
//      else if(widget.CheckCompleteQuestion =="How did the relationship change in 2019?" && widget.CheckQuestion == "Change parent-child relationship")
//      {
//
//        if(widget.CheckAnswer[0] == "It began")
//        {
//          //Question No 20
//          return familydateContainer("","Child ${Questions.childLength}","When did the parent-child relationship start?","Start parent-child relationship",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "It ended")
//        {
//          //Question No 21
//          //For No 430.0
//          //For Yes 220.0
//          return familyyesnoContainer("","Child ${Questions.childLength}","Did the parent-child relationship end due to the death of the other parent?","End due to death",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "It existed temporarily")
//        {
//          //Question No 29
//          //Ya container change hoga
//          return familydateContainer("","Child ${Questions.childLength}","From when to when did the parent-child relationship last?","Duration parent-child relationship",430.0,"",Questions.childText);
//        }
//      }
//
//
//      //Answer No 20
//      else if(widget.CheckCompleteQuestion =="When did the parent-child relationship start?" && widget.CheckQuestion == "Start parent-child relationship")
//      {
//        //Question No 13
//        return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//      }
//
//
//      //Answer No 21
//      else if(widget.CheckCompleteQuestion =="Did the parent-child relationship end due to the death of the other parent?" && widget.CheckQuestion == "End due to death")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//         //Question No 22
//          return familydateContainer("","Child ${Questions.childLength}","When did the parent-child relationship end?","End parent-child relationship",220.0,"",Questions.childText);
//        }
//
//      }
//
//      //Answer No 22
//      else if(widget.CheckCompleteQuestion =="When did the parent-child relationship end?" && widget.CheckQuestion == "End parent-child relationship")
//      {
//        //Question No 23
//        return familyyesnoContainer("","Child ${Questions.childLength}","Has your child received a survivor's pension?","Survivor's pension",220.0,"",Questions.childText);
//      }
//
//      //Answer No 23
//      else if(widget.CheckCompleteQuestion =="Has your child received a survivor's pension?" && widget.CheckQuestion == "Survivor's pension")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 24
//          return familyyesnoContainer("","Child ${Questions.childLength}","Would you like to have the tax benefits transferred to you?","Tax benefits",220.0,"",Questions.childText);
//        }
//
//      }
//
//      //Answer No 24
//      else if(widget.CheckCompleteQuestion =="Would you like to have the tax benefits transferred to you?" && widget.CheckQuestion == "Tax benefits")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 25
//          return familydateContainer("","Child ${Questions.childLength}","Since when is the survivor's pension certificate valid?","Valid since",220.0,"",Questions.childText);
//        }
//
//      }
//
//       //Answer No 25
//      else if(widget.CheckCompleteQuestion =="Since when is the survivor's pension certificate valid?" && widget.CheckQuestion == "Valid since")
//      {
//        //Question No 26
//        return familyyesnoContainer("","Child ${Questions.childLength}","Is the survivor's pension certificate valid indefinitely?","Valid indefinitely",220.0,"",Questions.childText);
//      }
//
//
//      //Answer No 26
//      else if(widget.CheckCompleteQuestion =="Is the survivor's pension certificate valid indefinitely?" && widget.CheckQuestion == "Valid indefinitely")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 27
//          return familydateContainer("","Child ${Questions.childLength}","Until when is the certificate valid?","Valid until",220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 28
//          return familyyesnoContainer("","Child ${Questions.childLength}","Is this the first time you are stating your child's survivor's pension certificate on your tax declaration?","First-time request",430.0,"",Questions.childText);
//        }
//
//      }
//
//      //Answer No 27
//      else if(widget.CheckCompleteQuestion =="Until when is the certificate valid?" && widget.CheckQuestion == "Valid until")
//      {
//        //Question No 28
//        return familyyesnoContainer("","Child ${Questions.childLength}","Is this the first time you are stating your child's survivor's pension certificate on your tax declaration?","First-time request",430.0,"",Questions.childText);
//      }
//
//
//      //Answer No 28
//      else if(widget.CheckCompleteQuestion =="Is this the first time you are stating your child's survivor's pension certificate on your tax declaration?" && widget.CheckQuestion == "First-time request")
//      {
//
//        if(widget.CheckAnswer[0] == "No")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//        }
//
//        else if(widget.CheckAnswer[0] == "Yes")
//        {
//          //Question No 13
//          return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//        }
//
//      }
//
//
//      //Answer No 29
//      else if(widget.CheckCompleteQuestion =="From when to when did the parent-child relationship last?" && widget.CheckQuestion == "Duration parent-child relationship")
//      {
//        //Question No 13
//        return familydifferentoptionContainer("","Child ${Questions.childLength}","Which is the designated benefits office for child benefits for ${Questions.childFirstName}?","Benefits office",["Baden-Württemberg Ost","Baden-Württemberg West","Bayern Nord","Bayern Süd","Berlin-Brandenburg","Hessen","Niedersachsen-Bremen","Nord","Nordrhein-Westfalen Nord","Nordrhein-Westfalen Ost","Nordrhein-Westfalen West","Rheinland-Pfalz-Saarland","Sachsen","Sachsen-Anhalt - Thüringen","Other"],220.0,"",Questions.childText);
//      }






    }
  }




  Widget familycalculationContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyCalculationContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

  Widget familydateContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyDateContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

  Widget familymultipleoptionsContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,List AnswerImages, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyMultipleOptionsContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,answerImages:AnswerImages,containerSize:430.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget familyyesnoContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData)
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyYesNoContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:220.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget familythreeoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyThreeOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:340.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget familydifferentoptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyDifferentOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:420.0,additionalData:AdditionalData,multipleData:MultipleData);
  }

  Widget familyaddressContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption, double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.homeAnimatedContainer = animatedcontainer;
    return FamilyAddressContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,containerSize:210.0,additionalData:AdditionalData,multipleData:MultipleData);

  }

  Widget familytwooptionContainer(String Identity,String BigQuestion,String CompleteQuestion,String QuestionOption,List AnswerOption,double animatedcontainer, String AdditionalData, String MultipleData )
  {
    Questions.familyAnimatedContainer = animatedcontainer;
    return FamilyTwoOptionContainer(identity:Identity,bigQuestion:BigQuestion,completeQuestion:CompleteQuestion,questionOption:QuestionOption,answerOption:AnswerOption,containerSize:280.0,additionalData:AdditionalData,multipleData:MultipleData);
  }
}