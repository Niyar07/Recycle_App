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
    return FirebaseFirestore.instance
        .collection("Requests")
        .where("Status", isEqualTo: "Pending")
        .snapshots();
  }

  Future<Stream<QuerySnapshot>> getAdminReedemApproval() async {
    return FirebaseFirestore.instance
        .collection("Reedem")
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

  Future updateUserPoints(String id, String points) async {
    return await _firestore.collection("users").doc(id).set({"Points": points});
  }

  Future addUserReedemPoints(
      Map<String, dynamic> userInfoMap, String id, String reedemid) async {
    return await _firestore
        .collection("users")
        .doc(id)
        .collection("Reedem")
        .doc(reedemid)
        .set(userInfoMap);
  }

  Future addAdminReedemRequest(
      Map<String, dynamic> userInfoMap, String reedemid) async {
    return await _firestore.collection("Reedem").doc(reedemid).set(userInfoMap);
  }

  Future<Stream<QuerySnapshot>> getUserTransactions(String id) async {
    return FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .collection("Reedem")
        .snapshots();
  }
}
//children
