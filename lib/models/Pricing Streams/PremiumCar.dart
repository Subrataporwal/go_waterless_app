// ignore_for_file: non_constant_identifier_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant.dart';

var index = 2;

//Hatchback Pricing
Widget kpc1() => StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('Pricing').snapshots(),
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
      final data = snapshot.requireData;
      return Text('₹ ${data.docs[index]['PCEXTPrice']}',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: kblue, fontSize: 28, fontWeight: FontWeight.w600)));
    });
Widget kpc2() => StreamBuilder<QuerySnapshot>(
    stream: FirebaseFirestore.instance.collection('Pricing').snapshots(),
    builder: (
      BuildContext context,
      AsyncSnapshot<QuerySnapshot> snapshot,
    ) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const CircularProgressIndicator();
      }
      final data = snapshot.requireData;
      return Text('₹ ${data.docs[index]['PCINTPrice']}',
          style: GoogleFonts.lato(
              textStyle: TextStyle(
                  color: kblue, fontSize: 28, fontWeight: FontWeight.w600)));
    });
