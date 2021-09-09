import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  setData(key, value) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();

    _prefs.setString(key, value);
  }

  getData(key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.getString(key);
    return _prefs;
  }

  removeData(key) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    _prefs.remove(key);
  }
}
