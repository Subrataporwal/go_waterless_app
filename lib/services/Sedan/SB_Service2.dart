// ignore_for_file: camel_case_types, non_constant_identifier_names, annotate_overrides, prefer_const_constructors_in_immutables, prefer_const_constructors

import 'dart:io';

import 'package:gowaterless_app/constant.dart';
import 'package:gowaterless_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SB_services_2 extends StatefulWidget {
  SB_services_2({Key? key}) : super(key: key);

  @override
  _SB_services_2State createState() => _SB_services_2State();
}

class _SB_services_2State extends State<SB_services_2> {
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
        initialUrl: 'https://www.gowaterless.in/sb_service2/',
      ),
    );
  }
}
