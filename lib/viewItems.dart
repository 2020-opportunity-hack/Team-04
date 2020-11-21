import 'dart:ffi';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:ohack/createItemTwo.dart';
import 'dart:developer';


class ViewItems extends StatefulWidget {
  @override
  _CreateInventoryItemState createState() => _CreateInventoryItemState();
}

class _CreateInventoryItemState extends State<ViewItems> {
  final fbInstance = FirebaseDatabase.instance.reference().child("inventory");

  final List<Widget> materialTypeList = [];

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

    final fbInstance = FirebaseDatabase.instance.reference().child("inventory").child("deliverable_product");
    List<InventoryItem> listOfItems = [
//      new InventoryItem("My","first","12.0","40.0")
    ];
    Map<dynamic, dynamic> childMap;
    fbInstance.once().then((DataSnapshot snapshot){


         print(snapshot.key);
         Map<dynamic, dynamic> map = snapshot.value;
         print(map.keys.length);

         for (var k in map.keys) {
           print("Key : $k, value : ${map[k]}");
           childMap = map[k];
           print(childMap.keys);
           print(childMap.values);
         }

           for(var m in childMap.keys) {
           listOfItems.add(new InventoryItem(childMap["item_code"], childMap["number_length"], childMap["material"], childMap["width"]));
         }

         print(listOfItems.length);
//
//         List<String> myList = map.values.toList();
//         myList.forEach((v)=>print(v[item_code])); //just an example

    });


    final heading = Container(
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 30.0),
      alignment: Alignment.center,
      child: Text(
        'View Inventory',
        textAlign: TextAlign.center,
        style: style.copyWith(
          fontSize: 22,
        ),
      ),
    );


    return Scaffold(
      appBar: AppBar(
        title: Text('Payir - Thoorgayi'),
      ),
      body: Center(
          child: Container(
                child :
                ListView.builder(
                    itemCount: listOfItems.length ,
                    itemBuilder: (context,index) {
                      return Row(
                        children : <Widget>[
                            Padding(padding: const EdgeInsets.all(8.0),
                          child: Text(listOfItems[index].itemCode)
                            ),
                          Padding(padding: const EdgeInsets.all(8.0),
                              child: Text(listOfItems[index].quantity)
                          ),
                          Padding(padding: const EdgeInsets.all(8.0),
                              child: Text(listOfItems[index].costPrice.toString())
                          ),
                          Padding(padding: const EdgeInsets.all(8.0),
                              child: Text(listOfItems[index].salesPrice.toString())
                          )
                        ]
                      );
//                        return Card(
//                          child: ListTile(
//                            onTap: () {},
//                              title: Text(listOfItems[index].itemCode),
//                          ),
//                        );
                    }
                ),
          ),
        ),
      );
  }
  void readData() {

    fbInstance.child("inventory").once().then((DataSnapshot data){
      print(data);
      print(data.key);
    });
  }
  }

class InventoryItem {
  final String itemCode;
  final String quantity;
  final String costPrice;
  final String salesPrice;

  InventoryItem(this.itemCode, this.quantity, this.costPrice, this.salesPrice);

}
