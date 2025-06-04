import 'package:flutter/material.dart';
import 'package:recycle_app/services/auth.dart';
import 'package:recycle_app/services/widget_support.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          children: [
            Center(
                child: Image.asset(
              "images/login.png",
              height: 350,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            )),
            const SizedBox(
              height: 20,
            ),
            Image.asset("images/recycle1.png",
                height: 100, width: 100, fit: BoxFit.cover),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Reduce, Reuse, Recycle ",
              style: AppWidget.headlinetextstyle(24),
            ),
            // const SizedBox(
            //   height: 10,
            // ),
            Text("Repeat!", style: AppWidget.greentextstyle(32)),
            const SizedBox(
              height: 70,
            ),
            Text(
              "Every item you recycle \nmakes a difference.",
              style: AppWidget.normallinetextstyle(18),
              textAlign: TextAlign.center,
            ),

            Text("Get Started", style: AppWidget.greentextstyle(24)),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                AuthMethods().signInWithGoogle(context);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 45, right: 45),
                padding: const EdgeInsets.only(left: 10),
                child: Material(
                  elevation: 15,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Image.asset("images/google.png",
                              height: 30, width: 30, fit: BoxFit.cover),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          "Sign in with Google",
                          style: AppWidget.whitetextstyle(22),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
