// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, sized_box_for_whitespace

import 'dart:math';

import 'package:gowaterless_app/constant.dart';
import 'package:flutter/material.dart';
import 'dart:io';

import 'package:google_fonts/google_fonts.dart';

Widget CustomerReview() => Container(
      height: 160,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Review1(),
            SizedBox(width: 20),
            Review2(),
            SizedBox(width: 20),
            Review3(),
            SizedBox(width: 20),
            Review4(),
            SizedBox(width: 20),
            Review5(),
          ],
        ),
      ),
    );

Widget Review1() => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 210,
          width: 250,
          decoration: BoxDecoration(
              color: kgrey, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 180,
          width: 230,
          child: Column(
            children: [
              SizedBox(height: 5),
              // ignore: prefer_const_literals_to_create_immutables
              Row(children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/avatars/3.jpg')),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ]),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Umendra Tripathi',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))),
                  Text(
                      'Very very useful app. One need not to worry about car cleaning. No water required at all. It is cleaned by a herbal product, soothing to you, your car and most importantly soothing to environment in a big way.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
Widget Review2() => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 210,
          width: 250,
          decoration: BoxDecoration(
              color: kgrey, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 180,
          width: 230,
          child: Column(
            children: [
              SizedBox(height: 5),
              // ignore: prefer_const_literals_to_create_immutables
              Row(children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/avatars/5.jpg')),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ]),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pranav Sharma',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))),
                  Text(
                      'Very intresting concept and helping nature to heal it from water scarcity. No waste of water and perfect cleaning of car is what I saw in there service. Kudos to the innovative idea. ',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
Widget Review3() => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 210,
          width: 250,
          decoration: BoxDecoration(
              color: kgrey, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 180,
          width: 230,
          child: Column(
            children: [
              SizedBox(height: 5),
              // ignore: prefer_const_literals_to_create_immutables
              Row(children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/avatars/7.jpg')),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ]),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sumit Prashar',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))),
                  Text(
                      'State of the art technology. Modernistic approach in flawless cleaning of the vehicles and at the same time saving water and the environment.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
Widget Review4() => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 210,
          width: 250,
          decoration: BoxDecoration(
              color: kgrey, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 180,
          width: 230,
          child: Column(
            children: [
              SizedBox(height: 5),
              // ignore: prefer_const_literals_to_create_immutables
              Row(children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/avatars/8.jpg')),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ]),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Selva Raj',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))),
                  Text(
                      'Before the service I thought how will you wash without water. But your process is too good. You did not use water or shampoo to clean but the car was perfectly cleaned and shiny. Really nice work. ',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
Widget Review5() => Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Container(
          height: 210,
          width: 250,
          decoration: BoxDecoration(
              color: kgrey, borderRadius: BorderRadius.circular(20)),
        ),
        Container(
          height: 180,
          width: 230,
          child: Column(
            children: [
              SizedBox(height: 5),
              // ignore: prefer_const_literals_to_create_immutables
              Row(children: [
                CircleAvatar(
                    radius: 20,
                    backgroundImage: AssetImage('assets/avatars/1.jpg')),
                SizedBox(width: 20),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
                Icon(Icons.star, color: Colors.amber),
              ]),
              SizedBox(height: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Sandip Bhattacharya',
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 12, fontWeight: FontWeight.bold))),
                  Text(
                      'This is such an amazing service. And the app works like a charm. The idea is really unique and environment friendly. Highly appreciated.',
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 10, fontWeight: FontWeight.w500))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
