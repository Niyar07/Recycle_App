import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart';
import 'package:recycle_app/services/database.dart';
import 'package:recycle_app/services/shared_pref.dart';
import 'package:recycle_app/services/widget_support.dart';
import 'package:image_picker/image_picker.dart';

class UploadItemPage extends StatefulWidget {
  // const UploadItemPage({super.key});
  String? category, id;
  UploadItemPage({required this.category, required this.id, super.key});

  @override
  State<UploadItemPage> createState() => _UploadItemPageState();
}

class _UploadItemPageState extends State<UploadItemPage> {
  TextEditingController addressController = new TextEditingController();
  TextEditingController quantityController = new TextEditingController();
  final ImagePicker _picker = ImagePicker();
  File? selectedImage;
  String? id, name;

  gettheSharedPref() async {
    final sharedPrefHelper = SharedPreferencesHelper();
    id = await sharedPrefHelper.getUserId();
    name = await sharedPrefHelper.getUserName();
    // Assuming you have a method to get the user ID and name from shared preferences
    // id = await SharedPreferencesHelper.getUserId();
    // name = await SharedPreferencesHelper.getUserName();
    setState(() {});
  }

  Future getImage() async {
    var image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    selectedImage = File(image!.path);

    setState(() {
      selectedImage = File(image.path);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gettheSharedPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 40.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Material(
                    elevation: 3.0,
                    borderRadius: BorderRadius.circular(60.0),
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      // margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width / 5.5),
                  Text(
                    'Upload item',
                    style: AppWidget.headlinetextstyle(26),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                  color: const Color.fromARGB(255, 233, 233, 249),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40.0,
                    ),
                    selectedImage != null
                        ? Container(
                            height: 180,
                            width: 180,
                            child:
                                Image.file(selectedImage!, fit: BoxFit.cover),
                          )
                        : GestureDetector(
                            onTap: () {
                              getImage();
                            },
                            child: Center(
                              child: Container(
                                height: 180.0,
                                width: 180,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                ),
                                child: Icon(
                                  Icons.camera_alt_outlined,
                                  size: 50.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                    SizedBox(
                      height: 60.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                          "Enter your Address you want the item to be picked up",
                          style: AppWidget.normallinetextstyle(18.0)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // decoration: BoxDecoration(color: Colors.white),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextField(
                          controller: addressController,
                          decoration: InputDecoration(
                            hintText: 'Enter your address',
                            hintStyle: AppWidget.normallinetextstyle(16.0)
                                .copyWith(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.location_on,
                              color: Colors.green,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text("Enter the Quantity of item to be picked up",
                          style: AppWidget.normallinetextstyle(18.0)),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 20.0),
                      // decoration: BoxDecoration(color: Colors.white),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20.0),
                        child: TextField(
                          controller: quantityController,
                          decoration: InputDecoration(
                            hintText: 'Enter the quantity',
                            hintStyle: AppWidget.normallinetextstyle(16.0)
                                .copyWith(color: Colors.grey),
                            prefixIcon: Icon(
                              Icons.inventory_2,
                              color: Colors.green,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60.0,
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (addressController.text != "" &&
                            quantityController.text != "") {
                          String itemid = randomAlphaNumeric(10);
                          Reference firebaseStorageRef = FirebaseStorage
                              .instance
                              .ref()
                              .child("Items")
                              .child(itemid + ".jpg");
                          final UploadTask task =
                              firebaseStorageRef.putFile(selectedImage!);
                          var downloadUrl =
                              await (await task).ref.getDownloadURL();

                          Map<String, dynamic> addItem = {
                            "Image": "",
                            "Address": addressController.text,
                            "Quantity": quantityController.text,
                            "userId": id,
                            "Name": name,
                            "ItemId": itemid,
                          };
                          await DatabaseMethods().addUserUploadItem(
                            addItem,
                            id!,
                            itemid,
                          );
                        }
                        // // Handle upload item action
                        // String address = addressController.text;
                        // String quantity = quantityController.text;

                        // if (address.isNotEmpty && quantity.isNotEmpty) {
                        //   // Call the database method to upload the item
                        //   DatabaseMethods().addUserUploadItem({
                        //     "address": address,
                        //     "quantity": quantity,
                        //   }, userId, itemId);
                        // }
                      },
                      child: Center(
                        child: Container(
                          height: 55.0,
                          width: MediaQuery.of(context).size.width * .5,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Center(
                            child: Text(
                              "Upload",
                              textAlign: TextAlign.center,
                              style: AppWidget.whitetextstyle(20.0).copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
