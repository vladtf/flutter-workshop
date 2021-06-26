import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class MainPage extends StatelessWidget {
  Map<String, double> dataMap = {
    "Flutter": 5,
    "React": 3,
    "Xamarin": 2,
    "Ionic": 2,
  };

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('A meaningful title'),
    );
    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Card(
                child: PieChart(dataMap: dataMap),
              ),
            ),
            Expanded(
              flex: 2,
              child: Card(
                child: Container(
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
