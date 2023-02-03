import 'item.dart';

class OrderDetails {
  final Item item;
  late int quantity;
  double price;
  bool ready;
  String? notes;

  OrderDetails({
    required this.item,
    required this.quantity,
    required this.price,
    required this.ready,
    this.notes,
  });
}
