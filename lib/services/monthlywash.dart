// ignore_for_file: annotate_overrides, camel_case_types, prefer_const_constructors_in_immutables, prefer_final_fields, unnecessary_new, override_on_non_overriding_member, non_constant_identifier_names, avoid_unnecessary_containers, avoid_print

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gowaterless_app/constant.dart';
import 'package:twilio_flutter/twilio_flutter.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../widgets/TwilioSMS.dart';

class monthlyWash extends StatefulWidget {
  monthlyWash({Key? key}) : super(key: key);

  @override
  State<monthlyWash> createState() => _monthlyWashState();
}

@override
class _monthlyWashState extends State<monthlyWash> {
  final formKey = GlobalKey<FormState>();
  TextEditingController _name = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _city = new TextEditingController();
  TextEditingController _socityname = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  late TwilioFlutter twilioFlutter;

  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACf97b1c5a281c1851187bb08ca55d41a2',
        authToken: 'b2c63d3a3e9d823dd02c31af142ef86f',
        twilioNumber: '+16104865966');

    super.initState();
  }

  void SendSms1() async {
    twilioFlutter.sendSMS(
        toNumber: '+91${_phone.text}',
        messageBody:
            'Hello ${_name.text}, \nYour Monthly Car Wash Booking has been received');
  }

  void SendSms2() async {
    twilioFlutter.sendSMS(
        toNumber: '+919767284494',
        messageBody:
            'Hello,\nYou Have Recived a Monthly Car Wash Booking From\nName: ${_name.text},\nPhone No: ${_phone.text},\nCity: ${_city.text},\nSocity Name: ${_socityname.text},\nAddress: ${_address.text}\nPlease Call the Respective Customer for Verification.');
  }

  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  void _monthlyform() async {
    try {
      await firestore.collection('Monthly Wash Lead').add({
        'name': _name.text,
        'phone': _phone.text,
        'city': _city.text,
        'socityName': _socityname.text,
        'fullAddress': _address.text,
        'leadTime': DateTime.now(),
      });
      print('Database Created');
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kgrey2,
        toolbarHeight: 130,
        elevation: 0,
        leading: IconButton(
            color: kblue,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          "Fill This Form",
          style: GoogleFonts.poppins(
            color: kdark,
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      backgroundColor: kgrey2,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 295,
                ),
                Container(
                  child: Image.asset(
                    'assets/images/building.png',
                    width: double.infinity,
                  ),
                )
              ],
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(20, 5, 20, 5),
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  SingleChildScrollView(
                    child: Form(
                        key: formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _name,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.person),
                                  fillColor: kdark,
                                  focusColor: kdark,
                                  label: const Text('Name'),
                                  hintText: ' Enter Your Full Name'),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return 'Enter Correct Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _phone,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.call),
                                prefixIconColor: kdark,
                                focusColor: kblue,
                                label: const Text('Phone Number'),
                                hintText: ' Enter Your Phone No.',
                                prefixText: '+91',
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value!.isEmpty ||
                                    // ignore: valid_regexps
                                    !RegExp(r'^[0-9]{10}').hasMatch(value)) {
                                  return 'Enter Correct Phone No.';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _city,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.location_on),
                                  focusColor: kblue,
                                  label: const Text('City'),
                                  hintText: ' Enter Your Current City'),
                              validator: (value) {
                                if (value!.isEmpty ||
                                    !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                  return 'Enter Correct City';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              maxLength: 24,
                              controller: _socityname,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.domain),
                                  focusColor: kblue,
                                  label: const Text('Socity Name'),
                                  hintText: ' Enter Your Current Socity Name'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Correct Socity Name';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              maxLines: 2,
                              controller: _address,
                              decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.subject),
                                  focusColor: kblue,
                                  label: const Text('Full Address'),
                                  hintText: ' Enter Your Current Address'),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Enter Your Full Address';
                                } else {
                                  return null;
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: kblue,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          10), // <-- Radius
                                    ),
                                  ),
                                  onPressed: () {
                                    {
                                      {
                                        if (formKey.currentState!.validate()) {
                                          _monthlyform();
                                          SendSms1();
                                          SendSms2();
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) => TwilioSMS(
                                                    name: _name.text,
                                                    phone: _phone.text,
                                                    city: _city.text,
                                                    socityname:
                                                        _socityname.text,
                                                    address: _address.text)),
                                          );
                                          // ignore: unused_local_variable

                                        } else {}
                                      }
                                    }
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        'Send your Form',
                                        style: GoogleFonts.poppins(
                                            textStyle: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                        )),
                                      ),
                                      const SizedBox(width: 30),
                                      const Icon(Icons.send_rounded),
                                    ],
                                  )),
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                          ],
                        )),
                  )
                ])),
          ],
        ),
      ),
    );
  }
}
