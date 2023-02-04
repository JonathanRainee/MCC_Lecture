import 'dart:io';

import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/class/user.dart';
import 'package:fe_lec_finalproject/controller/CartController.dart';
import 'package:fe_lec_finalproject/controller/FoodController.dart';
import 'package:fe_lec_finalproject/controller/UserController.dart';
import 'package:fe_lec_finalproject/cui/cui_form_button.dart';
import 'package:fe_lec_finalproject/cui/cui_form_field.dart';
import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/page/admin/admin_main_page.dart';
import 'package:fe_lec_finalproject/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_background/animated_background.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';

// import '../class/feature.dart';
// import '../debug_item_list.dart';
// import 'customer/customer_main_page.dart';
// import 'sign_in_page.dart';

class AddFoodPage extends StatefulWidget {
  const AddFoodPage({super.key});

  @override
  State<AddFoodPage> createState() => _AddFoodPageState();
}

class _AddFoodPageState extends State<AddFoodPage>
    with TickerProviderStateMixin {
  ParticleOptions particles = ParticleOptions(
    spawnOpacity: 0,
    minOpacity: 0.1,
    maxOpacity: 0.2,
    particleCount: 10,
    spawnMaxRadius: 150,
    spawnMinRadius: 50,
    spawnMaxSpeed: 15,
    spawnMinSpeed: 15,
    image: Image.asset('assets/images/UI/animation particle.png'),
  );


  final controller = Get.put(UserController());
  final fController = Get.put(FoodController());
  TextEditingController unameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController pwordCtrl = TextEditingController();
  TextEditingController pwcfCtrl = TextEditingController();

  File? image;
  // File? img;

  Future getImage() async {
    XFile? picked;
    try {
      showDialog(
          context: context,
          builder: ((context) => AlertDialog(
                backgroundColor: Colors.transparent,
                elevation: 0,
                alignment: Alignment.center,
                insetPadding: EdgeInsets.zero,
                content: Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Container(
                          color: Palette.background,
                          height: 100,
                          width: 80,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                            child: Column(
                              children: [
                                const Text(
                                  "Choose a photo",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () async {
                                          picked = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.gallery);
                                          if (picked == null) {
                                            return;
                                          } else {
                                            setState(() =>
                                                image = File(picked!.path));
                                          }
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                        alignment: Alignment.center,
                                        icon: const Icon(
                                          Icons.photo_library_rounded,
                                          color: Palette.accent,
                                          size: 45,
                                        )),
                                    Container(
                                      width: 50,
                                    ),
                                    IconButton(
                                        onPressed: () async {
                                          picked = await ImagePicker()
                                              .pickImage(
                                                  source: ImageSource.camera);
                                          if (picked == null) {
                                            return;
                                          } else {
                                            setState(() =>
                                                image = File(picked!.path));
                                          }
                                          // ignore: use_build_context_synchronously
                                          Navigator.pop(context);
                                        },
                                        alignment: Alignment.center,
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Palette.accent,
                                          size: 45,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )));
    } on PlatformException {
      const pwRecMsg = SnackBar(
        content: Text("Access Denied!"),
        backgroundColor: Palette.error,
        duration: Duration(seconds: 3),
      );
      ScaffoldMessenger.of(context).showSnackBar(pwRecMsg);
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 85, 0, 0),
      resizeToAvoidBottomInset: true,
      body: AnimatedBackground(
        behaviour: RandomParticleBehaviour(options: particles),
        vsync: this,
        child: SingleChildScrollView(
          child: SizedBox(
            height: SizeConfig.height,
            width: SizeConfig.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizeConfig.bigScreen()
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: SizeConfig.bigScreen(),
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  width: SizeConfig.widthByPercent(25),
                                ),
                              ),
                            ),
                            Text(
                              "RM. METRO BARU",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.widthByPercent(12),
                                fontWeight: FontWeight.w800,
                                color: Palette.white,
                                fontFamily: 'Madec',
                                letterSpacing: 1.5,
                              ),
                            ),
                            Text(
                              "PASAR JAMBI",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: SizeConfig.widthByPercent(5),
                                fontWeight: FontWeight.w400,
                                color: Palette.white,
                                letterSpacing: 2.5,
                              ),
                            ),
                          ],
                        )
                      : Image.asset(
                          'assets/images/logo-text-white.png',
                          width: SizeConfig.widthByPercent(90),
                        ),
                ),
                Container(
                  padding: const EdgeInsets.all(25),
                  width: SizeConfig.width,
                  decoration: const BoxDecoration(
                    color: Palette.background,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Add Menu!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.widthByPercent(6),
                            fontWeight: FontWeight.w800,
                            color: Palette.black,
                          ),
                        ),
                      ),
                      Center(
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: ElevatedButton(
                              onPressed: () {
                                getImage();
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 0,
                                primary: Palette.background,
                                minimumSize: Size.zero,
                                padding: EdgeInsets.zero,
                              ),
                              child: image != null
                                  ? Container(
                                      constraints: const BoxConstraints.expand(
                                        width: 160,
                                        height: 240,
                                      ),
                                      alignment: Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: FileImage(image!),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      child: Container(
                                        color: const Color.fromRGBO(0, 0, 0, 0.5),
                                        width: double.infinity,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              10, 5, 10, 5),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: const [
                                              Icon(
                                                Icons.edit,
                                                size: 18,
                                              ),
                                              Text(
                                                " Choose Cover",
                                                style: TextStyle(fontSize: 14),
                                              )
                                            ],
                                          ),
                                        ),
                                      ))
                                  : Image.asset(
                                      "assets/images/default_cover.png",
                                      width: 160,
                                      height: 240,
                                      fit: BoxFit.cover,
                                    ),
                            )),
                      ),
                      CUIFormField(
                        controller: fController.name,
                        hintText: "Menu Name",
                        keyboardType: TextInputType.text,
                        suffixIcon: Icons.person_rounded,
                        top: 15,
                      ),
                      CUIFormField(
                        controller: fController.price,
                        hintText: "Menu Price",
                        keyboardType: TextInputType.number,
                        suffixIcon: Icons.phone_rounded,
                        top: 20,
                      ),
                      CUIFormField(
                        controller: fController.desc,
                        hintText: "Menu Description",
                        keyboardType: TextInputType.text,
                        suffixIcon: Icons.visibility,
                        top: 20,
                      ),
                    
                      CUIFormButton(
                        text: "Add Menu",
                        top: 20,
                        function: () {
                          print("image: "+image!.path);
                          fController.addFood(fController.name.text, fController.price.text, fController.desc.text, image!.path);
                          Navigator.of(context).pop();
                          // cartController.addItem(menuName, totalPrice, quantity, note, pickedFile)
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
