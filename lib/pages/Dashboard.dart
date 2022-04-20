// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, override_on_non_overriding_member, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace, prefer_final_fields, unnecessary_new, annotate_overrides, unnecessary_this

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gowaterless_app/constant.dart';
import 'package:gowaterless_app/pages/internet_connectivity.dart';
import 'package:gowaterless_app/services/Car%20Detaling/CD_Service1.dart';
import 'package:gowaterless_app/services/Car%20Detaling/CD_Service2.dart';
import 'package:gowaterless_app/services/Car%20Detaling/CD_Service3.dart';
import 'package:gowaterless_app/services/Car%20Detaling/CD_Service4.dart';
import 'package:gowaterless_app/services/Hatchback/HB_Service1.dart';
import 'package:gowaterless_app/services/Hatchback/HB_Service2.dart';
import 'package:gowaterless_app/services/MUV/MUV_Service1.dart';
import 'package:gowaterless_app/services/MUV/MUV_Service2.dart';
import 'package:gowaterless_app/services/Premium%20Cars/PC_Service1.dart';
import 'package:gowaterless_app/services/Premium%20Cars/PC_Service2.dart';
import 'package:gowaterless_app/services/Sedan/SB_Service1.dart';
import 'package:gowaterless_app/services/Sedan/SB_Service2.dart';
import 'package:gowaterless_app/services/insurancepage.dart';
import 'package:gowaterless_app/services/monthlywash.dart';
import 'package:gowaterless_app/widgets/customer_reviews.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import '../models/Pricing Streams/Hatchback.dart';
import '../models/Pricing Streams/MUV.dart';
import '../models/Pricing Streams/PremiumCar.dart';
import '../models/Pricing Streams/Sedan.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key}) : super(key: key);

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                //First Stack For Background
                children: [
                  Column(children: [
                    Container(
                      height: 250,
                      color: kdark,
                    ),
                  ]),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Protect your car from Swirlmarks, Dullness & Rusting.',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w600),
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        MaterialButton(
                          height: 40.0,
                          minWidth: 100.0,
                          color: kblue,
                          textColor: Colors.white,
                          child: new Text("Book Now"),
                          onPressed: () => {
                            showModalBottomSheet(
                                isDismissible: false,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => Service1_Cars())
                          },
                          splashColor: kblue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 140,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                OfferBanner1(),
                                SizedBox(width: 10),
                                OfferBanner2(),
                                SizedBox(width: 10),
                                OfferBanner3(),
                              ],
                            ),
                          ),
                        ),
                      ],
                      //Second Stack For Hello and Services
                    ),
                  ),
                ],
              ), //Text Button and Banner Widget Ended
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Service Categories",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Service_Category_2(),
                            SizedBox(width: 10),
                            Service_Category_3(),
                            SizedBox(width: 10),
                            Service_Category_4(),
                            SizedBox(width: 10),
                            Service_Category_5(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "Customer Reviews",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomerReview()
                    // Container(
                    //   height: 120,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //     children: [],
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget OfferBanner1() => InkWell(
      onTap: () {
        showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) => Service1_Cars());
      },
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('slides').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.none) {
              return const CircularProgressIndicator();
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final data = snapshot.requireData;
            return Image.network(data.docs[index]['slide1']);
          }));
  Widget OfferBanner2() => InkWell(
      onTap: () {
        showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) => Service1_Cars());
      },
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('slides').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final data = snapshot.requireData;
            return Image.network(data.docs[index]['slide2']);
          }));
  Widget OfferBanner3() => InkWell(
      onTap: () {
        showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
            context: context,
            builder: (context) => Service2_Cars());
      },
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('slides').snapshots(),
          builder: (
            BuildContext context,
            AsyncSnapshot<QuerySnapshot> snapshot,
          ) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
            final data = snapshot.requireData;
            return Image.network(data.docs[index]['slide3']);
          }));

  //Widgets For Services Start Here
  // ignore:

  // ignore:
  Widget Service_Category_2() => Container(
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => Service1_Cars());
              },
              child: Ink.image(
                image: AssetImage('assets/icons/detailing_car_wash.png'),
                height: 80,
                width: 80,
              ),
            ),
            Text(
              'Waterless \n Car Wash',
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
  // ignore:
  Widget Service_Category_3() => Container(
        child: Column(
          children: [
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => Service2_Cars());
              },
              child: Ink.image(
                image: AssetImage('assets/icons/detailing_car_detailing.png'),
                height: 80,
                width: 80,
              ),
            ),
            Text(
              'Car Detaling',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
  // ignore:
  Widget Service_Category_4() => Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => monthlyWash());
              },
              child: Ink.image(
                image: AssetImage('assets/icons/detailing_monthly_wash.png'),
                height: 80,
                width: 80,
              ),
            ),
            Text(
              'Monthly \n Car Wash',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );
  //Car Insurance
  Widget Service_Category_5() => Container(
        child: Column(
          children: [
            InkWell(
              onTap: () {
                showModalBottomSheet(
                    isDismissible: false,
                    enableDrag: true,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => insurancePage());
              },
              child: Ink.image(
                image: AssetImage('assets/icons/detailing_insurance.png'),
                height: 80,
                width: 80,
              ),
            ),
            Text(
              'Car & Bike \nInsurance',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          ],
        ),
      );

  // All Services Widget
//Car Wash
  Widget Service1_Cars() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                  "Select Your Car Type",
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            //Hackback Button
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => HB_Services());
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car1.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'Hatchback Car',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => HB_Services());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: kblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            //Sedan Car
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => SB_Services());
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car2.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'Sedan Car         ',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => SB_Services());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: kblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            //Muv&Suv
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => MUV_Services());
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car3.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'MUV & SUV Cars',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => MUV_Services());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: kblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            //Premium Cars
            InkWell(
              onTap: () async {
                showModalBottomSheet(
                    isDismissible: false,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(20))),
                    context: context,
                    builder: (context) => PC_Services());
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car4.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'Premium Cars',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                isDismissible: false,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20))),
                                context: context,
                                builder: (context) => PC_Services());
                          },
                          icon: Icon(
                            Icons.arrow_forward_ios,
                            color: kblue,
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      );
  //HatchBack Services
  Widget HB_Services() => Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Select Your Service",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Exterior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: HB_services_1()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior Cleaning',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            HBEXT(),
                          ]),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Exterior + Interior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: HB_services_2()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior + Interior ',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            khb2()
                          ]),
                    ),
                  ]),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'All price are inclusive of gst of 18%',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      );
  //Sedan Services
  Widget SB_Services() => Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Select Your Service",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Exterior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SB_services_1()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior Cleaning',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            ksb1(),
                          ]),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Exterior + Interior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: SB_services_2()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior + Interior ',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            ksb2(),
                          ]),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'All price are inclusive of gst of 18%',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      );
  //muv Services
  Widget MUV_Services() => Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Select Your Service",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Exterior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MUV_services_1()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior Cleaning',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            kmb1(),
                          ]),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Exterior + Interior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: MUV_services_2()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior + Interior ',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            kmb2(),
                          ]),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'All price are inclusive of gst of 18%',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      );
  //Premium Cars
  Widget PC_Services() => Container(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.blueGrey,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Select Your Service",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),

              //Exterior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PC_services_1()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior Cleaning',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            kpc1(),
                          ]),
                    ),
                  ]),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              //Exterior + Interior Cleaning
              InkWell(
                onTap: () async {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.rightToLeft,
                          child: PC_services_2()));
                },
                child: Container(
                  child: Stack(children: [
                    Container(
                      height: 80,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: klightblue,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                    ),
                    Container(
                      height: 80,
                      width: double.infinity,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              'Exterior + Interior ',
                              style: GoogleFonts.poppins(
                                  color: kdark,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            kpc2(),
                          ]),
                    ),
                  ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'All price are inclusive of gst of 18%',
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: Colors.grey)),
                ),
              )
            ],
          ),
        ),
      );
//Service 2 Car Detaling
  Widget Service2_Cars() => Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4,
              width: 50,
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
            ),
            Row(
              children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.arrow_back_ios_new_outlined)),
                Text(
                  "Select Your Car Type",
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),

            //Hackback Button
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: CD_services_1()));
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car1.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'Hatchback Car',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹ 1999',
                          style: GoogleFonts.lato(
                              color: kblue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            //Sedan Car
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: CD_services_2()));
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Container(
                          child: Image.asset('assets/images/car2.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          'Sedan Car',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Text(
                          '₹ 2499',
                          style: GoogleFonts.lato(
                              color: kblue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            //Muv&Suv
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: CD_services_3()));
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car3.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'MUV & SUV Cars',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹ 2999',
                          style: GoogleFonts.lato(
                              color: kblue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 10),
            //Premium Cars
            InkWell(
              onTap: () async {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: CD_services_4()));
              },
              child: Container(
                child: Stack(children: [
                  Container(
                    height: 80,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: klightblue,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  Container(
                    height: 80,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          child: Image.asset('assets/images/car4.png'),
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: kwhite,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(50))),
                        ),
                        Text(
                          'Premium Cars',
                          style: GoogleFonts.poppins(
                              color: kdark,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '₹ 3499',
                          style: GoogleFonts.lato(
                              color: kblue,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      );

  //Insurance Form

}
