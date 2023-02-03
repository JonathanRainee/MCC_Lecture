import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';

class CUIFormField extends StatefulWidget {
  const CUIFormField(
      {super.key,
      required this.controller,
      required this.hintText,
      required this.keyboardType,
      required this.top,
      required this.suffixIcon});

  final TextEditingController controller;
  final TextInputType keyboardType;
  final String hintText;
  final double top;
  final IconData suffixIcon;

  @override
  State<CUIFormField> createState() => _CUIFormFieldState();
}

class _CUIFormFieldState extends State<CUIFormField> {
  Widget? iconSys;
  bool iconHidden = true;

  void _iconInit() {
    if (widget.suffixIcon == Icons.visibility) {
      iconSys = IconButton(
        icon: Icon(
          iconHidden == true ? Icons.visibility_off : Icons.visibility,
          color: Palette.dark,
        ),
        onPressed: () {
          setState(() {
            iconHidden == true ? iconHidden = false : iconHidden = true;
          });
        },
      );
    } else if (widget.suffixIcon == Icons.abc) {
      iconSys = Icon(
        widget.suffixIcon,
        color: Palette.light,
      );
      iconHidden = false;
    } else {
      iconSys = Icon(widget.suffixIcon, color: Palette.dark);
      iconHidden = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    _iconInit();
    return Padding(
      padding: EdgeInsets.only(top: widget.top),
      child: TextFormField(
        controller: widget.controller,
        style: const TextStyle(fontSize: 16),
        keyboardType: widget.keyboardType,
        obscureText: iconHidden,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              style: BorderStyle.none,
              width: 0,
            ),
          ),
          suffixIcon: iconSys,
          filled: true,
          fillColor: Palette.light,
        ),
      ),
    );
  }
}
