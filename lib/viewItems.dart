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

    List<InventoryItem> listOfItems = [];
    final fbInstance = FirebaseDatabase.instance.reference().child("inventory").child("deliverable_product");


    getInventoryRecords() async {
      await fbInstance.once().then((DataSnapshot snapshot){

        Map<dynamic, dynamic> map = snapshot.value;
        for (var k in map.keys) {
          InventoryItem ic = new InventoryItem(map[k]["item_code"],  map[k]["number_length"], map[k]["material"], map[k]["width"]);
          listOfItems.add(ic);
        }
      });

      return listOfItems;
    }

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
      body: FutureBuilder(
          future: getInventoryRecords(),
          builder:(context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            } else {
              return Container(
                  child: ListView.builder(
                      itemCount: listOfItems.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (BuildContext context, int index) {
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
                        );                      }
                  )
              );
            }
          }
      )
    );
  }
  }

class InventoryItem {
  final String itemCode;
  final String quantity;
  final String costPrice;
  final String salesPrice;

  InventoryItem(this.itemCode, this.quantity, this.costPrice, this.salesPrice);

}
