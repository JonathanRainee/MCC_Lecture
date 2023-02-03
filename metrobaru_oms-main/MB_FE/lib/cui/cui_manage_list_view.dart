import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CUIManageListView extends StatefulWidget {
  const CUIManageListView({
    super.key,
    required this.icon,
    required this.title,
    required this.hint,
    required this.function,
    required this.warning,
  });
  final IconData icon;
  final String title;
  final String hint;
  final function;
  final bool warning;

  @override
  State<CUIManageListView> createState() => _CUIManageListViewState();
}

class _CUIManageListViewState extends State<CUIManageListView> {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: widget.function,
      style: const ButtonStyle(
        padding: MaterialStatePropertyAll(
          EdgeInsets.zero,
        ),
      ),
      child: Row(
        children: [
          Icon(
            widget.icon,
            size: 30,
            color: widget.warning ? Palette.error : Palette.black,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.warning ? Palette.error : Palette.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
                Text(
                  widget.hint,
                  style: TextStyle(
                    color: widget.warning ? Palette.error : Palette.dark,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
