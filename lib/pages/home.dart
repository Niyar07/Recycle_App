import 'package:flutter/material.dart';
import 'package:recycle_app/services/widget_support.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Column(
        children: [
          Text("Hello, Niyar"),
        ],
      ),
    ));
  }
}
