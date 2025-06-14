import 'package:flutter/material.dart';
import 'package:recycle_app/services/widget_support.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "images/login.png",
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )),
            SizedBox(
              height: 20,
            ),
            Text(
              "Admin Login ",
              style: AppWidget.headlinetextstyle(26.0),
            )
          ],
        ),
      ),
    );
  }
}
