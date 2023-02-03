import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/page/home_page.dart';
import 'package:fe_lec_finalproject/page/profile_manage_page.dart';
import 'package:fe_lec_finalproject/page/admin/admin_order_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../../class/item.dart';
import '../../class/user.dart';

class ADMMainPage extends StatefulWidget {
  const ADMMainPage({super.key, required this.user});
  final UserModel user;

  @override
  State<ADMMainPage> createState() => _ADMMainPageState();
}

class _ADMMainPageState extends State<ADMMainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      backgroundColor: Palette.white,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Image.asset(
          _selectedIndex == 1
              ? "assets/images/logo-text.png"
              : "assets/images/logo-text-white.png",
          height: 50,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(
          SizeConfig.widthByPercent(20),
          0,
          SizeConfig.widthByPercent(20),
          25,
        ),
        child: Container(
          alignment: Alignment.center,
          width: SizeConfig.widthByPercent(60),
          height: 43,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Palette.light,
            boxShadow: [
              BoxShadow(
                color: Palette.black.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 10,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: GNav(
              tabMargin: const EdgeInsets.symmetric(horizontal: 5),
              backgroundColor: Palette.light,
              activeColor: Palette.white,
              rippleColor: Palette.buffer,
              tabBackgroundColor: Palette.accent,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              gap: 5,
              curve: Curves.easeInExpo,
              duration: const Duration(milliseconds: 300),
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              tabs: const [
                GButton(
                  padding: EdgeInsets.all(5),
                  icon: Icons.home_rounded,
                  text: 'Home',
                ),
                GButton(
                  padding: EdgeInsets.all(5),
                  icon: Icons.soup_kitchen_rounded,
                  text: 'Order',
                ),
                GButton(
                  padding: EdgeInsets.all(5),
                  icon: Icons.person_rounded,
                  text: 'Manage',
                ),
              ],
            ),
          ),
        ),
      ),
      body: [
        HomePage(user: widget.user),
        ADMOrderListPage(user: widget.user),
        ProfileManagePage(user: widget.user),
      ].elementAt(_selectedIndex),
    );
  }
}
