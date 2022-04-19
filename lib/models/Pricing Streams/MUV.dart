// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

var index = 1;

//Hatchback Pricing
Widget kmb1() => StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('Pricing').snapshots(),
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
      final data = snapshot.requireData;
      return Text('₹ ${data.docs[index]['MUVEXTPrice']}',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: kblue, fontSize: 28, fontWeight: FontWeight.w600)));
    });
Widget kmb2() => StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('Pricing').snapshots(),
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
      final data = snapshot.requireData;
      return Text('₹ ${data.docs[index]['MUVINTPrice']}',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: kblue, fontSize: 28, fontWeight: FontWeight.w600)));
    });
