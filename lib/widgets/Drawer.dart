import 'package:flutter/material.dart';
import 'package:gowaterless_app/constant.dart';

class Drawer1 extends StatefulWidget {
  Drawer1({Key? key}) : super(key: key);

  @override
  State<Drawer1> createState() => _Drawer1State();
}

class _Drawer1State extends State<Drawer1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: double.infinity,
      color: kwhite,
    );
  }
}
