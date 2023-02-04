
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fe_lec_finalproject/class/Food.dart';
import 'package:fe_lec_finalproject/page/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FoodRepository extends GetxController{
  static FoodRepository get instance => Get.put(FoodRepository());

  String uniqueFileName = DateTime.now().microsecondsSinceEpoch.toString();
  final _db = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;
  String imageURL = "";

  createFood(Food f) async{
    await _db.collection("food").add(f.toJson());
  }

  Future addFood(String menuName, String menuPrice, String desc, String pickedFile)async{
    String currUserUID = auth.currentUser!.uid.toString();
    // final path = 'files/'+pickedFile;
    // final file = File(path);
    Food f;
    if(pickedFile == null) return;
    Reference storage = FirebaseStorage.instance.ref();
    Reference refImage = storage.child('images');
    Reference imageToUpload = refImage.child(uniqueFileName);
    await imageToUpload.putFile(File(pickedFile));
    imageURL = await imageToUpload.getDownloadURL().whenComplete(() => 
      print("add success")
    );
    f = Food(id: "id", menuName: menuName, menuPrice: menuPrice, menuDesc: desc, menuImage: imageURL);
    await createFood(f);
  }

  Future getAllFood() async{
    QuerySnapshot snap = await _db.collection("food").get();
    final data = snap.docs.map((e) => e.data()).toList();
    print("ini data");
    print(data[0]);
    return data;
  }
}