import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:preferences/preferences.dart';

class DataProvider with ChangeNotifier {
  Map<String, double> _dataMap;

  DataProvider() {
    var keys = PrefService.get('data_map_keys');
    var values = PrefService.get('data_map_values');

    _dataMap = Map<String, double>.from(keys.asMap().map((index, key) =>
        MapEntry(key, double.tryParse(values[index] ?? 0 as String))));
  }

  Map<String, double> get dataMap => _dataMap;

  set dataMap(Map<String, double> value) {
    _dataMap = value;

    PrefService.setStringList(
        'data_map_keys', List<String>.from(_dataMap.keys));
    PrefService.setStringList('data_map_values',
        List<String>.from(_dataMap.values.map((e) => e.toString())));

    notifyListeners();
  }
}
