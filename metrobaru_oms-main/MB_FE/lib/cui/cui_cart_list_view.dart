import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/feature.dart';
import '../class/size_config.dart';
import 'cui_qty_button.dart';

class CUICartListView extends StatefulWidget {
  CUICartListView(
      {super.key,
      required this.order,
      required this.removeController,
      required this.qtyController});
  OrderDetails order;
  ValueChanged<OrderDetails> removeController;
  ValueChanged<OrderDetails> qtyController;

  @override
  State<CUICartListView> createState() => _CUICartListViewState();
}

class _CUICartListViewState extends State<CUICartListView> {
  TextEditingController qtyCtrl = TextEditingController();

  updateQty(double newPrice) {
    setState(() {
      widget.order.price = newPrice;
    });
  }

  @override
  Widget build(BuildContext context) {
    qtyCtrl.text = widget.order.quantity.toString();
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              widget.order.item.imagePath,
              height: 80,
              width: 80,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.order.item.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Palette.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${Feature.getCurrency(widget.order.item.price)} (x${widget.order.quantity})",
                  style: TextStyle(
                    fontSize: 12,
                    color: Palette.dark.withOpacity(0.6),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  Feature.getCurrency(widget.order.price),
                  style: const TextStyle(
                    fontSize: 14,
                    color: Palette.dark,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CUIQtyButton(
                      controller: qtyCtrl,
                      listener: widget.qtyController,
                      price: updateQty,
                      order: widget.order,
                    ),
                    Container(
                      height: 25,
                      padding: const EdgeInsets.only(left: 20),
                      child: TextButton(
                        onPressed: () {
                          widget.removeController(widget.order);
                        },
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.symmetric(horizontal: 6)),
                          backgroundColor:
                              const MaterialStatePropertyAll(Palette.accent),
                          shape: MaterialStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.delete_rounded,
                              size: 16,
                              color: Palette.white,
                            ),
                            Text(
                              " Remove from cart ",
                              style: TextStyle(
                                color: Palette.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
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
          )
        ],
      ),
    );
  }
}
