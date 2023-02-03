import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/size_config.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';
import '../class/user.dart';

class CUIBackBtnTitle extends StatelessWidget {
  CUIBackBtnTitle(
      {super.key,
      required this.title,
      required this.user,
      this.quitConfirmation,
      this.parsePop,
      this.parseData});
  final String title;
  final UserModel user;
  bool? quitConfirmation;
  ValueChanged<List<OrderDetails>>? parsePop;
  List<OrderDetails>? parseData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {
            if (quitConfirmation != null && quitConfirmation == true) {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(
                      "Are you sure you want to leave this page?",
                      style: TextStyle(
                        color: Palette.black,
                        fontSize: SizeConfig.widthByPercent(5),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    content: const Text(
                      "WARNING! You have an unfinished order. Press Cancel to stay on this page and finish the order by pressing the red button below, or Proceed to continue leaving the page.",
                      style: TextStyle(
                        color: Palette.dark,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text(
                          'Proceed',
                          style: TextStyle(
                            color: Palette.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text(
                          'Cancel',
                          style: TextStyle(
                            color: Palette.error,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                },
              );
            } else {
              if (parsePop != null) {
                if (parseData != null) {
                  parsePop!(parseData!);
                } else {
                  parsePop!([]);
                }
              }
              Navigator.pop(context);
            }
          },
          style: const ButtonStyle(
            padding: MaterialStatePropertyAll(EdgeInsets.all(0)),
          ),
          child: Container(
            width: SizeConfig.widthByPercent(20),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.arrow_back_ios_rounded,
                      size: 22,
                      color: Palette.black,
                    ),
                    Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Palette.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w800,
            color: Palette.black,
          ),
        ),
        Container(
          width: SizeConfig.widthByPercent(20),
          alignment: Alignment.centerRight,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: (user.profilePicturePath != null)
                ? Image.network(
                    user.profilePicturePath!,
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  )
                : Image.asset(
                    'assets/images/UI/default profile picture.png',
                    height: 35,
                    width: 35,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ],
    );
  }
}
