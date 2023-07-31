import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  const SharedPreference();

  static const _userNameKey = 'USER_NAME';

  Future<void> _savePreference(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> _getPreference(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedPreference = prefs.getString(key);
    if (savedPreference == null) {
      return "";
    }
    return savedPreference;
  }
}