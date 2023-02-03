import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/size_config.dart';

class CUIOrderInfoListView extends StatefulWidget {
  const CUIOrderInfoListView(
      {super.key, required this.title, required this.information});
  final String title;
  final String information;

  @override
  State<CUIOrderInfoListView> createState() => _CUIOrderInfoListViewState();
}

class _CUIOrderInfoListViewState extends State<CUIOrderInfoListView> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: SizeConfig.widthByPercent(35),
          child: Text(
            widget.title,
            style: const TextStyle(
              fontSize: 16,
              color: Palette.black,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(
          width: SizeConfig.widthByPercent(50),
          child: Text(
            ": ${widget.information}",
            style: const TextStyle(
              fontSize: 16,
              color: Palette.black,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ],
    );
  }
}
