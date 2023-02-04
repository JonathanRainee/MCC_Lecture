import 'package:fe_lec_finalproject/class/Food.dart';
import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/controller/FoodController.dart';
import 'package:fe_lec_finalproject/cui/cui_item_grid_view.dart';
import 'package:fe_lec_finalproject/page/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

import '../class/color_palette.dart';
import '../class/feature.dart';
import '../class/item.dart';
import '../class/user.dart';
import '../cui/cui_back_button_title.dart';
import '../debug_item_list.dart';

class MenuListPage extends StatefulWidget {
  const MenuListPage({super.key, required this.user});
  final UserModel user;

  @override
  State<MenuListPage> createState() => _MenuListPageState();
}

class _MenuListPageState extends State<MenuListPage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;


  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  final controller = Get.put(FoodController());
  List<OrderDetails> cart = [];
  List<Food> foodList = [];
  double totalPrice = 0.0;

  updateCart() {
    setState(() {
      totalPrice = 0;
      for (OrderDetails i in cart) {
        totalPrice += (i.item.price * i.quantity);
      }
    });
  }

  parseCartList(List<OrderDetails> newList) {
    setState(() {
      cart = newList;
    });
    updateCart();
  }

  addItem(OrderDetails? newOrder) {
    if (newOrder != null) {
      bool duplication = false;
      for (OrderDetails i in cart) {
        if (i.item == newOrder.item) {
          i.quantity += newOrder.quantity;
          i.price = i.quantity * i.item.price;
          duplication = true;
        }
      }
      if (!duplication) {
        cart.add(newOrder);
      }
    }
    updateCart();
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    controller.getAllFood();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: (_scrollControllerOffset / 50).clamp(0, 3).toDouble(),
        backgroundColor: Palette.white,
        title: CUIBackBtnTitle(
          quitConfirmation: cart.isNotEmpty,
          title: "Menu",
          user: widget.user,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 90,
              ),
              const Text(
                "Foods",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Palette.black,
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: ((SizeConfig.widthByPercent(50) - 25) /
                    (SizeConfig.widthByPercent(50) + 20)),
                children: Debug.itemListFoods
                    .map(
                      (e) => CUIItemGridView(
                        item: e,
                        listener: addItem,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Beverages",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Palette.black,
                ),
              ),
              GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.only(top: 10),
                shrinkWrap: true,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: ((SizeConfig.widthByPercent(50) - 25) /
                    (SizeConfig.widthByPercent(50) + 20)),
                children: Debug.itemListBeverages
                    .map(
                      (e) => CUIItemGridView(
                        item: e,
                        listener: addItem,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(
                height: 80,
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.fromLTRB(SizeConfig.widthByPercent(20), 0,
            SizeConfig.widthByPercent(20), 25),
        child: Visibility(
          visible: (cart.isNotEmpty),
          child: TextButton(
            style: ButtonStyle(
              padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            onPressed: (() async {
              await Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.rightToLeft,
                  duration: const Duration(milliseconds: 300),
                  child: CartPage(
                    user: widget.user,
                    totalPrice: totalPrice,
                    orderList: cart,
                    listener: parseCartList,
                  ),
                ),
              );
              await updateCart();
            }),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              height: 43,
              width: SizeConfig.widthByPercent(60),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Palette.black.withOpacity(0.25),
                    spreadRadius: 2,
                    blurRadius: 8,
                    offset: const Offset(0, 0),
                  ),
                ],
                gradient: const LinearGradient(
                  colors: [
                    Color.fromARGB(255, 150, 25, 25),
                    Color.fromARGB(255, 50, 0, 0),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    " ${Feature.getCurrency(totalPrice)}",
                    style: const TextStyle(
                      color: Palette.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_circle_right_rounded,
                    size: 30,
                    color: Palette.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
