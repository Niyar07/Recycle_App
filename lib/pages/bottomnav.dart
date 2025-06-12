import 'package:flutter/material.dart';
import 'package:recycle_app/pages/points.dart';
import 'package:recycle_app/pages/home.dart';
import 'package:recycle_app/pages/profile.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  late List<Widget> pages;

  late HomePage HomePages;
  late Points pointsPage;
  late Profile profilePage;

  int currentIndex = 0;

  @override
  void initState() {
    HomePages = HomePage();
    pointsPage = Points();
    profilePage = Profile();

    pages = [HomePages, pointsPage, profilePage];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 70.0,
        backgroundColor: Colors.white,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        // animationCurve: Curves.easeInOut,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.star,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentIndex],
    );
  }
}
