import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: Text('A meaningful title'),
    );
    return Scaffold(
      appBar: appBar,
      body: Card(
        child: Container(
          color: Colors.redAccent,
          height: (MediaQuery.of(context).size.height -
                  appBar.preferredSize.height) / 3,
        ),
      ),
    );
  }
}
