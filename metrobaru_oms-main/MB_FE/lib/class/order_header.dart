import 'package:fe_lec_finalproject/class/order_details.dart';
import 'package:fe_lec_finalproject/class/user.dart';
import 'package:flutter/cupertino.dart';
import 'color_palette.dart';

class OrderHeader {
  final int id; // ID untuk seluruh transaksi pada seluruh waktu
  final int
      index; // Index transaksi pada hari itu dimulai dari 0 setiap harinya
  final List<OrderDetails> items;
  final int createdTS;
  final int lastUpdatedTS;
  final double totalPrice;
  final int typeId;
  final String typeName;
  int statusId;
  String statusName;

  // Order reciever
  UserModel? staff;

  // For dine in
  int? tableNumber;

  // For delivery or pickup only
  String? name; // For non-application based order
  String? contactInfo; // For non-application based order
  UserModel? user; // For aplication based order
  String? address; // only delivery

  OrderHeader(
      {required this.id,
      required this.index,
      required this.items,
      required this.createdTS,
      required this.lastUpdatedTS,
      required this.totalPrice,
      required this.typeId,
      required this.typeName,
      required this.statusId,
      required this.statusName,
      this.staff,
      this.tableNumber,
      this.name,
      this.user,
      this.address,
      this.contactInfo});

  static bool isDineIn(int typeId) {
    if (typeId == 1) {
      return true;
    } else {
      return false;
    }
  }

  static bool isDelivery(int typeId) {
    if (typeId == 2) {
      return true;
    } else {
      return false;
    }
  }

  static bool isPickUp(int typeId) {
    if (typeId == 3) {
      return true;
    } else {
      return false;
    }
  }

  static int getOrderTypeId(String type) {
    switch (type) {
      case "Dine-in":
        return 1;
      case "Delivery":
        return 2;
      case "Pick-up":
        return 3;
      default:
        return 1;
    }
  }

  static List<String> statusNameList = [
    "Waiting for confirmation", // 1
    "Cooking / Preparing", // 2
    "Served all", // 3
    "Delivering / Delivered", // 4
    "Waiting to pick-up cutleries", // 5
    "Waiting for food pick-up", // 6
    "Finished / Paid", // 7
    "Cancelled", // 8
    "Undefined"
  ];

  static String getStatusType(int id) {
    if (statusNameList.length > id) {
      return statusNameList[id - 1];
    } else {
      return "Undefined";
    }
  }

  static String nextStatusName(OrderHeader order) {
    int current = order.statusId;
    if (current == 1) {
      return "Confirm order";
    } else if (order.typeId == 1) {
      if (current == 2) {
        return "Served all";
      } else if (current == 3) {
        return "Paid";
      }
    } else if (order.typeId == 2) {
      if (current == 2) {
        return "Deliver now";
      } else if (current == 4) {
        return "Cutleries picked-up";
      } else if (current == 5) {
        return "Paid";
      }
    } else if (order.typeId == 3) {
      if (current == 2) {
        return "Ready for pick-up";
      } else if (current == 6) {
        return "Paid";
      }
    }
    return "Undefined";
  }

  static int nextStatusId(OrderHeader order) {
    int current = order.statusId;
    if (current == 1) {
      return 2;
    } else if (order.typeId == 1) {
      if (current == 2) {
        return 3;
      } else if (current == 3) {
        return 7;
      }
    } else if (order.typeId == 2) {
      if (current == 2) {
        return 4;
      } else if (current == 4) {
        return 5;
      } else if (current == 5) {
        return 7;
      }
    } else if (order.typeId == 3) {
      if (current == 2) {
        return 6;
      } else if (current == 6) {
        return 7;
      }
    }
    return 9;
  }

  static Widget statusBar(int id) {
    String statusName;
    Color bgColor;
    switch (id) {
      case 1:
        statusName = getStatusType(id);
        bgColor = Palette.dark;
        break;
      case 2:
        statusName = getStatusType(id);
        bgColor = Palette.error;
        break;
      case 3:
        statusName = getStatusType(id);
        bgColor = Palette.success;
        break;
      case 4:
        statusName = getStatusType(id);
        bgColor = Palette.success;
        break;
      case 5:
        statusName = getStatusType(id);
        bgColor = Palette.warning;
        break;
      case 6:
        statusName = getStatusType(id);
        bgColor = Palette.success;
        break;
      case 7:
        statusName = getStatusType(id);
        bgColor = Palette.link;
        break;
      case 8:
        statusName = getStatusType(id);
        bgColor = Palette.accent;
        break;
      default:
        statusName = "Undefined";
        bgColor = Palette.black;
        break;
    }
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 5),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        statusName,
        style: const TextStyle(
          color: Palette.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
