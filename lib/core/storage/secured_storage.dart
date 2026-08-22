import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecuredStorageService {
  final _storage = const FlutterSecureStorage();
  
  Future<SharedPreferences> get _prefs async => await SharedPreferences.getInstance();

  Future<void> set(String key, dynamic value) async {
    final stringValue = jsonEncode(value);
    if (kIsWeb) {
      final prefs = await _prefs;
      await prefs.setString(key, stringValue);
    } else {
      await _storage.write(key: key, value: stringValue);
    }
  }

  Future<T?> get<T>(String key) async {
    String? value;
    if (kIsWeb) {
      final prefs = await _prefs;
      value = prefs.getString(key);
    } else {
      value = await _storage.read(key: key);
    }
    
    if (value == null) {
      return null;
    }
    return jsonDecode(value) as T;
  }

  Future<void> remove(String key) async {
    if (kIsWeb) {
      final prefs = await _prefs;
      await prefs.remove(key);
    } else {
      await _storage.delete(key: key);
    }
  }

  Future<void> clear() async {
    if (kIsWeb) {
      final prefs = await _prefs;
      await prefs.clear();
    } else {
      await _storage.deleteAll();
    }
  }
}

final securedStorageService = SecuredStorageService();
