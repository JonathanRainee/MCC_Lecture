import 'package:fe_lec_finalproject/repository/CartRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();

  final name = TextEditingController();
  final price = TextEditingController();
  final desc = TextEditingController();
  final notes = TextEditingController();

  void addItem(String menuName, int totalPrice, int quantity, String note, String pickedFile){
  }
}