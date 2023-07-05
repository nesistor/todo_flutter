import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  const SharedPreference();

  static const _userNameKey = 'USER_NAME';
  static const _userToken = "TOKEN";
  static const _refreshToken = "REFRESH_TOKEN";
  static const _lastSynchronizationDatetimeKey =
      "LAST_SYNCHRONIZATION_DATETIME";
  static const _messageIDKey = 'MESSAGE_ID';

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

  void saveUserName(String userName) {
    _savePreference(_userNameKey, userName);
  }

  Future<void> saveToken(String token) async {
    await _savePreference(_userToken, token);
  }

  Future<void> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_userToken);
  }

  Future<void> removeRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(_refreshToken);
  }

  Future<void> saveRefreshToken(String refreshToken) async {
    await _savePreference(_refreshToken, refreshToken);
  }

  Future<void> saveLastSynchronizationDateTime(DateTime dateTime) async {
    await _savePreference(_refreshToken, dateTime.toString());
  }

  Future<String> getLastSynchronizationDateTime() {
    return _getPreference(_lastSynchronizationDatetimeKey);
  }

  Future<String> getUserToken() {
    return _getPreference(_userToken);
  }

  Future<String> getUserRefreshToken() {
    return _getPreference(_refreshToken);
  }

  Future<String> getUserName() {
    return _getPreference(_userNameKey);
  }

  void saveMessageID(String messageID) {
    _savePreference(_messageIDKey, messageID);
  }

  Future<String> getMessageID() {
    return _getPreference(_messageIDKey);
  }
}