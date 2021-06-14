import 'package:example/main.dart';
import 'package:example/model/Contact.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = arguments(context) as Contact;
    return Scaffold(
      appBar: AppBar(
        title: Text('${model.name}'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'job : ${model.job}',
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.green,
                  fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
                onPressed: () {
                  GoTo.home.from(context);
                },
                child: Text('<- Back'))
          ],
        ),
      ),
    );
  }
}
