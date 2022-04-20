// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, unused_field, prefer_final_fields, use_key_in_widget_constructors, unnecessary_new, invalid_return_type_for_catch_error

import 'package:firebase_core/firebase_core.dart';
import 'package:gowaterless_app/onboard/onboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gowaterless_app/pages/splash.dart';
import 'package:in_app_update/in_app_update.dart';
import 'dart:async';
import 'package:connection_notifier/connection_notifier.dart';

int? isviewed;
void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isviewed = prefs.getInt('onBoard');
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppUpdateInfo? _updateInfo;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();
  Future<void> checkForUpdate() async {
    InAppUpdate.checkForUpdate().then((info) {
      setState(() {
        _updateInfo = info;
      });
    }).catchError((e) {
      showSnack(e.toString());
    });
  }

  void showSnack(String text) {
    if (_scaffoldKey.currentContext != null) {
      ScaffoldMessenger.of(_scaffoldKey.currentContext!)
          .showSnackBar(SnackBar(content: Text(text)));
    }
  }

  Future<void> performImmediateUpdate() async {
    _updateInfo?.updateAvailability == UpdateAvailability.updateAvailable
        ? () {
            InAppUpdate.performImmediateUpdate()
                .catchError((e) => showSnack(e.toString()));
          }
        : null;
  }

  @override
  Widget build(BuildContext context) {
    return ConnectionNotifier(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Go Waterless App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: isviewed != 0 ? OnBoard() : SplashScreen(),
      ),
    );
  }
}
