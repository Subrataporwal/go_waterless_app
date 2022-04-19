// ignore_for_file: non_constant_identifier_names

import 'package:gowaterless_app/constant.dart';
import 'package:flutter/material.dart';

class BuildMenu extends StatefulWidget {
  BuildMenu({Key? key}) : super(key: key);

  @override
  _BuildMenuState createState() => _BuildMenuState();
}

class _BuildMenuState extends State<BuildMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kwhite,
      child: MenuHeader(),
    );
  }

  Widget MenuHeader() => Container(
        color: kdark,
        width: double.infinity,
        height: 250,
        padding: EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      );
}
