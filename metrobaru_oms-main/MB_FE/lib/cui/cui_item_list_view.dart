import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:fe_lec_finalproject/class/item.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/feature.dart';

class CUIItemListView extends StatefulWidget {
  const CUIItemListView({super.key, required this.item});
  final Item item;

  @override
  State<CUIItemListView> createState() => _CUIItemListViewState();
}

class _CUIItemListViewState extends State<CUIItemListView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: SizedBox(
        width: SizeConfig.width! - 15,
        height: 80,
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                widget.item.imagePath,
                height: 80,
                width: 80,
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
                    widget.item.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Palette.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    Feature.getCurrency(widget.item.price),
                    style: const TextStyle(
                      fontSize: 14,
                      color: Palette.dark,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    width: SizeConfig.width! - 140,
                    child: Text(
                      widget.item.description,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Palette.dark,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
