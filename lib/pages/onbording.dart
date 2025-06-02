import 'package:flutter/material.dart';
import 'package:recycle_app/services/widget_support.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 60.0,
            ),
            Image.asset("images/onboard.png"),
            SizedBox(
              height: 60.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text("Recycle your waste products !",
                  style: AppWidget.headlinetextstyle(32.0)),
            ),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text(
                  "Easily collect household waste and generate less waste",
                  style: AppWidget.normallinetextstyle(16.0)),
            ),
            SizedBox(
              height: 60.0,
            ),
            Material(
              elevation: 7.0,
              borderRadius: BorderRadius.circular(20.0),
              child: Container(
                width: MediaQuery.of(context).size.width / 1.5,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  child: Text("Get Started",
                      textAlign: TextAlign.center,
                      style: AppWidget.whitetextstyle(20.0).copyWith()),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
