import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:lecture_mcc/main.dart';
import 'package:lecture_mcc/view/home.dart';
import 'package:lecture_mcc/view/register.dart';

class AuthRepository extends GetxController{
  static AuthRepository get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5));
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, setScreen);
  }

  setScreen(User? user) {
    _auth == null ? Get.offAll(() => const Homepage()) : Get.offAll(() => const RegisterPage());
  }

  Future<void> createUserWithEmailAndPassword(String email, String password) async{
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    firebaseUser.value != null ? Get.offAll(() => const Homepage()) : Get.offAll(() => const RegisterPage());
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async{
    await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<void> logOut() async{
    if(_auth != null){
      print("tidak null");
    }else{
      print("null");
    }
    await _auth.signOut();
    if(_auth != null){
      print("sesudah tidak null");
    }else{
      print("sesudah null");
    }
  } 
}