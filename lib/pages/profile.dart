// import 'package:flutter/material.dart';
// import 'package:recycle_app/services/auth.dart';
// import 'package:recycle_app/services/shared_pref.dart';
// import 'package:recycle_app/services/widget_support.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   String? id, name, email, image;

//   getthesharedpref() async {
//     id = await SharedPreferencesHelper().getUserId();
//     name = await SharedPreferencesHelper().getUserName();
//     email = await SharedPreferencesHelper().getUserEmail();
//     image = await SharedPreferencesHelper().getUserImage();
//   }

//   ontheload() async {
//     await getthesharedpref();
//     setState(() {});
//   }

//   @override
//   void initState() {
//     ontheload();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return name == null
//         ? Container(child: CircularProgressIndicator())
//         : Container(
//             margin: EdgeInsets.only(top: 60.0),
//             child: Column(
//               children: [
//                 Center(
//                   child: Text(
//                     "Profile Page",
//                     style: AppWidget.headlinetextstyle(28.0),
//                   ),
//                 ),
//                 SizedBox(height: 20.0),
//                 Expanded(
//                     child: Container(
//                   padding: EdgeInsets.only(left: 20.0, right: 20.0),
//                   width: MediaQuery.of(context).size.width,
//                   decoration: BoxDecoration(
//                     color: Color.fromARGB(255, 233, 233, 249),
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   child: Column(
//                     children: [
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Center(
//                         child: ClipRRect(
//                           borderRadius: BorderRadius.circular(80),
//                           child: Image.network(
//                             image!,
//                             height: 140,
//                             width: 140,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Container(
//                         child: Material(
//                           elevation: 3.0,
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             padding: EdgeInsets.all(10),
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.person,
//                                   color: Color(0xff4da9ba),
//                                   size: 35.0,
//                                 ),
//                                 SizedBox(
//                                   width: 15.0,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Name",
//                                       style: TextStyle(
//                                           color: Colors.black45,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       name!,
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       Container(
//                         child: Material(
//                           elevation: 3.0,
//                           borderRadius: BorderRadius.circular(10),
//                           child: Container(
//                             padding: EdgeInsets.all(10),
//                             width: MediaQuery.of(context).size.width,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Row(
//                               children: [
//                                 Icon(
//                                   Icons.email,
//                                   color: Color(0xff4da9ba),
//                                   size: 35.0,
//                                 ),
//                                 SizedBox(
//                                   width: 15.0,
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Email",
//                                       style: TextStyle(
//                                           color: Colors.black45,
//                                           fontSize: 18.0,
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     Text(
//                                       email!,
//                                       style: TextStyle(
//                                         color: Colors.black,
//                                         fontSize: 20.0,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           SignOut();
//                         },
//                         child: Container(
//                           child: Material(
//                             elevation: 3.0,
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(
//                               padding: EdgeInsets.all(10),
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.logout,
//                                     color: Color(0xff4da9ba),
//                                     size: 35.0,
//                                   ),
//                                   SizedBox(
//                                     width: 15.0,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "LogOut",
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20.0,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           deleteuser();
//                         },
//                         child: Container(
//                           child: Material(
//                             elevation: 3.0,
//                             borderRadius: BorderRadius.circular(10),
//                             child: Container(
//                               padding: EdgeInsets.all(10),
//                               width: MediaQuery.of(context).size.width,
//                               decoration: BoxDecoration(
//                                 color: Colors.white,
//                                 borderRadius: BorderRadius.circular(10),
//                               ),
//                               child: Row(
//                                 children: [
//                                   Icon(
//                                     Icons.delete,
//                                     color: Color(0xff4da9ba),
//                                     size: 35.0,
//                                   ),
//                                   SizedBox(
//                                     width: 15.0,
//                                   ),
//                                   Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Delete Account",
//                                         style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 20.0,
//                                           fontWeight: FontWeight.bold,
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ))
//               ],
//             ),
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'package:recycle_app/services/auth.dart';
import 'package:recycle_app/services/shared_pref.dart';
import 'package:recycle_app/services/widget_support.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String? id, name, email, image;

  Future<void> getthesharedpref() async {
    id = await SharedPreferencesHelper().getUserId();
    name = await SharedPreferencesHelper().getUserName();
    email = await SharedPreferencesHelper().getUserEmail();
    image = await SharedPreferencesHelper().getUserImage();
  }

  Future<void> ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    ontheload();
  }

  Future<void> signOut() async {
    await AuthMethods().SignOut();
    await SharedPreferencesHelper().clearUserData();
    if (mounted) {
      Navigator.of(context).pushNamedAndRemoveUntil('/login', (route) => false);
    }
  }

  Future<void> deleteUser() async {
    // Show confirmation dialog before deleting
    bool? confirm = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Delete Account"),
        content: Text(
            "Are you sure you want to delete your account? This action cannot be undone."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text("Delete", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
    if (confirm == true) {
      await AuthMethods().deleteuser();
      await SharedPreferencesHelper().clearUserData();
      if (mounted) {
        Navigator.of(context)
            .pushNamedAndRemoveUntil('/login', (route) => false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return name == null
        ? Center(child: CircularProgressIndicator())
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
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 233, 233, 249),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 20.0),
                        Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: image != null && image!.isNotEmpty
                                ? Image.network(
                                    image!,
                                    height: 140,
                                    width: 140,
                                    fit: BoxFit.cover,
                                  )
                                : Container(
                                    height: 140,
                                    width: 140,
                                    color: Colors.grey[300],
                                    child: Icon(Icons.person,
                                        size: 80, color: Colors.grey[700]),
                                  ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Color(0xff4da9ba),
                                  size: 35.0,
                                ),
                                SizedBox(width: 15.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Name",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      name ?? "",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: EdgeInsets.all(10),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.email,
                                  color: Color(0xff4da9ba),
                                  size: 35.0,
                                ),
                                SizedBox(width: 15.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email",
                                      style: TextStyle(
                                          color: Colors.black45,
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      email ?? "",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: signOut,
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout,
                                    color: Color(0xff4da9ba),
                                    size: 35.0,
                                  ),
                                  SizedBox(width: 15.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "LogOut",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        GestureDetector(
                          onTap: deleteUser,
                          child: Material(
                            elevation: 3.0,
                            borderRadius: BorderRadius.circular(10),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.delete,
                                    color: Color(0xff4da9ba),
                                    size: 35.0,
                                  ),
                                  SizedBox(width: 15.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Delete Account",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
