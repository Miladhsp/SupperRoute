import 'package:example/model/Contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var dataPass = Contact('Milad', 'programmer');
            GoTo.aboutUs(context: context, arguments: dataPass);
          },
          child: Text('About Us ...'),
        ),
      ),
    );
  }
}
