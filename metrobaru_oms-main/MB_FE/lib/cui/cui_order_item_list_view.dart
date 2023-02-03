import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/feature.dart';
import '../class/size_config.dart';

class CUIOrderItemListView extends StatefulWidget {
  CUIOrderItemListView({super.key, required this.orderItem});
  OrderDetails orderItem;

  @override
  State<CUIOrderItemListView> createState() => _CUIOrderItemListViewState();
}

class _CUIOrderItemListViewState extends State<CUIOrderItemListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: SizedBox(
        width: SizeConfig.width! - 15,
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    widget.orderItem.item.imagePath,
                    height: 40,
                    width: 40,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.orderItem.item.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Palette.black,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "Quantity: ${widget.orderItem.quantity}",
                        style: const TextStyle(
                          fontSize: 14,
                          color: Palette.dark,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Checkbox(
              value: widget.orderItem.ready,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              activeColor: Palette.accent,
              onChanged: ((value) {
                setState(() {
                  widget.orderItem.ready = value!;
                });
              }),
            ),
          ],
        ),
      ),
    );
  }
}
