import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_ui/provider/all_user_provider.dart';
import 'app_ui/provider/api_provider.dart';
import 'app_ui/provider/create_user_provider.dart';
import 'app_ui/provider/edit_password_controller.dart';
import 'app_ui/provider/home_edit_provider.dart';
import 'app_ui/provider/login_provider.dart';
import 'app_ui/ui/material_app.dart';



void main() async {
  // await AppPref().isPreferenceReady;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) {
            return AllDataProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return LoginScrProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return CreateUserScrProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return HomeEditScrProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return EditPasswordProvider();
          },
        ),
        ChangeNotifierProvider(
          create: (_) {
            return ApiFetchDataProvider();
          },
        ),
      ],
      child: FloorApp(),
    ),
  );
}

// import 'dart:async';
// import 'dart:convert';
//
// import 'package:shared_preferences/shared_preferences.dart';
// class AppPref {
//   //region setup
//   late Future _isPreferenceInstanceReady;
//   late SharedPreferences _preferences;
//
//   static final AppPref _instance = AppPref._internal();
//
//   factory AppPref() => _instance;
//
//   AppPref._internal() {
//     _isPreferenceInstanceReady = SharedPreferences.getInstance().then((preferences) => _preferences = preferences);
//   }
//
//   Future get isPreferenceReady => _isPreferenceInstanceReady;
//
//   //endregion setup
//
//   bool get isUser => _preferences.getBool('isUser') ?? false;
//
//   set isUser(bool value) => _preferences.setBool('isUser', value);
//
//   bool get isLogin => _preferences.getBool('isLogin') ?? false;
//
//   set isLogin(bool value) => _preferences.setBool('isLogin', value);
//
//   String get userToken => _preferences.getString('userToken') ?? '';
//
//   set userToken(String value) => _preferences.setString('userToken', value);
//
//   String get userId => _preferences.getString('userId') ?? '';
//
//   set userId(String value) => _preferences.setString('userId', value);
//
//   void setUserData(Profile profile) {
//     userId = profile.id;
//     userProfile = profile;
//   }
//
//   BaseUser get basicProfile =>
//       _preferences.containsKey('userProfile') ? BaseUser.fromJson(jsonDecode(_preferences.getString('userProfile'))) : null;
//
//   Profile get userProfile =>
//       _preferences.containsKey('userProfile') ? Profile.fromJson(jsonDecode(_preferences.getString('userProfile'))) : null;
//
//   set userProfile(Profile value) => _preferences.setString('userProfile', jsonEncode(value));
//
//   String get selectedChannelId => _preferences.getString('selectedChannelId') ?? '';
//
//   set selectedChannelId(String value) => _preferences.setString('selectedChannelId', value);
//
//   clear() => _preferences.clear();
// }
//
// ****************USED METHOD IN SharedPreferences
// if (AppPref().isLogin) {
// AppPref().isLogin = true;
// }

