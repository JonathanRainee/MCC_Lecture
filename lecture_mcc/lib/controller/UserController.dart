import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:lecture_mcc/repository/authRepository.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final email = TextEditingController();
  final pass = TextEditingController();

  void registerUser(String email, String pass){
    AuthRepository.instance.createUserWithEmailAndPassword(email, pass);
  }

  void logInUser(String email, String pass){
    AuthRepository.instance.signInWithEmailAndPassword(email, pass);
  }
}