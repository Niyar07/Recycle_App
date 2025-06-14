import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:recycle_app/services/database.dart';
import 'package:recycle_app/services/shared_pref.dart';
import 'package:recycle_app/services/widget_support.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class Points extends StatefulWidget {
  const Points({Key? key}) : super(key: key);

  @override
  State<Points> createState() => _PointsState();
}

class _PointsState extends State<Points> {
  String? id, name;
  String mypoints = '0';
  bool isLoading = true;
  Stream? pointsStream;

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
    name = await SharedPreferencesHelper().getUserName();

    pointsStream = await DatabaseMethods().getUserTransactions(id!);
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

  Widget allApprovals() {
    return StreamBuilder(
        stream: pointsStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return Column(
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.only(left: 20, right: 20),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 233, 233, 249),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Text(
                                  ds["Date"],
                                  textAlign: TextAlign.center,
                                  style: AppWidget.whitetextstyle(18.0),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Reedem Ponts",
                                    style: AppWidget.normallinetextstyle(18),
                                  ),
                                  Text(
                                    ds["Points"],
                                    style: AppWidget.greentextstyle(24),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 55.0,
                              ),
                              Container(
                                  padding: EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                      color: ds["Status"] == "Approved"
                                          ? Color.fromARGB(0, 134, 248, 108)
                                          : const Color.fromARGB(
                                              72, 252, 114, 104),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Text(
                                    ds["Status"],
                                    style: TextStyle(
                                        color: ds["Status"] == "Approved"
                                            ? Colors.green
                                            : Colors.red,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(height: 16.0), // <-- Add space between cards
                      ],
                    );
                  },
                )
              : Container();
        });
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
      resizeToAvoidBottomInset: true,
      body: Container(
        margin: EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Center(
              child:
                  Text("Points Page", style: AppWidget.headlinetextstyle(26)),
            ),
            SizedBox(height: 15),
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
                    SizedBox(height: 15),
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
                    SizedBox(height: 20),
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
                    SizedBox(height: 20),
                    Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                topRight: Radius.circular(30))),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Last Transactions",
                              style: AppWidget.normallinetextstyle(20),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                height: MediaQuery.of(context).size.height / 2,
                                child: allApprovals()),
                          ],
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

                      DateTime now = DateTime.now();
                      String formattedDate = DateFormat('d\nMMM').format(now);
                      if (currentPoints >= redeemPoints && redeemPoints > 0) {
                        int updatedpoints = currentPoints - redeemPoints;
                        await DatabaseMethods()
                            .updateUserPoints(id!, updatedpoints.toString());
                        setState(() {
                          mypoints = updatedpoints.toString();
                        });

                        Map<String, dynamic> userReedemMap = {
                          "Name": name,
                          "Points": pointscontroller.text,
                          "UPI": upicontroller.text,
                          "Status": " Pending",
                          "Date": formattedDate,
                        };

                        String reedemid = randomAlphaNumeric(10);

                        await DatabaseMethods()
                            .addUserReedemPoints(userReedemMap, id!, reedemid);
                        await DatabaseMethods()
                            .addAdminReedemRequest(userReedemMap, reedemid);

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
