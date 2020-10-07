import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  Future<void> persistToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('accessTokenJaemin', token);
    return;
  }

  Future<String> getAccessToken() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenJaemin');
    return accessToken;
  }

  Future<void> signOut() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove("accessTokenJaemin");
    return;
  }

  Future<bool> isSignedIn() async {
    final prefs = await SharedPreferences.getInstance();
    String accessToken = prefs.getString('accessTokenJaemin');
    if (accessToken != null) {
      return true;
    } else {
      return false;
    }
  }
}
