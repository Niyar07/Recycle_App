import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future addUserInfo(Map<String, dynamic> userInfoMap, String id) async {
    return await _firestore.collection("users").doc(id).set(userInfoMap);
  }

  Future addUserUploadItem(
      Map<String, dynamic> userInfoMap, String id, String itemId) async {
    return await _firestore
        .collection("users")
        .doc(id)
        .collection("upload_items")
        .doc(itemId)
        .set(userInfoMap);
  }

  Future addAdminItem(Map<String, dynamic> userInfoMap, String id) async {
    return await _firestore.collection("Requests").doc(id).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getAdminApproval() async {
    return await FirebaseFirestore.instance
        .collection("Requests")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }

  Future updateUserRequest(String id, String itemId) async {
    return await _firestore
        .collection("users")
        .doc(id)
        .collection("upload_items")
        .doc(itemId)
        .set({"Status": "Approved"});
  }

  // Future updateAdminRequest(String id, String itemId) async {
  Future updateAdminRequest(String id) async {
    return await _firestore
        .collection("Requests")
        .doc(id)
        .set({"Status": "Approved"});
  }
}
//children
