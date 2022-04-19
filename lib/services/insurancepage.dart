// ignore_for_file: camel_case_types, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_final_fields, unnecessary_new, unused_field, avoid_print, override_on_non_overriding_member, annotate_overrides, unused_element

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:twilio_flutter/twilio_flutter.dart';

import '../constant.dart';

class insurancePage extends StatefulWidget {
  insurancePage({Key? key}) : super(key: key);

  @override
  State<insurancePage> createState() => _insurancePageState();
}

class _insurancePageState extends State<insurancePage> {
  late TwilioFlutter twilioFlutter;

  void initState() {
    twilioFlutter = TwilioFlutter(
        accountSid: 'ACf97b1c5a281c1851187bb08ca55d41a2',
        authToken: 'b2c63d3a3e9d823dd02c31af142ef86f',
        twilioNumber: '+16104865966');

    super.initState();
  }

  void insuranceSMS1() async {
    twilioFlutter.sendSMS(
        toNumber: '+91${_insurancePhone.text}',
        messageBody:
            'Hello ${_insuranceName.text}, \n Your Insurance Query has been received');
  }

  void insuranceSMS2() async {
    twilioFlutter.sendSMS(
        toNumber: '+919767284494',
        messageBody:
            'Hello,\nYou Have Recived a Insurance Query From ${_insuranceName.text}');
  }

  //Next Command is to create instance in Firestore Firebase Database
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  int i = 0;
  //Create Void Function to add on button so that it will create dada in server
  void _insuranceForm() async {
    try {
      await firestore.collection('insuranceData').add({
        'insurerName': _insuranceName.text,
        'insurerNo': _insurancePhone.text,
        'insurerMFG': _carManufacture.text,
        'insurerModel': _carModel.text,
        'insurerCarYear': _carYear.text,
        'lastInsurance': selectedInsurance,
        'leadTime': DateTime.now(),
      });
      print('Database Created');
    } catch (e) {
      print(e);
    }
  }

  List<String> insuranceType = [
    'No Insurance',
    'Full Insurance',
    'Third Party Insurance'
  ];
  String? selectedInsurance = 'No Insurance';

  @override
  final formKey = GlobalKey<FormState>();
  TextEditingController _insuranceName = new TextEditingController();
  TextEditingController _insurancePhone = new TextEditingController();
  TextEditingController _carManufacture = new TextEditingController();
  TextEditingController _carModel = new TextEditingController();
  TextEditingController _carYear = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: kgrey2,
        elevation: 0,
        leading: IconButton(
            color: kblue,
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios_new_outlined)),
        title: Text(
          "Fill This Form",
          style: GoogleFonts.poppins(
            color: kdark,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
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
                SizedBox(
                  height: 450,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset(
                    'assets/images/insurance_car.png',
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
                            controller: _insuranceName,
                            decoration: InputDecoration(
                                prefixIcon: Icon(Icons.person),
                                fillColor: kdark,
                                focusColor: kdark,
                                label: Text('Name'),
                                hintText: ' Enter Your Full Name'),
                            validator: (value) {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                                return ' Enter Correct Name';
                              } else {
                                return null;
                              }
                            },
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: _insurancePhone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.call),
                              focusColor: kblue,
                              label: Text('Phone Number'),
                              hintText: ' Enter Your Phone No.',
                              prefixText: '+91 ',
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
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  controller: _carManufacture,
                                  decoration: InputDecoration(
                                    focusColor: kblue,
                                    label: Text('Manufacturer'),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return 'Enter Correct MFG';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(10),
                                  ],
                                  controller: _carModel,
                                  decoration: InputDecoration(
                                    focusColor: kblue,
                                    label: Text('Model'),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return 'Enter Correct Model';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: TextFormField(
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(4),
                                  ],
                                  controller: _carYear,
                                  decoration: InputDecoration(
                                    focusColor: kblue,
                                    label: Text('Year'),
                                  ),
                                  keyboardType: TextInputType.phone,
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        // ignore: valid_regexps
                                        !RegExp(r'^[0-9]{4}').hasMatch(value)) {
                                      return 'Enter Correct Year';
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Flexible(
                                child: SizedBox(
                                  width: 200,
                                  child: DropdownButton<String>(
                                    borderRadius: BorderRadius.circular(10),
                                    alignment: AlignmentDirectional.centerStart,
                                    value: selectedInsurance,
                                    items: insuranceType
                                        .map((item) => DropdownMenuItem(
                                            value: item, child: Text(item)))
                                        .toList(),
                                    onChanged: (item) {
                                      setState(() {
                                        selectedInsurance = item;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            height: 60,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: kblue,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(10), // <-- Radius
                                  ),
                                ),
                                onPressed: () {
                                  {
                                    {
                                      if (formKey.currentState!.validate()) {
                                        _insuranceForm();
                                        insuranceSMS1();
                                        insuranceSMS2();
                                        Navigator.of(context).pop();
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
                                          textStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      )),
                                    ),
                                    SizedBox(width: 30),
                                    Icon(Icons.send_rounded),
                                  ],
                                )),
                          ),
                          SizedBox(
                            height: 150,
                          ),
                        ],
                      )),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
