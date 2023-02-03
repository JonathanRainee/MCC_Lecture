import 'package:fe_lec_finalproject/class/feature.dart';
import 'package:fe_lec_finalproject/class/order_header.dart';
import 'package:fe_lec_finalproject/page/order_view_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:page_transition/page_transition.dart';

import '../class/color_palette.dart';
import '../class/size_config.dart';
import '../class/user.dart';

class CUIOrderListView extends StatefulWidget {
  const CUIOrderListView(
      {super.key, required this.orderInfo, required this.user});
  final OrderHeader orderInfo;
  final UserModel user;

  @override
  State<CUIOrderListView> createState() => _CUIOrderListViewState();
}

class _CUIOrderListViewState extends State<CUIOrderListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextButton(
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 300),
              child: OrderViewPage(
                user: widget.user,
                order: widget.orderInfo,
              ),
            ),
          );
        },
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ),
        child: Container(
          width: SizeConfig.width! - 15,
          height: 80,
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
            color: Palette.light,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "#${widget.orderInfo.id}-${widget.orderInfo.index}",
                    style: const TextStyle(
                      color: Palette.dark,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Feature.duration(widget.orderInfo.lastUpdatedTS),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      OrderHeader.isDineIn(widget.orderInfo.typeId)
                          ? Icons.local_dining
                          : OrderHeader.isDelivery(widget.orderInfo.typeId)
                              ? Icons.delivery_dining_rounded
                              : Icons.inbox_rounded,
                      size: 16,
                      color: Palette.black,
                    ),
                  ),
                  Text(
                    OrderHeader.isDineIn(widget.orderInfo.typeId)
                        ? (widget.orderInfo.name != null)
                            ? "Table ${widget.orderInfo.tableNumber}: ${widget.orderInfo.name!}"
                            : "Table ${widget.orderInfo.tableNumber}"
                        : widget.orderInfo.name!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  OrderHeader.statusBar(widget.orderInfo.statusId),
                  Text(
                    Feature.getCurrency(widget.orderInfo.totalPrice),
                    style: const TextStyle(
                      color: Palette.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
