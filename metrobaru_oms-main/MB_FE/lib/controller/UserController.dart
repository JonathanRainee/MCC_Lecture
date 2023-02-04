import 'package:fe_lec_finalproject/class/user.dart';
import 'package:fe_lec_finalproject/repository/AuthRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  final email = TextEditingController();
  final pass = TextEditingController();
  final username = TextEditingController();
  final phoneNumber = TextEditingController();


  void registerUser(String email, String pass, String username, String phoneNumber){
    Get.put(AuthRepository.instance.createUserWithEmailAndPassword(email, pass, username, phoneNumber));
  }

  static UserModel createUser(String id, int typeId, String typeName, String username, String email, String phoneNumber, String accountCreationDate, String docID){
    UserModel u = UserModel(id: id, typeId: typeId, typeName: typeName, username: username, emailAddress: email, phoneNumber: phoneNumber, accountCreationDate: accountCreationDate, docID: docID);
    return u;
  }

  void logInUser(String email, String pass){
    AuthRepository.instance.signInWithEmailAndPassword(email, pass);
  }

  void logout(){
    AuthRepository.instance.logOut();
  }
}