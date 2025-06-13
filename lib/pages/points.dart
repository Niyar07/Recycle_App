import 'package:flutter/material.dart';
import 'package:recycle_app/services/database.dart';
import 'package:recycle_app/services/shared_pref.dart';
import 'package:recycle_app/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  String? id;
  String mypoints = '0';
  bool isLoading = true;

  final TextEditingController pointscontroller = TextEditingController();
  final TextEditingController upicontroller = TextEditingController();

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  Future<void> ontheload() async {
    id = await SharedPreferencesHelper().getUserId();
    if (id != null) {
      String? points = await getUserPoints(id!);
      mypoints = (points == null || points == 'null') ? '0' : points;
    }
    setState(() {
      isLoading = false;
    });
  }

  Future<String?> getUserPoints(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (documentSnapshot.exists) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        var points = data['Points'];
        return points?.toString();
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
    upicontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Center(
              child:
                  Text("Points Page", style: AppWidget.headlinetextstyle(26)),
            ),
            SizedBox(height: 30),
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
                              SizedBox(width: 50),
                              Column(
                                children: [
                                  Text("Points Earned",
                                      style: AppWidget.normallinetextstyle(20)),
                                  Text(mypoints,
                                      style: AppWidget.greentextstyle(30)),
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
                ),
              ),
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
                    Text("Redeem Points", style: AppWidget.greentextstyle(20)),
                  ],
                ),
                SizedBox(height: 20),
                Text("Add Points", style: AppWidget.normallinetextstyle(20)),
                SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black38, width: 2.0),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: pointscontroller,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Enter points to redeem",
                      hintStyle: AppWidget.normallinetextstyle(16),
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
                      hintStyle: AppWidget.normallinetextstyle(16),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                GestureDetector(
                  onTap: () async {
                    if (pointscontroller.text.isNotEmpty &&
                        upicontroller.text.isNotEmpty) {
                      int currentPoints = int.tryParse(mypoints) ?? 0;
                      int redeemPoints =
                          int.tryParse(pointscontroller.text) ?? 0;
                      if (currentPoints >= redeemPoints && redeemPoints > 0) {
                        int updatedpoints = currentPoints - redeemPoints;
                        await DatabaseMethods()
                            .updateUserPoints(id!, updatedpoints.toString());
                        setState(() {
                          mypoints = updatedpoints.toString();
                        });
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Points redeemed successfully!"),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content:
                                Text("Insufficient points or invalid amount."),
                          ),
                        );
                      }
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
                      padding: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 10),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text("Add", style: AppWidget.whitetextstyle(20)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
