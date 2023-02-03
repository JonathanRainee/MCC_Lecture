import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/order_header.dart';
import 'package:fe_lec_finalproject/cui/cui_order_list_view.dart';
import 'package:fe_lec_finalproject/page/cart_page.dart';
import 'package:fe_lec_finalproject/page/menu_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../../class/item.dart';
import '../../class/size_config.dart';
import '../../class/user.dart';
import '../../debug_item_list.dart';

class ADMOrderListPage extends StatefulWidget {
  const ADMOrderListPage({super.key, required this.user});
  final UserModel user;

  @override
  State<ADMOrderListPage> createState() => _ADMOrderListPageState();
}

class _ADMOrderListPageState extends State<ADMOrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90),
      height: SizeConfig.height,
      width: SizeConfig.width,
      color: Palette.background,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: const LinearGradient(
                      colors: [
                        Color.fromARGB(255, 150, 25, 25),
                        Color.fromARGB(255, 50, 0, 0),
                      ],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: TextButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Icon(
                          Icons.add_circle_outline_rounded,
                          size: 24,
                          color: Palette.white,
                        ),
                        Text(
                          " Add order",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Palette.white,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeft,
                          duration: const Duration(milliseconds: 300),
                          child: MenuListPage(user: widget.user),
                        ),
                      );
                    },
                  ),
                ),
              ),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                padding: const EdgeInsets.only(top: 15),
                children: Debug.orderList
                    .map((e) => CUIOrderListView(
                          orderInfo: e,
                          user: widget.user,
                        ))
                    .toList(),
              ),
              const SizedBox(
                height: 80,
              )
            ],
          ),
        ),
      ),
    );
  }
}
