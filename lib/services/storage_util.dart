import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  static StorageUtil? _storageUtil;
  static SharedPreferences? _preferences;

  static Future<StorageUtil> getInstance() async {
    if (_storageUtil == null) {
      var secureStorage = StorageUtil._();
      await secureStorage._init();
      _storageUtil = secureStorage;
    }
    return _storageUtil!;
  }

  StorageUtil._();
  Future _init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // get string
  static int getInt(String key, {int defValue = 0}) {
    if (_preferences == null) return defValue;
    return _preferences?.getInt(key) ?? defValue;
  }

  // put string
  static Future<bool> putInt(String key, int value) {
    return _preferences!.setInt(key, value);
  }

  // clear string
  static Future<bool> clrData() {
    SharedPreferences prefs = _preferences!;
    return prefs.clear();
  }
}
