class Food {
  final String id;
  final String menuName;
  final String menuPrice;
  final String menuDesc;
  final String menuImage;

  // Food(this.id, this.menuName, this.menuPrice, this.menuDesc, this.menuImage);

  const Food({
    required this.id,
    required this.menuName,
    required this.menuPrice,
    required this.menuDesc,
    required this.menuImage,
  });

  toJson(){
    return{
      "id": id,
      "menuName": menuName,
      "menuDesc": menuDesc,
      "menuPrice": menuPrice,
      "menuimage": menuImage,
    };
  }
}