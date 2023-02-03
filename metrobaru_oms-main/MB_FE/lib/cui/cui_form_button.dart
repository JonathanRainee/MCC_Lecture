import 'package:fe_lec_finalproject/class/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CUIFormButton extends StatefulWidget {
  const CUIFormButton(
      {super.key,
      required this.text,
      required this.top,
      required this.function});
  final String text;
  final double top;
  final function;

  @override
  State<CUIFormButton> createState() => _CUIFormButtonState();
}

class _CUIFormButtonState extends State<CUIFormButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.top),
      child: TextButton(
        onPressed: widget.function,
        style: ButtonStyle(
          padding: const MaterialStatePropertyAll(EdgeInsets.all(0)),
          backgroundColor: const MaterialStatePropertyAll(Palette.accent),
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.red),
            ),
          ),
        ),
        child: Container(
          width: double.infinity,
          height: 50,
          alignment: Alignment.center,
          child: Text(
            widget.text,
            style: const TextStyle(
              color: Palette.white,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
