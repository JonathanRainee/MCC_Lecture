import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';

class CUIDropDown extends StatefulWidget {
  CUIDropDown(
      {super.key,
      required this.value,
      required this.options,
      required this.top,
      required this.width,
      this.title,
      this.onChanged});

  final List<String> options;
  String value;
  String? title;
  final double top;
  final double width;
  Function? onChanged;

  @override
  State<CUIDropDown> createState() => _CUIDropDownState();
}

class _CUIDropDownState extends State<CUIDropDown> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.top),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: (widget.title != null),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 2),
              child: Text(
                widget.title!,
                style: const TextStyle(
                  fontSize: 14,
                  color: Palette.dark,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          Container(
            height: 35,
            width: widget.width,
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              gradient: const LinearGradient(
                colors: [
                  Color.fromARGB(255, 150, 25, 25),
                  Color.fromARGB(255, 50, 0, 0),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: DropdownButton(
              hint: Text(
                widget.value,
                style: const TextStyle(
                  fontSize: 16,
                  color: Palette.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              underline: Container(),
              dropdownColor: Palette.white,
              icon: const Icon(
                Icons.arrow_drop_down_circle_rounded,
                color: Palette.white,
                size: 20,
              ),
              isExpanded: true,
              elevation: 3,
              borderRadius: BorderRadius.circular(25),
              items: widget.options
                  .map((e) => DropdownMenuItem(
                        value: e,
                        child: Text(
                          e,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 16,
                            color: Palette.black,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ))
                  .toList(),
              onChanged: (value) {
                if (widget.onChanged != null) {
                  widget.onChanged!(value);
                }
                setState(() {
                  widget.value = value.toString();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
