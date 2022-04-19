// ignore_for_file: prefer_final_fields, unnecessary_new, prefer_const_constructors, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:gowaterless_app/constant.dart';
import 'package:gowaterless_app/pages/newchat.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'constant.dart';

class Chatpage extends StatefulWidget {
  const Chatpage({Key? key}) : super(key: key);

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _email = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xffe6f3ff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kdark,
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    Container(
                      height: 200,
                      decoration: BoxDecoration(
                        color: kdark,
                      ),
                    ),
                    Container(
                      child: Image.asset('assets/images/chatpattern.png'),
                    ),
                  ],
                ),
                Center(
                  child: Column(
                    children: [
                      Text('Welcome',
                          textAlign: TextAlign.left,
                          style: GoogleFonts.poppins(
                              fontSize: 35,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))),
                      Text('Please fill this form to start live chat',
                          style: GoogleFonts.poppins(
                              fontSize: 18,
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500))),
                      SizedBox(
                        height: 30,
                      ),
                      Stack(
                        children: [
                          Center(
                            child: Container(
                              height: 330,
                              width: 350,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.rectangle,
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(30.0),
                            child: Center(
                                child: Container(
                              height: 500,
                              width: 300,
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      controller: _name,
                                      decoration: InputDecoration(
                                          focusColor: kblue,
                                          label: Text('Name'),
                                          hintText: 'Enter Your Full Name'),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[a-z A-Z]+$')
                                                .hasMatch(value)) {
                                          return 'Enter Correct Name';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _phone,
                                      decoration: InputDecoration(
                                        focusColor: kblue,
                                        label: Text('Phone Number'),
                                        hintText: 'Enter Your Phone No.',
                                        prefixText: '+91',
                                      ),
                                      keyboardType: TextInputType.phone,
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            // ignore: valid_regexps
                                            !RegExp(r'^[0-9]{10}')
                                                .hasMatch(value)) {
                                          return 'Enter Correct Phone No.';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextFormField(
                                      controller: _email,
                                      decoration: InputDecoration(
                                        focusColor: kblue,
                                        label: Text('Email Address'),
                                        hintText: 'Enter Your Email',
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty ||
                                            !RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}')
                                                .hasMatch(value)) {
                                          return 'Enter Correct Email';
                                        } else {
                                          return null;
                                        }
                                      },
                                    ),
                                    SizedBox(
                                      height: 70,
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      height: 50,
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: kblue,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                10), // <-- Radius
                                          ),
                                        ),
                                        onPressed: () async {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => NewChat(
                                                  name: _name.text,
                                                  email: _email.text,
                                                  phone: _phone.text),
                                            ),
                                          );
                                        },
                                        child: Text('Start Live Chat'),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}


























//Profile

// class Profile extends StatefulWidget {
//   Profile({Key? key}) : super(key: key);

//   @override
//   _ProfileState createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: kdark,
//         title: Text(
//           'Customer Dashboard',
//         ),
//         actions: <Widget>[
//           IconButton(
//             onPressed: () {
//               Navigator.of(context).push(
//                 MaterialPageRoute(
//                   builder: (context) => Home(),
//                 ),
//               );
//             },
//             icon: Icon(Icons.home_filled),
//           ),
//         ],
//       ),
//       body: WebView(
//         javascriptMode: JavascriptMode.unrestricted,
//         initialUrl: 'https://www.gowaterless.in/customer-dashboard/',
//       ),
//     );
//   }
// }
