class Item {
  final int id;
  final String name;
  final int typeId;
  final String typeName;
  final double price;
  final String description;
  final String imagePath;
  final List<String> availabilityDate;

  Item({
    required this.id,
    required this.name,
    required this.typeId,
    required this.typeName,
    required this.price,
    required this.description,
    required this.imagePath,
    required this.availabilityDate,
  });

  static List<String> transformDay(List<int> day) {
    List<String> weekDay = [];
    if (day.contains(0)) {
      return [
        "Monday",
        "Tuesday",
        "Wenesday",
        "Thursday",
        "Friday",
        "Saturday",
        "Sunday"
      ];
    }
    if (day.contains(1)) {
      weekDay.add("Monday");
    }
    if (day.contains(2)) {
      weekDay.add("Tuesday");
    }
    if (day.contains(3)) {
      weekDay.add("Wenesday");
    }
    if (day.contains(4)) {
      weekDay.add("Thursday");
    }
    if (day.contains(5)) {
      weekDay.add("Friday");
    }
    if (day.contains(6)) {
      weekDay.add("Saturday");
    }
    if (day.contains(7)) {
      weekDay.add("Sunday");
    }
    return weekDay;
  }
}
