import 'package:another_flushbar/flushbar.dart';
import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/item.dart';
import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/order_header.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/cui/cui_back_button_title.dart';
import 'package:fe_lec_finalproject/cui/cui_cart_list_view.dart';
import 'package:fe_lec_finalproject/cui/cui_form_dropdown.dart';
import 'package:fe_lec_finalproject/cui/cui_form_field.dart';
import 'package:fe_lec_finalproject/cui/cui_item_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/feature.dart';
import '../class/user.dart';

class CartPage extends StatefulWidget {
  CartPage(
      {super.key,
      required this.user,
      required this.orderList,
      required this.listener,
      required this.totalPrice});
  final UserModel user;
  double totalPrice;
  List<OrderDetails> orderList = [];
  final ValueChanged<List<OrderDetails>> listener;

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
    });
  }

  List<OrderDetails> orderList = [];
  String orderType = "Dine-in";
  String infoType = "Fill manually";

  removeItem(OrderDetails? toBeRemoved) {
    if (toBeRemoved != null) {
      setState(() {
        orderList.remove(toBeRemoved);
      });
    }
    if (orderList.isEmpty) {
      Navigator.pop(context);
    }
    updatePrice();
  }

  updateQty(OrderDetails toBeUpdated) {
    for (OrderDetails i in orderList) {
      if (i.item == toBeUpdated.item) {
        i.quantity = toBeUpdated.quantity;
      }
    }
    updatePrice();
  }

  updatePrice() {
    setState(() {
      widget.totalPrice = 0;
      for (OrderDetails i in orderList) {
        widget.totalPrice += (i.item.price * i.quantity);
      }
    });
  }

  TextEditingController tnumCtrl = TextEditingController();
  TextEditingController nameCtrl = TextEditingController();
  TextEditingController adrsCtrl = TextEditingController();
  TextEditingController cntcCtrl = TextEditingController();
  UserModel? user;

  updateFormOrder(String newValue) {
    setState(() {
      orderType = newValue;
    });
  }

  updateFormInfo(String newValue) {
    setState(() {
      infoType = newValue;
    });
  }

  @override
  void initState() {
    _scrollController = ScrollController();
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    orderList = widget.orderList;
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: (_scrollControllerOffset / 50).clamp(0, 3).toDouble(),
        backgroundColor: Palette.white,
        title: CUIBackBtnTitle(
          title: "Cart",
          user: widget.user,
          parsePop: widget.listener,
          parseData: orderList,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CUIDropDown(
                      options: const ["Dine-in", "Delivery", "Pick-up"],
                      value: orderType,
                      title: "Order type:",
                      onChanged: updateFormOrder,
                      top: 0,
                      width: SizeConfig.widthByPercent(43),
                    ),
                    CUIDropDown(
                      options: const ["Fill manually", "From user"],
                      value: infoType,
                      title: "Customer info:",
                      onChanged: updateFormInfo,
                      top: 0,
                      width: SizeConfig.widthByPercent(43),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: (infoType == "Fill manually"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Column(
                    children: [
                      CUIFormField(
                        controller: nameCtrl,
                        hintText: "Customer name",
                        keyboardType: TextInputType.name,
                        top: 15,
                        suffixIcon: Icons.abc,
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: (orderType == "Dine-in"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CUIFormField(
                    controller: tnumCtrl,
                    hintText: "Table number",
                    keyboardType: TextInputType.name,
                    top: 15,
                    suffixIcon: Icons.abc,
                  ),
                ),
              ),
              Visibility(
                visible:
                    (orderType == "Delivery" && infoType == "Fill manually"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CUIFormField(
                    controller: adrsCtrl,
                    hintText: "Customer address",
                    keyboardType: TextInputType.name,
                    top: 15,
                    suffixIcon: Icons.abc,
                  ),
                ),
              ),
              Visibility(
                visible: ((orderType == "Pick-up" || orderType == "Delivery") &&
                    infoType == "Fill manually"),
                child: Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: CUIFormField(
                    controller: cntcCtrl,
                    hintText: "Customer contact",
                    keyboardType: TextInputType.emailAddress,
                    top: 15,
                    suffixIcon: Icons.abc,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: orderList
                      .map((e) => CUICartListView(
                            order: e,
                            qtyController: updateQty,
                            removeController: removeItem,
                          ))
                      .toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
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
                        Feature.getCurrency(widget.totalPrice),
                        style: const TextStyle(
                          color: Palette.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 24,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          OrderHeader(
                              id: 0,
                              index: 0,
                              items: orderList,
                              createdTS: DateTime.now().microsecondsSinceEpoch,
                              lastUpdatedTS:
                                  DateTime.now().microsecondsSinceEpoch,
                              totalPrice: widget.totalPrice,
                              typeId: OrderHeader.getOrderTypeId(orderType),
                              typeName: orderType,
                              statusId: 1,
                              statusName: "Cooking / Preparing",
                              staff: (widget.user.typeId == 2)
                                  ? widget.user
                                  : null);
                          // API: ADD ORDER
                          Navigator.pop(context); // Pop to menu
                          Navigator.pop(context); // Pop to order
                          Flushbar(
                            backgroundColor: Palette.success,
                            duration: const Duration(seconds: 3),
                            message: "Order added successfully!",
                          ).show(context);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Palette.white,
                          ),
                          child: const Text(
                            " Confirm Order ",
                            style: TextStyle(
                              color: Palette.accent,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
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
    );
  }
}
