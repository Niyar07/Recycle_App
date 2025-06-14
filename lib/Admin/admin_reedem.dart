import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:recycle_app/services/database.dart';
import 'package:recycle_app/services/widget_support.dart';

class AdminReedem extends StatefulWidget {
  const AdminReedem({super.key});

  @override
  State<AdminReedem> createState() => _AdminReedemState();
}

class _AdminReedemState extends State<AdminReedem> {
  Stream? reedemStream;

  getontheload() async {
    reedemStream = await DatabaseMethods().getAdminReedemApproval();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    getontheload();
  }

  Widget allApprovals() {
    return StreamBuilder(
        stream: reedemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    // Split date for UI
                    String dateStr = ds["Date"];
                    List<String> dateParts = dateStr.split(' ');
                    String day = dateParts[0];
                    String month = dateParts.length > 1 ? dateParts[1] : '';

                    return Container(
                      margin: EdgeInsets.only(
                          left: 20.0, right: 20.0, bottom: 16.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Date Box
                          Container(
                            width: 48,
                            height: 48,
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  day,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                Text(
                                  month,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: 10),
                          // Details
                          Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 12.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Icon(Icons.person,
                                          color: Colors.green, size: 20),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          ds["Name"],
                                          style: AppWidget.normallinetextstyle(
                                                  16.0)
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.point_of_sale,
                                          color: Colors.green, size: 20),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          "Points Reedem : ${ds["Points"]}",
                                          style: AppWidget.normallinetextstyle(
                                              16.0),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 4),
                                  Row(
                                    children: [
                                      Icon(Icons.payments_rounded,
                                          color: Colors.green, size: 20),
                                      SizedBox(width: 6),
                                      Expanded(
                                        child: Text(
                                          "UPI ID : ${ds["UPI"]}",
                                          style: AppWidget.normallinetextstyle(
                                              16.0),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8),
                                  Container(
                                    height: 32,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(10)),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Approved",
                                        style: AppWidget.whitetextstyle(16),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10.0),
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
                    'Reedem Approval',
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
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: allApprovals(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
