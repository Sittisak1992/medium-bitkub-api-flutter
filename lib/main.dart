import 'package:flutter/material.dart';
import 'package:medium_bitkub/pages/non_secure_api.dart';
import 'package:medium_bitkub/pages/secure_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Call Bitkub RESTful API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Varela Round'
      ),
      home: BitkubMenu(),
    );
  }
}

class BitkubMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = new TextStyle(
            fontSize: 20.0, color: Colors.white,
            fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Bitkub Api List"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
              child: new Text("Non Secure Api (GET)",style: textStyle),
              color: Colors.blue,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NonSecureApiPage()),
              ),
            ),
            new RaisedButton(
              child: new Text("Secure Api (POST)",style: textStyle),
              color: Colors.green,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SecureApiPage()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
