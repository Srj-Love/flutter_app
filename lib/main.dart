import 'package:flutter/material.dart';
import 'package:flutter_app/homepage.dart';

const Color myColor = Colors.red;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Coctail App",
      theme: ThemeData(
          primarySwatch: myColor,
          accentColor: Colors.amber,
          buttonTheme: ButtonThemeData(buttonColor: Colors.blueAccent)),
      home: HomePage(),
    );
  }
}
