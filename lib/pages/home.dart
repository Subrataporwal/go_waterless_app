// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, unused_field, annotate_overrides, prefer_const_constructors_in_immutables

import 'dart:io';

import 'package:gowaterless_app/constant.dart';
import 'package:gowaterless_app/pages/Dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'Dashboard.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  // ignore: prefer_final_fields
  List<Widget> _widgetOptions = [
    BookingApp(),
    Support(),
    ProfilePage(),
  ];

  void _onItemTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // drawer: Drawer1(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kdark,
          title: Text(
            'Go Waterless',
          ),
          // actions: <Widget>[
          //   IconButton(
          //     onPressed: () {
          //       Navigator.of(context).push(
          //         MaterialPageRoute(
          //           builder: (context) => Chatpage(),
          //         ),
          //       );
          //     },
          //     icon: Icon(Icons.chat),
          //   ),
          // ],
        ),
        body: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: _widgetOptions,
          ),
        ),
        bottomNavigationBar: SlidingClippedNavBar(
          inactiveColor: kdark,
          backgroundColor: klightblue,
          barItems: [
            BarItem(
              title: 'Home',
              icon: Icons.home_filled,
            ),
            BarItem(
              title: 'Support',
              icon: Icons.perm_phone_msg,
            ),
            BarItem(
              title: 'My Account',
              icon: Icons.person,
            ),
          ],
          selectedIndex: _selectedIndex,
          onButtonPressed: _onItemTap,
          activeColor: kblue,
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   backgroundColor: kdark,
        //   elevation: 0,
        //   child: Stack(
        //     children: [
        //       Container(
        //         decoration: BoxDecoration(
        //           color: Colors.transparent,
        //           borderRadius: BorderRadius.all(
        //             Radius.circular(100),
        //           ),
        //           boxShadow: [
        //             BoxShadow(
        //               color: kdark.withOpacity(0.3),
        //               spreadRadius: 7,
        //               blurRadius: 7,
        //               offset: Offset(3, 5),
        //             ),
        //           ],
        //         ),
        //       ),
        //       Center(
        //         child: Icon(
        //           Icons.calendar_today,
        //           color: Colors.white,
        //         ),
        //       ),
        //     ],
        //   ),
        // ),
      ),
    );
  }
}

//all Pagge Class
//Booking Page Starts Here
class BookingApp extends StatefulWidget {
  const BookingApp({Key? key}) : super(key: key);

  @override
  State<BookingApp> createState() => _BookingAppState();
}

class _BookingAppState extends State<BookingApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Dashboard(),
    );
  }
}

//Support Page Starts Here
class Support extends StatelessWidget {
  const Support({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffebf3fc),
      body: Column(
        children: [
          Center(
            child: Image.asset('assets/images/support.jpg'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'Go Waterless Support',
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: kdark,
                fontWeight: FontWeight.w700,
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(
              10.0,
            ),
            child: Text(
              'GoWaterless is an innovation & a revolutionary product to clean any vehicle without a single drop of water. It is 100% Natural & Eco-friendly. It also protects your vehicle from UV Rays, Swirlmarks, Water Spots, Paint Oxidation & Rusting.',
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                  color: kdark,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
            ),
          ),
          // SizedBox(
          //   height: 20,
          // ),
          // InkWell(
          //   onTap: () {
          //     Navigator.of(context).push(
          //       MaterialPageRoute(
          //         builder: (context) => Chatpage(),
          //       ),
          //     );
          //   },
          //   splashColor: Colors.black26,
          //   child: Ink.image(
          //     image: AssetImage('assets/images/Chat.png'),
          //     height: 60,
          //     width: 370,
          //   ),
          // ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () async {
              FlutterPhoneDirectCaller.callNumber('18002662008');
            },
            splashColor: Colors.black26,
            child: Ink.image(
              image: AssetImage('assets/images/Call.png'),
              height: 60,
              width: 370,
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: 'https://www.gowaterless.in/customer-dashboard/',
      ),
    );
  }
}
// BottomNavigationBar(
//           items: [
//             BottomNavigationBarItem(
//               icon: Icon(Icons.home_filled),
//               label: 'Home',
//             ),
//             BottomNavigationBarItem(
//               icon: Icon(Icons.perm_phone_msg),
//               label: 'Support',
//             ),
//           ],
//           currentIndex: _selectedIndex,
//           onTap: _onItemTap,
//         ),