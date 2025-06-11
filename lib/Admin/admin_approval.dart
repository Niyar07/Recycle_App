import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/services/database.dart';
import 'package:recycle_app/services/widget_support.dart';

class AdminApproval extends StatefulWidget {
  const AdminApproval({super.key});

  @override
  State<AdminApproval> createState() => _AdminApprovalState();
}

class _AdminApprovalState extends State<AdminApproval> {
  Stream? approvalStream;

  getontheload() async {
    approvalStream = await DatabaseMethods().getAdminApproval();
    setState(() {});
  }

  @override
  void initState() {
    // TODO: implement initState
    getontheload();
    super.initState();
  }

  Future<String> getUserPoints(String uid) async {
    try {
      DocumentSnapshot documentSnapshot =
          await FirebaseFirestore.instance.collection('users').doc(uid).get();
      if (documentSnapshot.exists) {
        String userPoints = documentSnapshot['Points'].toString();
        return userPoints;
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
        stream: approvalStream,
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
                          margin: EdgeInsets.only(left: 20.0, right: 20.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20.0),
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.all(20.0),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.0),
                                      border: Border.all(
                                        color: Colors.black45,
                                        width: 1.0,
                                      ),
                                    ),
                                    child: Image.asset(
                                      'images/coca.png',
                                      width: 120.0,
                                      height: 120.0,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  SizedBox(width: 0.0),
                                  Container(
                                    margin: EdgeInsets.only(
                                        top: 20, bottom: 20, right: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.person,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 10.0),
                                            Text(
                                              ds["Name"],
                                              style:
                                                  AppWidget.headlinetextstyle(
                                                      18),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 10.0),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  2.5,
                                              child: Text(
                                                ds["Address"],
                                                style:
                                                    AppWidget.headlinetextstyle(
                                                        18),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.inventory,
                                              color: Colors.green,
                                            ),
                                            SizedBox(width: 10.0),
                                            Text(
                                              ds["Quantity"].toString(),
                                              style:
                                                  AppWidget.headlinetextstyle(
                                                      18),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 5),
                                        GestureDetector(
                                          onTap: () async {
                                            // Handle approve action
                                            await DatabaseMethods()
                                                .updateAdminRequest(ds.id);
                                            await DatabaseMethods()
                                                .updateUserRequest(
                                                    ds["uid"], ds.id);
                                          },
                                          child: Container(
                                            height: 35,
                                            width: 200,
                                            decoration: BoxDecoration(
                                              color: Colors.black,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                            child: Center(
                                              child: Text(
                                                "Approve",
                                                style: AppWidget.whitetextstyle(
                                                    18),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 20.0),
                                ],
                              ),
                            ),
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
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            margin: const EdgeInsets.only(top: 40.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(10.0),
                        // margin: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 7),
                      Text(
                        'Admin Approval',
                        style: AppWidget.headlinetextstyle(26),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                      color: const Color.fromARGB(255, 233, 233, 249),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height / 1.5,
                          child: allApprovals(),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
