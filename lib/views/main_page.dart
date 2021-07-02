import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/providers/data_provider.dart';
import 'package:flutter_workshop/providers/firebase_data_provider.dart';
import 'package:flutter_workshop/utils/routes.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var dataProvider = Provider.of<FirebaseDataProvider>(context);
    dataProvider.fetchDataMap();

    Map<String, double> dataMap = dataProvider.dataMap;

    return Scaffold(
      appBar: AppBar(
        title: Text('View chart'),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: dataMap == null
                ? null
                : () => Navigator.of(context).pushNamed('/edit'),
          )
        ],
      ),
      body: FutureBuilder<Map<String, double>>(
          future: Provider.of<FirebaseDataProvider>(context).fetchDataMap(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Something went wrong.'));
              }
              return PieChart(
                dataMap: snapshot.data ?? {},
                legendPosition: LegendPosition.top,
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
