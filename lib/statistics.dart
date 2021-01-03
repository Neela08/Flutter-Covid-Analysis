import 'dart:convert';
import 'dart:ffi';

import 'package:rest_api_102/main.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class statistics extends StatefulWidget {
  final cases,recovered,deaths,active,country;
  statistics({this.cases,this.recovered,this.deaths,this.active,this.country});
  @override
  _statisticsState createState() => _statisticsState();
}

class _statisticsState extends State<statistics> {
  double R,D,A;
  void calculate()
  {
    double r,d,a;
    r=((widget.recovered/widget.cases)*100);
    R = num.parse(r.toStringAsFixed(2));
    d= (widget.deaths/widget.cases)*100;
    D = num.parse(d.toStringAsFixed(2));
    a=(widget.active/widget.cases)*100;
    A = num.parse(a.toStringAsFixed(2));


  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    calculate();
  }


  @override
  Widget build(BuildContext context) {
    final List<ChartData> chartData = [
      ChartData('Recovered', R, Colors.indigo),
      ChartData('Deaths', D, Colors.grey),
      ChartData('Active', A, Colors.amber),
      //  ChartData('Jack', 34, Color.fromRGBO(228, 0, 124, 1)),
      //  ChartData('Others', 52, Color.fromRGBO(255, 189, 57, 1))
    ];
    return Scaffold(
      appBar:  new AppBar(title: new Text(widget.country), backgroundColor: Colors.grey),
        body: Padding(
          padding: EdgeInsets.only(top: 70,left: 20,right: 20),
          child: Column(

            children: [
               Container(
                 height: 300,
                margin: EdgeInsets.only(top: 20.0),
                child: SfCircularChart(
                    legend: Legend(isVisible: true,
                      position: LegendPosition.bottom,
                    ),
                    borderWidth: 3,
                    series: <CircularSeries>[
                      // Renders doughnut chart
                      DoughnutSeries<ChartData, String>(
                          dataSource: chartData,
                          pointColorMapper: (ChartData data, _) => data.color,
                          xValueMapper: (ChartData data, _) => data.x,
                          yValueMapper: (ChartData data, _) => data.y,
                          dataLabelSettings: DataLabelSettings(
                            // Renders the data label
                            isVisible: true,


                          )
                      )
                    ]
                ),

              ),

              InkWell(onTap: (){},

          child: Text('calculated on total cases (in %)'),
              )

            ],
          ),

        )
    );
  }
}
class ChartData {
  ChartData(this.x, this.y, [this.color]);
  final String x;
  final double y;
  final Color color;
}