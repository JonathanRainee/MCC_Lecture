import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:intl/number_symbols_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'color_palette.dart';

class Feature {
  static String getGreetingByTime() {
    var dt = DateTime.now();
    if (dt.hour < 11) {
      return "Good morning";
    } else if (dt.hour < 18) {
      return "Good afternoon";
    } else {
      return "Good evening";
    }
  }

  static String elipsisLimitBy(String str, int length) {
    if (str.length > length) {
      return str.replaceRange(length - 3, null, "...");
    } else {
      return str;
    }
  }

  static Widget duration(int timestamp) {
    var current = DateTime.now();
    var start = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    var difference = current.difference(start);
    if (difference.inMinutes < 60) {
      int value = difference.inMinutes;
      String text;
      if (value == 1) {
        text = "just now";
      } else {
        text = "$value mins ago";
      }
      return Text(
        text,
        style: TextStyle(
          color: (value <= 30) ? Palette.dark : Palette.warning,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    } else if (difference.inHours < 24) {
      int value = difference.inHours;
      String text;
      if (value == 1) {
        text = "an hour ago";
      } else {
        text = "$value hours ago";
      }
      return Text(
        text,
        style: const TextStyle(
          color: Palette.error,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    } else {
      int value = difference.inHours;
      String text;
      if (value == 1) {
        text = "yesterday";
      } else {
        text = "$value days ago ";
      }
      return Text(
        text,
        style: const TextStyle(
          color: Palette.accent,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      );
    }
  }

  static String getDate(int timestamp) {
    var current = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    return DateFormat("EEEE, dd-MM-yyyy").format(current);
  }

  static String getTime(int timestamp) {
    var current = DateTime.fromMicrosecondsSinceEpoch(timestamp);
    return "${current.hour}:${current.minute}:${current.second} WIB";
  }

  static String getCurrency(double value) {
    return NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp ',
      decimalDigits: 2,
    ).format(value);
  }

  static Future<void> openGoogleMaps() async {
    String url =
        "https://www.google.com/maps/place/Rumah+Makan+Metro+Baru+Jambi/@-1.5909668,103.613358,17z/data=!3m1!4b1!4m5!3m4!1s0x2e2589207baabd85:0x32d25f97cd43fbff!8m2!3d-1.5910157!4d103.615567";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> openPhone() async {
    String url = "tel:074127845";
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url, mode: LaunchMode.externalApplication);
    } else {
      throw 'Could not launch $url';
    }
  }
}
