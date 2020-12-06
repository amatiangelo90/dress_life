import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String id = 'home_screen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.blue,
    ),
    Container(
      color: Colors.green,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return
      PageView(
        children: pages,
        scrollDirection: Axis.vertical,
      );
  }
}
