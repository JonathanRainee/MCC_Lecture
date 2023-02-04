import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fe_lec_finalproject/class/user.dart';
import 'package:fe_lec_finalproject/controller/UserController.dart';
import 'package:fe_lec_finalproject/page/admin/admin_main_page.dart';
import 'package:fe_lec_finalproject/page/customer/customer_main_page.dart';
import 'package:fe_lec_finalproject/page/home_page.dart';
import 'package:fe_lec_finalproject/page/register_page.dart';
import 'package:fe_lec_finalproject/page/sign_in_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.put(AuthRepository());

  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;
  late final Rx<User?> firebaseUser;
  final uc = Get.put(UserController());

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setScreen);
  }

  setScreen(User? user) {

    _auth == null ? Get.offAll(() => const SignInPage()) : Get.offAll(() => const RegisterPage());
  }

  createUser(UserModel u) async{
    await _db.collection("user").add(u.toJson());
  }

  void findUser(String uid){
    _db.collection("user").where("id", isEqualTo: uid).snapshots().listen((data) {
      print(data);
    });
  }

  Future<void> createUserWithEmailAndPassword(String email, String password, String username, String phoneNumber) async{
    String role = "customer";
    String date = "2022-10-22";
    String path = "asdf";
    UserModel user;
    String UID = "";
    await _auth.createUserWithEmailAndPassword(email: email, password: password).then((value) => {
      UID = value.user!.uid.toString(),
      user = UserModel(id: value.user!.uid.toString(), typeId: 1, typeName: role, username: username, emailAddress: email, phoneNumber: phoneNumber, accountCreationDate: date, docID: "--"),
      createUser(user),
    }).whenComplete(() => 
      Get.offAll(() => const SignInPage())
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async{
    String UID = "";
    String name = "";
    String userEmail = "";
    String phoneNumber = "";
    int typeId = 0;
    String typeName = "";
    UserModel user;
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      UID = value.user!.uid.toString()
    );

    Stream<QuerySnapshot> ref = _db.collection("user").where("id", isEqualTo: UID).snapshots();
    ref.forEach((element) {
      element.docs.asMap().forEach((key, value) {
        print(element.docs[0].id);
        name = element.docs[0]["username"];
        userEmail = element.docs[0]["emailAddress"];
        phoneNumber = element.docs[0]["phoneNumber"];
        typeId = element.docs[0]["typeId"];
        typeName = element.docs[0]["typeName"];
      });
      user = UserModel(id: UID, typeId: typeId, typeName: typeName, username: name, emailAddress: userEmail, phoneNumber: phoneNumber, accountCreationDate: "d", docID: element.docs[0].id);
      print("apa nih "+user.username);
      if(firebaseUser.value != null){
        print("ada user");
      }else{
        print("gad user");
      }
      firebaseUser.value != null ? typeId == 1 ? Get.offAll(() => CUSMainPage(user: user)) : Get.offAll(() => ADMMainPage(user: user)) : Get.offAll(() => const SignInPage());
    });

  }

  Future<void> logOut() async{
    await _auth.signOut();
  } 
}