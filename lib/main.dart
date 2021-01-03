import 'dart:async';
import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_102/countrylist.dart';
import 'package:rest_api_102/featureOnClick.dart';
void main() {
  runApp(new MaterialApp(
      home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context){
return Scaffold(
  backgroundColor: Colors.white,
body: SingleChildScrollView(child:
    new Container(
  margin: EdgeInsets.only(top: 30),
  child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
        new Stack(
          alignment: Alignment.centerLeft,
          children: [
            Image.asset('assets/corona1.png'),
            Text('Covid-19 App',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.indigo),)
          ],),
   SizedBox(height: 20,),
   new Container(
     //margin: EdgeInsets.only(left: 15,right: 15),
     width: MediaQuery.of(context).size.width,
     child:new Column(
       children: [new Row(
         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
         children: [features('assets/world.png', 'Countries',countrylist,1),features('assets/symptoms.png', 'Check Symptoms',null,2)],
       ),
         SizedBox(height: 20,),
        new Row(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: [features('assets/centers.png', 'Test Centers',null,3),features('assets/hotline.png','Hotline', null,4)],
         )
       ],
     )
   )
      




    ],
  ),
),)
);
  }

  Widget features(String imgPath,String title, method,int type) {
    return InkWell(onTap: (){
if(type==1){ Navigator.of(context).push(MaterialPageRoute(
    builder: (context) =>countrylist()
    ));}

       else if(type==2)
         {
         new myFeatures().symptomChecker();
         }
       else if(type==4)
         {
           new myFeatures().makingPhoneCall();
         }
       else {

       }
    },
    child:Align(
      alignment: Alignment.topLeft,
      child:Container(
        height: 250,
        width: MediaQuery.of(context).size.width/2,
       // margin: EdgeInsets.only(left: 15,right: 15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
           // border: Border.all(color: Colors.indigo)
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
                height: 220,
                width: MediaQuery.of(context).size.width/2-20,
                child:Image.asset(imgPath)
            ),
            Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18,color: Colors.indigo),)
          ],
        ),

      ) ,
    ) ,
    );


}
}
