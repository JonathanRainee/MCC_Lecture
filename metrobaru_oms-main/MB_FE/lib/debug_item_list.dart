import 'package:fe_lec_finalproject/class/item.dart';
import 'package:fe_lec_finalproject/class/order_header.dart';
import 'package:fe_lec_finalproject/class/user.dart';

import 'class/order_details.dart';

class Debug {
  static UserModel admin = UserModel(
    id: 1.toString(),
    typeId: 2,
    typeName: "admin",
    username: "minjikim",
    emailAddress: "nwjnsminji@gmail.com",
    phoneNumber: "+6282183928088",
    accountCreationDate: "accountCreationDate",
    profilePicturePath:
        "https://www.allkpop.com/upload/2022/08/content/101514/1660158879-untitled-1.jpg",
  );

  static List<UserModel> dummyUser = [
    UserModel(
      id: 2.toString(),
      typeId: 1,
      typeName: "customer",
      username: "calvin03",
      emailAddress: "calvinanacia123@gmail.com",
      phoneNumber: "+6282112341242",
      accountCreationDate: "accountCreationDate",
    ),
    UserModel(
      id: 3.toString(),
      typeId: 1,
      typeName: "customer",
      username: "alfridsans",
      emailAddress: "alfridsanjayaleoputra@rocketmail.com",
      phoneNumber: "+6282183678923",
      accountCreationDate: "accountCreationDate",
    ),
    UserModel(
      id: 4.toString(),
      typeId: 1,
      typeName: "customer",
      username: "raineonme",
      emailAddress: "rainejo.09@outlook.com",
      phoneNumber: "+6282534268923",
      accountCreationDate: "accountCreationDate",
      profilePicturePath:
          "https://assets.pikiran-rakyat.com/crop/0x0:0x0/x/photo/2021/12/26/2206998485.jpg",
    ),
  ];

  static List<Item> itemListFoods = [
    Item(
      id: 1,
      name: "Bak Kut Teh",
      typeId: 1,
      typeName: "Food",
      price: 52000,
      description:
          "Bak kut teh is a pork rib dish cooked in broth popularly served in Malaysia and Singapore where there is a predominant Hoklo and Teochew community.",
      imagePath:
          "https://citynomads.com/wp-content/uploads/2021/07/Ng-Ah-Sio-02-1024x838.png",
      availabilityDate: Item.transformDay([0]),
    ),
    Item(
      id: 2,
      name: "Nasi Tim",
      typeId: 1,
      typeName: "Food",
      price: 22000,
      description:
          "Nasi tim is an Indonesian steamed chicken rice. In Indonesian language nasi means (cooked) rice and tim means steam. The ingredients are chicken, mushroom and hard boiled egg.",
      imagePath:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/2/24/Nasi_Tim_Ayam_in_Jakarta.jpg/420px-Nasi_Tim_Ayam_in_Jakarta.jpg",
      availabilityDate: Item.transformDay([1, 3, 5]),
    ),
    Item(
      id: 3,
      name: "Bihun Bebek",
      typeId: 1,
      typeName: "Food",
      price: 36000,
      description:
          "Bihun bebek secara umum adalah bihun kuah dengan topping daging bebek suwir yang dinikmati dengan taburan bawang goreng dan minyak bawang yang gurih.",
      imagePath:
          "https://cdn2.tstatic.net/tribunnewswiki/foto/bank/images/Ilustrasi-bihun-bebek-khas-Medan2.jpg",
      availabilityDate: Item.transformDay([1, 3, 5]),
    ),
  ];

  static List<Item> itemListBeverages = [
    Item(
      id: 4,
      name: "Iced Tea",
      typeId: 2,
      typeName: "Beverages",
      price: 8000,
      description: "Sariwangi with ice",
      imagePath:
          "https://dcostseafood.id/wp-content/uploads/2021/12/Es-teh-tawar-manis.jpg",
      availabilityDate: Item.transformDay([0]),
    ),
  ];

  static List<OrderHeader> orderList = [
    OrderHeader(
        id: 1,
        index: 1,
        items: [
          OrderDetails(
            item: itemListFoods[0],
            quantity: 2,
            price: itemListFoods[0].price * 2,
            ready: false,
          )
        ],
        lastUpdatedTS: 1674641009581164,
        createdTS: 1674641009581164,
        totalPrice: itemListFoods[0].price * 2,
        typeId: 1,
        typeName: "Dine-in",
        tableNumber: 1,
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
    OrderHeader(
        id: 2,
        index: 2,
        items: [
          OrderDetails(
            item: itemListFoods[1],
            quantity: 3,
            price: itemListFoods[1].price * 3,
            ready: true,
          ),
          OrderDetails(
            item: itemListFoods[2],
            quantity: 1,
            price: itemListFoods[2].price * 1,
            ready: false,
          )
        ],
        lastUpdatedTS: 1674641009581164,
        createdTS: 1674641009581164,
        totalPrice: itemListFoods[1].price * 3 + itemListFoods[2].price * 1,
        typeId: 1,
        typeName: "Dine-in",
        tableNumber: 4,
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
    OrderHeader(
        id: 3,
        index: 3,
        items: [
          OrderDetails(
            item: itemListFoods[2],
            quantity: 1,
            price: itemListFoods[2].price * 1,
            ready: true,
          ),
        ],
        lastUpdatedTS: 1674278941,
        createdTS: 1674268541,
        totalPrice: itemListFoods[2].price * 1,
        typeId: 2,
        typeName: "Delivery",
        name: "Sumber Teknik",
        address: "Jl. M. Roem No. 39",
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
    OrderHeader(
        id: 4,
        index: 4,
        items: [
          OrderDetails(
            item: itemListFoods[2],
            quantity: 1,
            price: itemListFoods[2].price * 1,
            ready: false,
          ),
        ],
        lastUpdatedTS: 1674641008581164,
        createdTS: 1674641008581164,
        totalPrice: itemListFoods[2].price * 1,
        typeId: 3,
        typeName: "Pick-up",
        name: "Go Yoon Jung",
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
    OrderHeader(
        id: 5,
        index: 5,
        items: [
          OrderDetails(
            item: itemListFoods[0],
            quantity: 2,
            price: itemListFoods[0].price * 2,
            ready: false,
          ),
        ],
        lastUpdatedTS: 1674631009581164,
        createdTS: 1674631009581164,
        totalPrice: itemListFoods[0].price * 2,
        typeId: 2,
        typeName: "Delivery",
        address:
            "Jl. H. Adam Malik, Perumahan Citra Beringin Regency Blok F No 12",
        name: "Sumber Cahaya",
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
    OrderHeader(
        id: 6,
        index: 6,
        items: [
          OrderDetails(
            item: itemListFoods[0],
            quantity: 2,
            price: itemListFoods[0].price * 2,
            ready: true,
          ),
          OrderDetails(
            item: itemListFoods[1],
            quantity: 2,
            price: itemListFoods[1].price * 2,
            ready: true,
          ),
        ],
        lastUpdatedTS: 1674278941,
        createdTS: 1674268541,
        totalPrice: itemListFoods[0].price * 2 + itemListFoods[1].price * 2,
        typeId: 1,
        typeName: "Dine-in",
        tableNumber: 3,
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
    OrderHeader(
        id: 7,
        index: 7,
        items: [
          OrderDetails(
            item: itemListFoods[2],
            quantity: 1,
            price: itemListFoods[2].price * 1,
            ready: false,
          ),
          OrderDetails(
            item: itemListFoods[1],
            quantity: 2,
            price: itemListFoods[1].price * 2,
            ready: false,
          ),
        ],
        lastUpdatedTS: 1674641009581164,
        createdTS: 1674641009581164,
        totalPrice: itemListFoods[2].price * 1 + itemListFoods[1].price * 2,
        typeId: 2,
        typeName: "Delivery",
        tableNumber: 3,
        name: "Haerin",
        address: "Jl. H.Adam Malik CBR F12",
        statusId: 1,
        statusName: OrderHeader.getStatusType(1),
        staff: admin),
  ];
}
