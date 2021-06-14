import 'package:example/main.dart';
import 'package:example/model/Contact.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main screen'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            var dataPass = Contact('Milad Hasanpour', 'programmer');
            GoTo.aboutUs.from(context, arguments: dataPass);
          },
          child: Text('About Us ...'),
        ),
      ),
    );
  }
}
