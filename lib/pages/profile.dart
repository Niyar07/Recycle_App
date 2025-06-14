import 'package:flutter/material.dart';
import 'package:recycle_app/services/widget_support.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Center(
              child: Text("Profile Page",
                  style: AppWidget.headlinetextstyle(
                    24,
                  )),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
