import 'package:flutter/material.dart';

class AllCategoryScreen extends StatefulWidget {
  @override
  _AllCategoryScreenState createState() => _AllCategoryScreenState();
}

class _AllCategoryScreenState extends State<AllCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child:Column(
              children: <Widget>[
                SizedBox(
                  height:35.0,
                ),

                ListTile(
                  leading:GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                  child:Icon(
                    Icons.arrow_back_ios,
                    color: Colors.lightBlue,
                    size: 22.0,

                  )),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.person,
                        color: Colors.lightBlue,
                        size: 25.0,

                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.email,
                    color: Colors.lightBlue,
                    size: 25.0,

                  ),
                ),


                Container(
                  height: 60.0,
                  color: Colors.lightBlue,

                  child: ListTile(

                      title: Container(child:Text("You have not verified your email address yet.",style: TextStyle(color: Colors.white,fontSize: 13.0),)),
                      trailing: Text("Resend Email",style: TextStyle(fontSize: 15.0),)
                  ),

                ),


                ListTile(
                  title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 2.0,
                ),


                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent[100],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.print,
                            color: Colors.grey,
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Living Situation",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),







                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.camera,
                            color: Colors.grey[500],
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Income",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),




                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.home,
                            color: Colors.grey[500],
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Home",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),





                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.work,
                            color: Colors.grey[500],
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Work",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),





                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.airplay,
                            color: Colors.grey[500],
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Education",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),





                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.healing,
                            color: Colors.grey[500],
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Health",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),




                ListTile(
                  title: Row(
                    children: <Widget>[
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          shape: BoxShape.circle,
                        ),
                        child: ClipOval(
                          child: Icon(
                            Icons.format_indent_decrease,
                            color: Colors.grey[500],
                            size: 26.0,
                          ),
                        ),

                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 12.0),
                        child: Text("Finances",style: TextStyle(fontSize: 14.0,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.grey,
                    size: 16.0,
                  ),
                  // title:Text("Tax 2019",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),
                ),

                Divider(
                  height: 10.0,
                  thickness: 1.0,
                ),

                SizedBox(
                  height: 1.5,
                ),


                Container(
                  height: 5.0,
                  decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(5.0),
//                color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        //offset: Offset(0.0, 1.0), //(x,y)
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                ),


                Container(

                  color: Colors.white,
                  child:ListTile(

                    leading: Container(width:MediaQuery.of(context).size.width*0.3,child:Text("Add income to see your result",style: TextStyle(color: Colors.black,fontSize: 13.0,fontWeight: FontWeight.bold),)),


                    trailing:  GestureDetector(
                        onTap: (){
                          //Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Photo()));
                        },
                        child:Container(
                          //margin: EdgeInsets.only(top:MediaQuery.of(context).size.height*0.3),
                            width: MediaQuery.of(context).size.width*0.25,
                            height: 35.0,
                            decoration: BoxDecoration(
                              color: Colors.lightBlueAccent,
                              border: Border.all(
                                color: Colors.lightBlueAccent, //                   <--- border color
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child:Center(
                              child:Text("Continue",style: TextStyle(fontSize: 14.0,color: Colors.white,),),
                            ))),

                  ),
                )






              ],
            )
        )
    );
  }
}
