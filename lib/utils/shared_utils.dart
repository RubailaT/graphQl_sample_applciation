import 'package:shared_preferences/shared_preferences.dart';

class SharedUtils {
  static late SharedPreferences sharedPreferences;

  static getString(String key) async {
    sharedPreferences = await SharedPreferences.getInstance();
    return (sharedPreferences.getString(key) ?? '');
  }
}
