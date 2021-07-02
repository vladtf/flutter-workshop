import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:preferences/preferences.dart';

class FirebaseDataProvider with ChangeNotifier {
  Map<String, double> _dataMap;
  final Firestore _db = Firestore.instance;

  FirebaseDataProvider() {}

  Map<String, double> get dataMap => _dataMap;

  set dataMap(Map<String, double> newDataMap) {
    _dataMap = newDataMap;
    updateDataMap(newDataMap);
    notifyListeners();
  }

  Future<Map<String, double>> fetchDataMap() async {
    // await Future.delayed(Duration(seconds: 5));

    DocumentSnapshot snap =
    await _db.collection('data').document('5btfG6oN2YzjbfTrq1R6').get();

    _dataMap = Map<String, double>.from(snap.data['data_map']
        .map((key, value) => MapEntry(key, value.toDouble())));

    return _dataMap;
  }

  void updateDataMap(Map<String, double> newDataMap) async {
    DocumentReference ref =
    _db.collection('data').document('5btfG6oN2YzjbfTrq1R6');

    await ref.updateData({'data_map': newDataMap});
  }

}
