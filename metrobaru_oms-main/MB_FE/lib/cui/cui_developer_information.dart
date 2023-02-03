import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../class/color_palette.dart';

class CUIDeveloperInformation extends StatefulWidget {
  const CUIDeveloperInformation({super.key});

  @override
  State<CUIDeveloperInformation> createState() =>
      _CUIDeveloperInformationState();
}

class _CUIDeveloperInformationState extends State<CUIDeveloperInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        Text(
          "Developer informations",
          style: TextStyle(
            color: Palette.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          "As a part of Bina Nusantara University students and in order to fullfil our term 3 (2023) final project tasks,"
          "we developed this order management system application for Rumah Makan Metro Baru Pasar Jambi.",
          style: TextStyle(
            color: Palette.dark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "Developers:",
          style: TextStyle(
            color: Palette.dark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "• 2540124785 - Alfrid Sanjaya Leo Putra",
          style: TextStyle(
            color: Palette.dark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "• 2540115225 - Calvin Anacia Suciawan",
          style: TextStyle(
            color: Palette.dark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(
          "• 2540124854 - Jonathan Raine Wiranata",
          style: TextStyle(
            color: Palette.dark,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
