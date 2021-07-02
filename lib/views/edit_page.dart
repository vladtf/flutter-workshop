import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workshop/providers/data_provider.dart';
import 'package:flutter_workshop/providers/firebase_data_provider.dart';
import 'package:flutter_workshop/utils/utils.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class EditPage extends StatefulWidget {
  @override
  _EditPageState createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  Map<String, double> dataMap;

  FocusNode focusNode;

  @override
  void initState() {
    super.initState();

    focusNode = FocusNode();

    dataMap = Provider.of<FirebaseDataProvider>(context, listen: false).dataMap;
  }

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('Edit Page'),
      actions: [
        TextButton(
          child: Text("Save"),
          onPressed: () {
            Provider.of<FirebaseDataProvider>(context, listen: false).dataMap = dataMap;
            Navigator.of(context).pop();
          },
        )
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: (dataMap == null)
          ? Center(child: Text('No data to edit'))
          : Padding(
              padding: EdgeInsets.all(8.0),
              child: ListView(children: [
                Card(
                  child: PieChart(dataMap: dataMap),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: Text(
                              "Name",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Text(
                              "Value",
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(),
                Column(children: buildTextFields(dataMap, context))
              ]),
            ),
    );
  }

  List<Widget> buildTextFields(
      Map<String, double> dataMap, BuildContext context) {
    var rows = dataMap.entries
        .map((e) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Focus(
                      child: TextFormField(
                        initialValue: e.key,
                        readOnly: true,
                      ),
                      // onFocusChange: (hasFocus) => focusNode.nextFocus(),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    flex: 1,
                    child: TextFormField(
                      initialValue: e.value.toString(),
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      onChanged: (value) {
                        var newValue =
                            Utils.isNumeric(value) ? double.parse(value) : 0.0;
                        // double.parse(value) ?? 0.0;

                        setState(() {
                          dataMap[e.key] = newValue;
                        });
                        print("${e.key} : ${newValue.toString()}");
                      },
                      onEditingComplete: () {
                        // focusNode.nextFocus();
                      },
                    ),
                  )
                ],
              ),
            ))
        .toList();

    rows.add(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Focus(
              child: Text(
                "Total: ",
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.right,
              ),
            ),
          ),
          SizedBox(
            width: 16.0,
          ),
          Expanded(
            flex: 1,
            child: TextFormField(
              initialValue: dataMap.values
                  .fold(
                      0,
                      (dynamic previousValue, element) =>
                          previousValue + element)
                  .toString(),
              readOnly: true,
            ),
          )
        ],
      ),
    ));
    return rows;
  }

  @override
  void dispose() {
    // Clean up the focus node when the Form is disposed.
    focusNode.dispose();

    super.dispose();
  }
}
