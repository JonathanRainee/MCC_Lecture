import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:lecture_mcc/controller/FoodController.dart';
import 'package:lecture_mcc/model/food.dart';

class AddFood extends StatefulWidget {
  const AddFood({Key? key}) : super(key: key);

  @override
  State<AddFood> createState() => _AddFoodState();
}

class _AddFoodState extends State<AddFood> {

  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descController = TextEditingController();

  final controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello this is homepage'),
      ),
      body: Column(children: <Widget>[
        TextField(
          controller: controller.name,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'food name',
              hintText: 'food name'),
        ),
        TextField(
          controller: controller.price,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'food price',
              hintText: 'food price'),
        ),
        TextField(
          controller: controller.desc,
          obscureText: true,
          decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'food desc',
              hintText: 'food desc'),
        ),
        FlatButton(
              onPressed: (){
                //TODO FORGOT PASSWORD SCREEN GOES HERE
                Food food = controller.createFood(controller.name.text.trim(), int.parse(controller.price.text), controller.desc.text.trim());
                controller.addFood(food);
              },
              child: Text(
                'add food',
                style: TextStyle(color: Colors.blue, fontSize: 15),
              ),
            ),
      ],)
    );
  }
}