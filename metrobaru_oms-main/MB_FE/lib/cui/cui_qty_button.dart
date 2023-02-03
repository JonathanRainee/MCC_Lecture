import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/order_details.dart';

class CUIQtyButton extends StatefulWidget {
  CUIQtyButton(
      {super.key,
      required this.controller,
      this.listener,
      this.order,
      this.price});
  TextEditingController controller;
  ValueChanged<OrderDetails>? listener;
  ValueChanged<double>? price;
  OrderDetails? order;

  @override
  State<CUIQtyButton> createState() => _CUIQtyButtonState();
}

class _CUIQtyButtonState extends State<CUIQtyButton> {
  @override
  Widget build(BuildContext context) {
    int qty = int.parse(widget.controller.text);
    return SizedBox(
      width: 80,
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
            width: 20,
            child: TextButton(
              onPressed: () {
                if (qty > 1) {
                  qty--;
                }
                if (widget.listener != null) {
                  widget.listener!(OrderDetails(
                    item: widget.order!.item,
                    price: widget.order!.price,
                    quantity: qty,
                    ready: widget.order!.ready,
                  ));
                  widget.price!(widget.order!.item.price * qty);
                }
                setState(() {
                  widget.controller.text = qty.toString();
                });
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Palette.accent),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
                alignment: Alignment.center,
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Icon(
                Icons.remove_rounded,
                size: 15,
                color: Palette.white,
              ),
            ),
          ),
          Text(
            widget.controller.text,
            style: const TextStyle(
              fontSize: 22,
              color: Palette.black,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 20,
            width: 20,
            child: TextButton(
              onPressed: () {
                qty++;
                if (widget.listener != null) {
                  widget.listener!(OrderDetails(
                    item: widget.order!.item,
                    price: widget.order!.item.price * qty,
                    quantity: qty,
                    ready: widget.order!.ready,
                  ));
                  widget.price!(widget.order!.item.price * qty);
                }
                setState(() {
                  widget.controller.text = qty.toString();
                });
              },
              style: ButtonStyle(
                backgroundColor: const MaterialStatePropertyAll(Palette.accent),
                padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
                alignment: Alignment.center,
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Icon(
                Icons.add_rounded,
                size: 15,
                color: Palette.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
