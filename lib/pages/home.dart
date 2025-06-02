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
        body: Container(
          margin: EdgeInsets.only(left: 20.0, right: 20, top: 40.0),
          child: Column(
            children: [
              Row(
                children: [
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
                        "images/coca.png",
                        height: 50.0,
                        width: 50.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Image.asset(
                "images/home.png",
                // height: MediaQuery.of(context).size.height / 2.5,
                // width: MediaQuery.of(context).size.width,
                // fit: BoxFit.cover,
              ),
            ],
          ),
        ));
  }
}
