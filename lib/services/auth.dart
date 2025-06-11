import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:recycle_app/pages/home.dart';
import 'package:recycle_app/services/database.dart';
import 'package:recycle_app/services/shared_pref.dart';

class AuthMethods {
  signInWithGoogle(BuildContext context) async {
    final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    final GoogleSignIn googleSignIn = GoogleSignIn();

    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential result = await firebaseAuth.signInWithCredential(credential);

    User? user = result.user;
    await SharedPreferencesHelper().saveUserEmail(user!.email!);
    await SharedPreferencesHelper().saveUserId(user.uid);
    await SharedPreferencesHelper().saveUserImage(user.photoURL!);
    await SharedPreferencesHelper().saveUserName(user.displayName!);
    if (user != null) {
      Map<String, dynamic> userInfoMap = {
        "email": user.email,
        "name": user.displayName,
        "imageUrl": user.photoURL,
        "uid": user.uid,
        "Points": "0",
      };

      await DatabaseMethods().addUserInfo(userInfoMap, user.uid);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));

      // // You can now use userInfoMap to store in your database or perform other actions
      // print("User signed in: ${userInfoMap['name']}");

      // // Navigate to home page or perform other actions
      // Navigator.pushReplacementNamed(context, '/home');
    }
    // else {
    //   // User sign-in failed
    //   print("Sign-in failed");
    // }
  }
}
