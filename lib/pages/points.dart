import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:recycle_app/services/shared_pref.dart';
import 'package:recycle_app/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  String? id, mypoints;
  getthesharedpref() async {
    // Assuming you have a method to get the user ID from shared preferences
    // Replace this with your actual implementation
    final sharedPrefHelper = SharedPreferencesHelper();
    id = await sharedPrefHelper.getUserId();

    setState(() async {});
  }

  ontheload() async {
    await getthesharedpref();
    mypoints = await getUserPoints(id!);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  final TextEditingController pointscontroller = TextEditingController();
  final TextEditingController upicontroller = TextEditingController();

  Future<String> getUserPoints(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        var points = data['Points'];
        return points.toString();
      } else {
        return '0';
      }
    } catch (e) {
      print("Error fetching user points: $e");
      return '0';
    }
  }

  @override
  void dispose() {
    pointscontroller.dispose();
    super.dispose();
  }

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
                        margin: EdgeInsets.only(left: 50, right: 50),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(15),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Image.asset("images/coin.png",
                                    height: 60, width: 60, fit: BoxFit.cover),
                                SizedBox(
                                  width: 50,
                                ),
                                Column(
                                  children: [
                                    Text("Points Earned",
                                        style: AppWidget.normallinetextstyle(
                                          20,
                                        )),
                                    Text("300",
                                        style: AppWidget.greentextstyle(
                                          30,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                      GestureDetector(
                        onTap: () {
                          // Handle redeem points action
                          openBox();
                        },
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            width: MediaQuery.of(context).size.width / 2,
                            child: Center(
                              child: Text(
                                "Redeem Points",
                                style: AppWidget.whitetextstyle(20),
                              ),
                            ),
                          ),
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

  Future openBox() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close, color: Colors.black),
                    ),
                    SizedBox(width: 30),
                    Text("Redeem Points",
                        style: AppWidget.greentextstyle(
                          20,
                        )),
                  ],
                ),
                SizedBox(height: 20),
                Text("Add Points",
                    style: AppWidget.normallinetextstyle(
                      20,
                    )),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: pointscontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter points to redeem",
                      hintStyle: AppWidget.normallinetextstyle(
                        16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Add UPI Id",
                  style: AppWidget.normallinetextstyle(20),
                ),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: upicontroller,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter UPI Id",
                      hintStyle: AppWidget.normallinetextstyle(
                        16,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // Handle redeem points action
                    if (pointscontroller.text.isNotEmpty &&
                        upicontroller.text.isNotEmpty) {
                      // Perform the redeem action
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Points redeemed successfully!"),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Please fill all fields."),
                        ),
                      );
                    }
                  },
                  child: Center(
                    child: Container(
                      // padding: EdgeInsets.all(50),
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Add",
                          style: AppWidget.whitetextstyle(
                            20,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
