// ignore_for_file: override_on_non_overriding_member, must_be_immutable, non_constant_identifier_names, unnecessary_brace_in_string_interps, unused_import, use_key_in_widget_constructors, prefer_const_constructors

import 'package:gowaterless_app/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../constant.dart';

class TwilioSMS extends StatelessWidget {
  String name, phone, city, socityname, address;
  TwilioSMS({
    required this.name,
    required this.phone,
    required this.city,
    required this.socityname,
    required this.address,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: kblue,
            onPressed: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.rightToLeft, child: Home()));
            },
            icon: Icon(Icons.arrow_back_ios_new)),
        backgroundColor: kgrey2,
        elevation: 0,
      ),
      body: Container(
          color: kgrey2,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    child: Image.asset(
                      'assets/images/building.png',
                      width: double.infinity,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                child: Container(
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/tick.png',
                        width: 80,
                        height: 80,
                      ),
                      SizedBox(height: 10),
                      Text('Thanks, ${name}',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w600),
                            fontSize: 20,
                          )),
                      SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        child: Text(
                            'Your request has been received !!\nYou will receive a call from our customer executive to start your services',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(fontWeight: FontWeight.w500),
                              fontSize: 15,
                            )),
                      ),
                      SizedBox(height: 10),
                      Text('Your Details given Below :',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.w500),
                            fontSize: 18,
                          )),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Phone Number :',
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    fontSize: 15,
                                  )),
                              SizedBox(width: 20),
                              Text('+91 ${phone}',
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
                                    fontSize: 15,
                                    color: kblue,
                                  )),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('City :',
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    fontSize: 15,
                                  )),
                              SizedBox(width: 20),
                              Text('${city}',
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
                                    fontSize: 15,
                                    color: kblue,
                                  )),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Socity Name :',
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.w400),
                                    fontSize: 15,
                                  )),
                              SizedBox(width: 20),
                              Text('${socityname}',
                                  style: GoogleFonts.poppins(
                                    textStyle:
                                        TextStyle(fontWeight: FontWeight.w600),
                                    fontSize: 15,
                                    color: kblue,
                                  )),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 300),
                      SizedBox(
                        height: 40,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kblue,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(20), // <-- Radius
                              ),
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  PageTransition(
                                      type: PageTransitionType.rightToLeft,
                                      child: Home()));
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Go Back Home',
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                    fontSize: 16,
                                  )),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
