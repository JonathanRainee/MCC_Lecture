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
import 'customer/customer_main_page.dart';
import 'sign_in_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
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
  TextEditingController unameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController pwordCtrl = TextEditingController();
  TextEditingController pwcfCtrl = TextEditingController();

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
                          "Get Started!",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: SizeConfig.widthByPercent(6),
                            fontWeight: FontWeight.w800,
                            color: Palette.black,
                          ),
                        ),
                      ),
                      CUIFormField(
                        controller: controller.username,
                        hintText: "Username",
                        keyboardType: TextInputType.name,
                        suffixIcon: Icons.person_rounded,
                        top: 15,
                      ),
                      CUIFormField(
                        controller: controller.email,
                        hintText: "Email Address",
                        keyboardType: TextInputType.emailAddress,
                        suffixIcon: Icons.email_rounded,
                        top: 20,
                      ),
                      CUIFormField(
                        controller: controller.phoneNumber,
                        hintText: "Phone Number",
                        keyboardType: TextInputType.phone,
                        suffixIcon: Icons.phone_rounded,
                        top: 20,
                      ),
                      CUIFormField(
                        controller: controller.pass,
                        hintText: "Password",
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icons.visibility,
                        top: 20,
                      ),
                      CUIFormField(
                        controller: pwcfCtrl,
                        hintText: "Confirm Password",
                        keyboardType: TextInputType.visiblePassword,
                        suffixIcon: Icons.visibility,
                        top: 20,
                      ),
                      CUIFormButton(
                        text: "Register",
                        top: 20,
                        function: () {
                          if(controller.email.text != "" && controller.pass.text != ""){
                            UserController.instance.registerUser(controller.email.text.trim(), controller.pass.text.trim(), controller.username.text, controller.phoneNumber.text);
                          }
                          // Navigator.push(
                          //   context,
                          //   PageTransition(
                          //     type: PageTransitionType.rightToLeft,
                          //     duration: const Duration(milliseconds: 300),
                          //     child: CUSMainPage(user: Debug.admin),
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
                              "Already registered? ",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Palette.dark,
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                Get.offAll(() => const SignInPage());
                              },
                              child: const Text(
                                "Login",
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
