import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lecture_mcc/model/food.dart';
import 'package:lecture_mcc/repository/FoodRepository.dart';

class FoodController extends GetxController{
  static FoodController get instance => Get.find();

  final name = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();

  final foodRepo = Get.put(FoodRepository());

  Food createFood(String name, int price, String desc){
    Food f = Food(name: name, price: price, description: desc);
    return f;
  }

  void addFood(Food food) async{
    print(food.name+" "+food.description);
    await foodRepo.createFood(food);
  }
}