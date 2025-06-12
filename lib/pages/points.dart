import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recycle_app/services/widget_support.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Center(
              child: Text("Points Page",
                  style: AppWidget.headlinetextstyle(
                    26,
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 233, 233, 249),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 30),
                      Container(
                        padding: EdgeInsets.all(15),
                        margin: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Image.asset("images/coin.png",
                                height: 50, width: 50, fit: BoxFit.cover),
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
