// ignore_for_file: camel_case_types, non_constant_identifier_names, annotate_overrides, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:io';

import 'package:gowaterless_app/constant.dart';
import 'package:gowaterless_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CD_services_1 extends StatefulWidget {
  CD_services_1({Key? key}) : super(key: key);

  @override
  _CD_services_1State createState() => _CD_services_1State();
}

class _CD_services_1State extends State<CD_services_1> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Home()));
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: kdark,
        title: Text(
          'Booking Page',
        ),
      ),
      body: WebView(
        debuggingEnabled: true,
        javascriptMode: JavascriptMode.unrestricted,
        gestureNavigationEnabled: true,
        initialUrl: 'https://www.gowaterless.in/cd_service1/',
      ),
    );
  }
}
