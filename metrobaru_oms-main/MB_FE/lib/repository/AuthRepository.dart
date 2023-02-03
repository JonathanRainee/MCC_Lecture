import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fe_lec_finalproject/class/user.dart';
import 'package:fe_lec_finalproject/controller/UserController.dart';
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
      user = UserModel(id: value.user!.uid.toString(), typeId: 1, typeName: role, username: username, emailAddress: email, phoneNumber: phoneNumber, accountCreationDate: date),
      createUser(user),
    }).whenComplete(() => 
      Get.offAll(() => const SignInPage())
    );
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async{
    // print("masuk jing: "+email);
    String UID = "";
    String name = "";
    String userEmail = "";
    String phoneNumber = "";
    String typeId = "";
    String typeName = "";
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      // print("uid: "+value.user!.uid.toString())
      UID = value.user!.uid.toString()
    );
    print("hello turn: "+UID);
    Stream<QuerySnapshot> ref = _db.collection("user").where("id", isEqualTo: UID).snapshots();
    ref.forEach((element) {
      element.docs.asMap().forEach((key, value) {
        name = element.docs[0]["username"];
        userEmail = element.docs[0]["emailAddress"];
        phoneNumber = element.docs[0]["phoneNumber"];
        typeId = element.docs[0]["typeId"].toString();
        typeName = element.docs[0]["typeName"];

        // print("id: "+UID);
        print("username: "+name);
        print("email: "+userEmail);
        print("phoneNumber: "+phoneNumber);
        print("typeId: "+typeId);
        print("typeName: "+typeName);

      });
    });
    // var snap = await _db.collection("user").where("id", isEqualTo: UID).get().then((QuerySnapshot value){
    //   // final data = value. as Map<String, dynamic>;
    //   value.docs.forEach((element) {
    //     print(element.data().value);
    //   });
    // });
    print("end");
    // print(snap.value.data);
    firebaseUser.value != null ? Get.offAll(() => const RegisterPage()) : Get.offAll(() => const SignInPage());
  }

  Future<void> logOut() async{
    await _auth.signOut();
  } 
}