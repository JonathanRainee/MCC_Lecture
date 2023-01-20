class Food{
  final String? id;
  final String name;
  final int price;
  final String description;

  const Food({
    this.id,
    required this.name,
    required this.price,
    required this.description
  });

  toJson(){
    return{
      "name": name,
      "price": price,
      "desc": description
    };
  }
}