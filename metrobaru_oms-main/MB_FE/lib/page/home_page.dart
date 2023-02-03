import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/feature.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/cui/cui_item_list_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/item.dart';
import '../class/user.dart';
import '../debug_item_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.user});
  final UserModel user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double todayIncome = 0;
  int todayTotalOrder = 0;
  int todayOnGoingOrder = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90),
      height: SizeConfig.height,
      width: SizeConfig.width,
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
          Padding(
            padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
            child: Container(
              width: double.infinity,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: Palette.black.withOpacity(0.25),
                    spreadRadius: 0,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              padding: EdgeInsets.zero,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: widget.user.profilePicturePath != null
                          ? Image.network(
                              widget.user.profilePicturePath!,
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            )
                          : Image.asset(
                              'assets/images/UI/default cover picture.jpeg',
                              height: 150,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                    ),
                    Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: const [
                            Color.fromARGB(255, 227, 172, 71),
                            Color.fromARGB(255, 146, 111, 52),
                            Color.fromARGB(255, 20, 15, 3),
                            Color.fromARGB(0, 0, 0, 0),
                          ],
                          stops: [
                            0,
                            ((SizeConfig.width! - 150) / SizeConfig.width!) / 3,
                            ((SizeConfig.width! - 150) / SizeConfig.width!),
                            1,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${Feature.getGreetingByTime()},",
                              style: const TextStyle(
                                fontSize: 22,
                                color: Palette.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.user.username,
                              style: const TextStyle(
                                fontSize: 28,
                                color: Palette.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: SizeConfig.height! - 235,
            decoration: const BoxDecoration(
              color: Palette.background,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Visibility(
                      // For User
                      visible: widget.user.typeId == 1,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: (SizeConfig.width! / 2) - 32.5,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Palette.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Feature.openGoogleMaps();
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/UI/google maps bg.jpg',
                                          height: 70,
                                          width: (SizeConfig.width! / 2) - 32.5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: (SizeConfig.width! / 2) - 32.5,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 50, 0, 0),
                                                Color.fromARGB(
                                                    255, 150, 25, 25),
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: [0, 0.4, 1]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Find Us",
                                                  style: TextStyle(
                                                      color: Palette.white,
                                                      fontSize: SizeConfig
                                                          .widthByPercent(5),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "Here!",
                                                  style: TextStyle(
                                                      color: Palette.white,
                                                      fontSize: SizeConfig
                                                          .widthByPercent(6),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Image.asset(
                                                'assets/images/UI/google maps icon.jpeg',
                                                height: 50,
                                                width: 50,
                                                fit: BoxFit.cover,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                width: (SizeConfig.width! / 2) - 32.5,
                                height: 70,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Palette.black.withOpacity(0.5),
                                      spreadRadius: 1,
                                      blurRadius: 4,
                                      offset: const Offset(1, 1),
                                    ),
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Feature.openPhone();
                                  },
                                  child: Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.asset(
                                          'assets/images/UI/phone bg.jpg',
                                          height: 70,
                                          width: (SizeConfig.width! / 2) - 32.5,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: (SizeConfig.width! / 2) - 32.5,
                                        height: 70,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              colors: [
                                                Color.fromARGB(255, 50, 0, 0),
                                                Color.fromARGB(
                                                    255, 150, 25, 25),
                                                Colors.transparent,
                                              ],
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomRight,
                                              stops: [0, 0.4, 1]),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Call Us",
                                                  style: TextStyle(
                                                      color: Palette.white,
                                                      fontSize: SizeConfig
                                                          .widthByPercent(5),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                Text(
                                                  "Here!",
                                                  style: TextStyle(
                                                      color: Palette.white,
                                                      fontSize: SizeConfig
                                                          .widthByPercent(6),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              child: Container(
                                                height: 50,
                                                width: 50,
                                                color: Palette.white,
                                                alignment: Alignment.center,
                                                child: Image.asset(
                                                  'assets/images/UI/phone icon.jpg',
                                                  height: 40,
                                                  width: 40,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Visibility(
                      // For Admin
                      visible: widget.user.typeId == 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.attach_money_rounded,
                                size: 24,
                                color: Palette.black,
                              ),
                              Text(
                                "Today's income",
                                style: TextStyle(
                                  color: Palette.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Rp$todayIncome",
                            style: const TextStyle(
                              color: Palette.black,
                              fontSize: 28,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: (SizeConfig.width! / 2) - 32.5,
                                  decoration: BoxDecoration(
                                    color: Palette.light,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.soup_kitchen_rounded,
                                            size: 18,
                                            color: Palette.black,
                                          ),
                                          Text(
                                            " Ongoing order",
                                            style: TextStyle(
                                              color: Palette.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "$todayOnGoingOrder",
                                        style: const TextStyle(
                                          color: Palette.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: (SizeConfig.width! / 2) - 32.5,
                                  decoration: BoxDecoration(
                                    color: Palette.light,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: const [
                                          Icon(
                                            Icons.fastfood_rounded,
                                            size: 18,
                                            color: Palette.black,
                                          ),
                                          Text(
                                            " Total order",
                                            style: TextStyle(
                                              color: Palette.black,
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        "$todayTotalOrder",
                                        style: const TextStyle(
                                          color: Palette.black,
                                          fontSize: 24,
                                          fontWeight: FontWeight.w800,
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
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Column(
                        children: [
                          Row(
                            children: const [
                              Icon(
                                Icons.menu_book_rounded,
                                size: 24,
                                color: Palette.black,
                              ),
                              Text(
                                " Today's speciality dish",
                                style: TextStyle(
                                  color: Palette.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: ListView(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                children: Debug.itemListFoods
                                    .map((e) => CUIItemListView(item: e))
                                    .toList()),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
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
