import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/class/user.dart';
import 'package:fe_lec_finalproject/controller/UserController.dart';
import 'package:fe_lec_finalproject/cui/cui_form_button.dart';
import 'package:fe_lec_finalproject/cui/cui_form_field.dart';
import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/page/admin/admin_main_page.dart';
import 'package:fe_lec_finalproject/page/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:animated_background/animated_background.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../class/feature.dart';
import '../debug_item_list.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> with TickerProviderStateMixin {
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
  TextEditingController unameCtrl = TextEditingController();
  TextEditingController pwordCtrl = TextEditingController();

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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 25),
                        child: Image.asset(
                          'assets/images/logo.png',
                          width: SizeConfig.widthByPercent(40),
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
                          "Welcome!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.widthByPercent(6),
                            fontWeight: FontWeight.w800,
                            color: Palette.black,
                          ),
                        ),
                      ),
                      CUIFormField(
                        controller: controller.email,
                        hintText: "Username",
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icons.person_rounded,
                        top: 15,
                      ),
                      CUIFormField(
                        controller: controller.pass,
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icons.visibility,
                        top: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {},
                            child: const Text(
                              "Forgot password",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Palette.dark,
                              ),
                            ),
                          ),
                        ),
                      ),
                      CUIFormButton(
                        text: "Login",
                        top: 20,
                        function: () {
                          if(controller.email.text != "" && controller.pass.text != ""){
                            UserController.instance.logInUser(controller.email.text.trim(), controller.pass.text.trim());
                          }
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //     type: PageTransitionType.rightToLeft,
                          //     duration: const Duration(milliseconds: 300),
                          //     child: ADMMainPage(
                          //       user: Debug.admin
                          //     ),
                          //   ),
                          // );
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account? ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Palette.dark,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageTransition(
                                    type: PageTransitionType.bottomToTop,
                                    duration: const Duration(milliseconds: 300),
                                    child: const RegisterPage(),
                                  ),
                                );
                              },
                              child: const Text(
                                "Register",
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Palette.accent,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
