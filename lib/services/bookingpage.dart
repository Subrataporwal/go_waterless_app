// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:gowaterless_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QuickBooking extends StatefulWidget {
  QuickBooking({Key? key}) : super(key: key);

  @override
  _QuickBookingState createState() => _QuickBookingState();
}

class _QuickBookingState extends State<QuickBooking> {
  Future<Widget> _wait3SecAndLoadImage() async {
    await Future.delayed(const Duration(seconds: 3));
    return OneTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kdark,
          title: const Text('Quick Booking'),
        ),
        body: Center(
          child: FutureBuilder<Widget>(
              future: _wait3SecAndLoadImage(),
              builder: (BuildContext context, AsyncSnapshot<Widget> snapshot) {
                if ((!snapshot.hasData)) {
                  return CircularProgressIndicator(
                    color: kblue,
                  );
                } else {
                  return OneTime();
                }
              }),
        ));
  }

  // ignore: non_constant_identifier_names
  Widget OneTime() => const WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.gowaterless.in/app/',
      );
}
