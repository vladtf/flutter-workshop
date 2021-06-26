import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/utils/routes.dart';
import 'package:flutter_workshop/utils/utils.dart';
import 'package:flutter_workshop/views/edit_page.dart';
import 'package:pie_chart/pie_chart.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = new Map();
    dataMap.putIfAbsent("Flutter", () => 5);
    dataMap.putIfAbsent("React", () => 3);
    dataMap.putIfAbsent("Xamarin", () => 2);
    dataMap.putIfAbsent("Ionic", () => 2);

    return Scaffold(
      appBar: AppBar(
        title: Text('View chart'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () =>
                Navigator.of(context).pushNamed(Routes.editPage()),
          )
        ],
      ),
      body: PieChart(
        dataMap: dataMap,
        legendPosition: LegendPosition.bottom,
      ),
    );
  }
}
