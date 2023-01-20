import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:lecture_mcc/model/food.dart';
import 'package:lecture_mcc/view/home.dart';

class FoodRepository extends GetxController{
  static FoodRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createFood(Food food) async{
    await _db.collection("food").add(food.toJson()).whenComplete(() => 
      Get.offAll(() => const Homepage())
    );
    // bs kasi popup kl mau
  }
}