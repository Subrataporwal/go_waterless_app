// ignore_for_file: prefer_const_constructors_in_immutables, avoid_unnecessary_containers

import 'package:gowaterless_app/constant.dart';
import 'package:gowaterless_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigatetohome();
  }

  _navigatetohome() async {
    await Future.delayed(const Duration(milliseconds: 2000), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => Home()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
              height: 150,
              width: 150,
              child: Image.asset('assets/images/logo.png')),
          const SizedBox(height: 50),
          Container(
            child: Text(
              'Go Waterless',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: kdark),
              ),
            ),
          ),
          Container(
            child: Text(
              'A waterless Car Care Brand',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 14, fontWeight: FontWeight.w600, color: kdark),
              ),
            ),
          ),
          const SizedBox(height: 120),
          Image.asset('assets/images/delhi.png'),
        ],
      ),
    );
  }
}
