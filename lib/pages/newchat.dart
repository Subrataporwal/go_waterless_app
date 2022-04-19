import 'package:gowaterless_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:crisp/crisp.dart';

// ignore: must_be_immutable
class NewChat extends StatefulWidget {
  String name, email, phone;
  NewChat({required this.name, required this.email, required this.phone});

  @override
  State<NewChat> createState() => _NewChatState();
}

class _NewChatState extends State<NewChat> {
  late CrispMain crispMain;

  @override
  void initState() {
    super.initState();

    crispMain = CrispMain(
      websiteId: 'WEBSITE_ID',
      locale: 'pt-br',
    );

    crispMain.register(
      user: CrispUser(
        email: "leo@provider.com",
        avatar: 'https://avatars2.githubusercontent.com/u/16270189?s=200&v=4',
        nickname: "João Cardoso",
        phone: "5511987654321",
      ),
    );

    crispMain.setMessage("Hello world");

    crispMain.setSessionData({
      "order_id": "111",
      "app_version": "0.1.1",
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Your brand'),
        ),
        body: CrispView(
          crispMain: crispMain,
          clearCache: false,
        ),
      ),
    );
  }
}
