import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:fe_lec_finalproject/cui/cui_form_button.dart';
import 'package:fe_lec_finalproject/cui/cui_form_dropdown.dart';
import 'package:fe_lec_finalproject/cui/cui_order_info_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/feature.dart';
import '../class/order_header.dart';
import '../class/user.dart';
import '../cui/cui_back_button_title.dart';
import '../cui/cui_order_item_list_view.dart';

class OrderViewPage extends StatefulWidget {
  OrderViewPage({super.key, required this.user, required this.order});
  final UserModel user;
  OrderHeader order;

  @override
  State<OrderViewPage> createState() => _OrderViewPageState();
}

class _OrderViewPageState extends State<OrderViewPage> {
  late ScrollController _scrollController;
  double _scrollControllerOffset = 0.0;

  _scrollListener() {
    setState(() {
      _scrollControllerOffset = _scrollController.offset;
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
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: (_scrollControllerOffset / 50).clamp(0, 3).toDouble(),
        backgroundColor: Palette.white,
        title: CUIBackBtnTitle(
          title: "Order",
          user: widget.user,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 90),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  OrderHeader.isDineIn(widget.order.typeId)
                      ? (widget.order.name != null)
                          ? "${widget.order.name}"
                          : "Table ${widget.order.tableNumber}"
                      : widget.order.name!,
                  style: const TextStyle(
                    fontSize: 28,
                    color: Palette.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                OrderHeader.statusBar(widget.order.statusId),
                const Divider(
                  thickness: 1,
                ),
                CUIOrderInfoListView(
                  title: "Order ID",
                  information: widget.order.id.toString(),
                ),
                CUIOrderInfoListView(
                  title: "Order number",
                  information: widget.order.index.toString(),
                ),
                CUIOrderInfoListView(
                  title: "Order type",
                  information: widget.order.typeName,
                ),
                CUIOrderInfoListView(
                  title: "Staff",
                  information: (widget.order.staff != null)
                      ? widget.order.staff!.username
                      : "Self service",
                ),
                const Divider(
                  thickness: 1,
                ),
                Visibility(
                  visible: OrderHeader.isDineIn(widget.order.typeId),
                  child: CUIOrderInfoListView(
                    title: "Table number",
                    information: OrderHeader.isDineIn(widget.order.typeId)
                        ? widget.order.tableNumber!.toString()
                        : "null",
                  ),
                ),
                Visibility(
                  visible: (OrderHeader.isDelivery(widget.order.typeId) ||
                      OrderHeader.isPickUp(widget.order.typeId)),
                  child: CUIOrderInfoListView(
                    title: "Recipient name",
                    information: (OrderHeader.isDelivery(widget.order.typeId) ||
                            OrderHeader.isPickUp(widget.order.typeId))
                        ? (widget.order.name != null)
                            ? widget.order.name!
                            : widget.order.user!.username
                        : "null",
                  ),
                ),
                Visibility(
                  visible: OrderHeader.isDelivery(widget.order.typeId),
                  child: CUIOrderInfoListView(
                    title: "Recipient address",
                    information: OrderHeader.isDelivery(widget.order.typeId)
                        ? widget.order.address!
                        : "null",
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                CUIOrderInfoListView(
                  title: "Order date",
                  information: Feature.getDate(widget.order.createdTS),
                ),
                CUIOrderInfoListView(
                  title: "Order time",
                  information: Feature.getTime(widget.order.createdTS),
                ),
                const Divider(
                  thickness: 1,
                ),
                const Text(
                  "Items :",
                  style: TextStyle(
                    fontSize: 16,
                    color: Palette.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: widget.order.items
                      .map((e) => CUIOrderItemListView(orderItem: e))
                      .toList(),
                ),
                const Divider(
                  thickness: 1,
                ),
                const Text(
                  "Total Price :",
                  style: TextStyle(
                    fontSize: 16,
                    color: Palette.black,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  Feature.getCurrency(widget.order.totalPrice),
                  style: const TextStyle(
                    fontSize: 28,
                    color: Palette.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Divider(
                  thickness: 1,
                ),
                Visibility(
                  visible: (widget.order.statusId < 7),
                  child: CUIFormButton(
                      text: OrderHeader.nextStatusName(widget.order),
                      top: 0,
                      function: () {
                        int nextId = OrderHeader.nextStatusId(widget.order);
                        setState(() {
                          widget.order.statusId = nextId;
                          widget.order.statusName =
                              OrderHeader.getStatusType(nextId);
                        });
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
