import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../class/color_palette.dart';
import '../../class/size_config.dart';

class CUSOrderListPage extends StatefulWidget {
  const CUSOrderListPage({super.key});

  @override
  State<CUSOrderListPage> createState() => _CUSOrderListPageState();
}

class _CUSOrderListPageState extends State<CUSOrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 90, left: 25, right: 25),
      height: SizeConfig.height,
      width: SizeConfig.width,
      color: Palette.light,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Active Order",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Palette.black,
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Recent Order",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Palette.black,
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
