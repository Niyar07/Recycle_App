import 'package:flutter/material.dart';
import 'package:recycle_app/services/shared_pref.dart';
import 'package:recycle_app/services/widget_support.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? id, name, email, image;

  getthesharedpref() async {
    id = await SharedPreferencesHelper().getUserId();
    name = await SharedPreferencesHelper().getUserName();
    email = await SharedPreferencesHelper().getUserEmail();
    image = await SharedPreferencesHelper().getUserImage();
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return name == null
        ? Container(child: CircularProgressIndicator())
        : Container(
            margin: EdgeInsets.only(top: 60.0),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Profile Page",
                    style: AppWidget.headlinetextstyle(28.0),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                    child: Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  width: MediaQuery.of(context).size.width,
                ))
              ],
            ),
          );
  }
}
