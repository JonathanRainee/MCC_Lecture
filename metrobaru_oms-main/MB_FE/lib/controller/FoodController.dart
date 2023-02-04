import 'package:fe_lec_finalproject/class/Food.dart';
import 'package:fe_lec_finalproject/repository/FoodRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class FoodController extends GetxController{
  static FoodController get instance => Get.find();

  final name = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();

  void addFood(String menuName, String totalPrice, String desc, String pickedFile){
    FoodRepository.instance.addFood(menuName, totalPrice, desc, pickedFile);
  }

  List<Food> getAllFood(){
    // List<Food> list;
    Future data = FoodRepository.instance.getAllFood();
    return data as List<Food>;
  }
}