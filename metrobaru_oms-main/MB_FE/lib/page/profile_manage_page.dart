import 'package:fe_lec_finalproject/controller/UserController.dart';
import 'package:fe_lec_finalproject/cui/cui_developer_information.dart';
import 'package:fe_lec_finalproject/cui/cui_manage_list_view.dart';
import 'package:fe_lec_finalproject/page/admin/admin_add_food.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

import '../class/color_palette.dart';
import '../class/feature.dart';
import '../class/size_config.dart';
import '../class/user.dart';

class ProfileManagePage extends StatefulWidget {
  const ProfileManagePage({super.key, required this.user});
  final UserModel user;
  

  @override
  State<ProfileManagePage> createState() => _ProfileManagePageState();
}

class _ProfileManagePageState extends State<ProfileManagePage> {
  final controller = Get.put(UserController());
  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height,
      width: SizeConfig.width,
      padding: const EdgeInsets.only(top: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 150, 25, 25),
              Color.fromARGB(255, 50, 0, 0),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0, 0.25]),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.heightByPercent(15),
            width: SizeConfig.widthByPercent(80),
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: (widget.user.profilePicturePath != null)
                        ? Image.network(
                            widget.user.profilePicturePath!,
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          )
                        : Image.asset(
                            'assets/images/UI/default profile picture.png',
                            height: 80,
                            width: 80,
                            fit: BoxFit.cover,
                          ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.user.username,
                          style: const TextStyle(
                            color: Palette.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 2),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 4,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Palette.white,
                          ),
                          child: Text(
                            widget.user.typeName,
                            style: const TextStyle(
                              color: Palette.accent,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Feature.elipsisLimitBy(widget.user.emailAddress, 30),
                          style: const TextStyle(
                            color: Palette.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          widget.user.phoneNumber,
                          style: const TextStyle(
                            color: Palette.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: double.infinity,
            height: SizeConfig.heightByPercent(82) - 90,
            decoration: const BoxDecoration(
                color: Palette.background,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 15),
                      padding: const EdgeInsets.all(10),
                      child: ListView(
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              "Account",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Palette.black,
                              ),
                            ),
                          ),
                          CUIManageListView(
                            function: () {},
                            icon: Icons.person,
                            title: "Edit Profile",
                            hint: "Change your personal informations",
                            warning: false,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          CUIManageListView(
                            function: () {},
                            icon: Icons.lock_rounded,
                            title: "Security settings",
                            hint: "Change your account security details",
                            warning: false,
                          ),
                          const Divider(
                            thickness: 1,
                          ),
                          CUIManageListView(
                            function: () {
                              controller.logout();
                            },
                            icon: Icons.logout_rounded,
                            title: "Logout",
                            hint: "Logout from your account",
                            warning: true,
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      visible: widget.user.typeId == 2,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                "Restaurant",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.black,
                                ),
                              ),
                            ),
                            CUIManageListView(
                              function: () {},
                              icon: Icons.store_rounded,
                              title: "Edit restaurant",
                              hint: "Change your resturant information",
                              warning: false,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            CUIManageListView(
                              function: () {},
                              icon: Icons.people_alt_rounded,
                              title: "Manage users",
                              hint: "Manage registered users on the app",
                              warning: false,
                            ),
                            const Divider(
                              thickness: 1,
                            ),
                            CUIManageListView(
                              function: () {},
                              icon: Icons.miscellaneous_services_rounded,
                              title: "Manage services",
                              hint: "Manage in-app services for customers",
                              warning: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: widget.user.typeId == 2,
                      child: Container(
                        margin: const EdgeInsets.only(top: 5),
                        width: double.infinity,
                        padding: const EdgeInsets.all(10),
                        child: ListView(
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                            const Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: Text(
                                "Menu",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Palette.black,
                                ),
                              ),
                            ),
                            CUIManageListView(
                              function: () {
                                // Get.off(() => const AddFoodPage());
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AddFoodPage()));
                              },
                              icon: Icons.menu_book_rounded,
                              title: "Manage items",
                              hint: "Manage menu items information",
                              warning: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 5),
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Palette.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const CUIDeveloperInformation(),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
