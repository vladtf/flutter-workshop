class Utils {
  static bool isNumeric(String value) {
    var tryParse = double.tryParse(value);

    return tryParse != null;
  }
}
