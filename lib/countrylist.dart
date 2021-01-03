
import 'package:flutter/cupertino.dart';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api_102/statistics.dart';

class countrylist extends StatefulWidget {
  /**final questionLength,quizTitle;
  quizPage({this.questionLength,this.quizTitle});**/
  @override
  _countrylistState createState() => _countrylistState();
}

class _countrylistState extends State<countrylist> {
  int ranking;
  List data;
  bool loading=true;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://coronavirus-19-api.herokuapp.com/countries/"),
        headers: {
          "Accept": "application/json"
        }
    );

     this.setState(() {
       data = json.decode(response.body);
       loading=false;
     });
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(title: new Text("List of Countries"), backgroundColor: Colors.indigo),
      body: (data==null)?Center(child:CircularProgressIndicator() ,):


      ListView.builder(

        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){

          return new Container(
              margin: EdgeInsets.only(left: 30,right: 30,top: 10),
              child:new InkWell(
                onTap: (){

                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => statistics(cases: data[index]["cases"].toDouble(),recovered: data[index]["recovered"].toDouble(),deaths: data[index]["deaths"].toDouble(),active:data[index]["active"].toDouble(),country:data[index]["country"])
                  ));
                },
                child: Card(

                  // margin: EdgeInsets.only(top: 20,bottom: 20),
                  // color: Colors.pink,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: new Align(
                        alignment: Alignment.topCenter,
                        child:new Column(

                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(height: 10,),
                        Text(data[index]["country"],style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.indigo,),textAlign: TextAlign.justify,),
                        Text("Cases: "+data[index]["cases"].toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.justify,),
                        Text("Today Cases: "+data[index]["todayCases"].toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                        Text("Deaths: "+data[index]["deaths"].toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                        Text("Today Deaths: "+data[index]["todayDeaths"].toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                        Text("Recovered: "+data[index]["recovered"].toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                        Text("Active: "+data[index]["active"].toString(),style: TextStyle(fontSize: 15),textAlign: TextAlign.left,),
                        SizedBox(height: 10,),
                      ],))
                ),));
        },
      ),
    );
  }

}