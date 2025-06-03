import 'package:flutter/material.dart';
import 'package:recycle_app/services/widget_support.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 15.0, right: 15, top: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Image.asset("images/wave.png", height: 40.0, width: 40.0),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "Hello, ",
                      style: AppWidget.headlinetextstyle(26.0),
                    ),
                    Text("Niyar",
                        style: AppWidget.greentextstyle(26.0).copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.asset(
                          "images/boy.jpg",
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 35.0,
                ),
                Center(
                  child: Image.asset(
                    "images/home.png",
                    height: MediaQuery.of(context).size.height / 2.5,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Text("Categories",
                      style: AppWidget.headlinetextstyle(26.0).copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 130.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Plastic Category
                      Container(
                        margin: EdgeInsets.only(right: 15.0),
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.green[100],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.green, width: 2.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/plastic.png", height: 60.0),
                            SizedBox(height: 10.0),
                            Text("Plastic",
                                style: AppWidget.normallinetextstyle(16.0)
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),

                      // Paper Category

                      Container(
                        margin: EdgeInsets.only(right: 15.0),
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.yellow[100],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.yellow, width: 2.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/paper.png", height: 60.0),
                            SizedBox(height: 10.0),
                            Text("Paper",
                                style: AppWidget.normallinetextstyle(16.0)
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),

                      // Class Category
                      Container(
                        margin: EdgeInsets.only(right: 15.0),
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.blue, width: 2.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/glass.png", height: 60.0),
                            SizedBox(height: 10.0),
                            Text("Glass",
                                style: AppWidget.normallinetextstyle(16.0)
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15.0),
                        width: 120.0,
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(20.0),
                          border: Border.all(color: Colors.red, width: 2.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("images/battery.png", height: 60.0),
                            SizedBox(height: 10.0),
                            Text("Electronics",
                                style: AppWidget.normallinetextstyle(16.0)
                                    .copyWith(
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Text("Pending Requests",
                      style: AppWidget.headlinetextstyle(26.0).copyWith(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.green, width: 2.0),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,
                                color: Colors.green, size: 30.0),
                            SizedBox(width: 10.0),
                            Text(
                              "Main Market, Nagpur",
                              style:
                                  AppWidget.normallinetextstyle(16.0).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Add your pending request widgets here
                      Divider(),
                      Image.asset(
                        "images/chips.png",
                        height: 120.0,
                        width: 120.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.layers, color: Colors.green, size: 30.0),
                            SizedBox(width: 10.0),
                            Text(
                              "3 Items",
                              style: AppWidget.normallinetextstyle(16.0)
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30.0,
                ),
              ],
            ),
          ),
        ));
  }
}
