import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

final dbClientProvider = Provider<DbClient>((ref) {
  return DbClient();
});

class DbClient {
  removeData({required String dbKey}) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(dbKey);
  }

  setListData({required String dbKey, required List<String> listData}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(dbKey, listData);
  }

  Future<List<String>> getListData({required String dbKey}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getStringList(dbKey);
    return result ?? [];
  }

  setData({required String dbKey, required String value}) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(dbKey, value);
  }

  getData({required var dbKey}) async {
    final prefs = await SharedPreferences.getInstance();
    final result = prefs.getString(dbKey);
    return result ?? "";
  }

  reset() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

class InitializeApp {
  appInitialize() async {
    final binding = WidgetsFlutterBinding.ensureInitialized();
    FlutterNativeSplash.preserve(widgetsBinding: binding);
    await SharedPreferences.getInstance();
  }
}
