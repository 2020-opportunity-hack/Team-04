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
  int costPrice = 0;
  int salesPrice = 0;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

    List<InventoryItem> listOfItems = [];
    final fbInstance = FirebaseDatabase.instance
        .reference()
        .child("inventory")
        .child("deliverable_product");

    getInventoryRecords() async {
      await fbInstance.once().then((DataSnapshot snapshot) {
        Map<dynamic, dynamic> map = snapshot.value;
        for (var k in map.keys) {
          InventoryItem ic = new InventoryItem(map[k]["item_code"],
              map[k]["number_length"], map[k]["material"], map[k]["width"]);
          costPrice = costPrice +  int.parse(map[k]["number_length"]);
          salesPrice = salesPrice + int.parse(map[k]["width"]);
          listOfItems.add(ic);
        }
      });

      return listOfItems;
    }

    final heading = Container(
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 30.0),
      alignment: Alignment.center,
      child: Text(
        'All Inventory',
        textAlign: TextAlign.center,
        style: style.copyWith(
          fontSize: 22,
        ),
      ),
    );

    final columnNamesTextStyle =
        TextStyle(fontWeight: FontWeight.bold, fontSize: 18);
    final dataTextStyle =
        TextStyle(fontWeight: FontWeight.normal, fontSize: 16);

    final columnNames = Container(
      child: Row(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                child: Text('Item Code',
                    textAlign: TextAlign.center, style: columnNamesTextStyle),
              )),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                child: Text('QTY',
                    textAlign: TextAlign.center, style: columnNamesTextStyle),
              )),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                child: Text('Cost Price (Total)',
                    textAlign: TextAlign.center, style: columnNamesTextStyle),
              )),
          Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(left: 2, right: 2),
                child: Text('Sale Price (Total',
                    textAlign: TextAlign.center, style: columnNamesTextStyle),
              )),
        ],
      ),
    );

    return Scaffold(
        appBar: AppBar(
          title: Text('Payir - Thoorgayi'),
        ),
        body: FutureBuilder(
            future: getInventoryRecords(),
            builder: (context, AsyncSnapshot snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator());
              } else {
                return Center(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,

                        children: [
                          heading,
                          columnNames,
                          Divider(),
                          Container(
                              height: MediaQuery.of(context).size.height * 0.50,
                              child: ListView.builder(
                                  itemCount: listOfItems.length,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Container(
                                      color: index.isEven ? Colors.purple[100]: Colors.white,
                                      child: Row(children: <Widget>[
                                        Expanded(
                                            child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 5),
                                                child: Text(
                                                    listOfItems[index].itemCode,
                                                    textAlign: TextAlign.center,
                                                    style: dataTextStyle))),
                                        Expanded(
                                            child: Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 0,
                                                        vertical: 5),
                                                child: Text(
                                                    listOfItems[index].quantity,
                                                    textAlign: TextAlign.center,
                                                    style: dataTextStyle))),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 5),
                                            child: Text(
                                                listOfItems[index]
                                                    .costPrice
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: dataTextStyle),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 0, vertical: 5),
                                            child: Text(
                                                listOfItems[index]
                                                    .salesPrice
                                                    .toString(),
                                                textAlign: TextAlign.center,
                                                style: dataTextStyle),
                                          ),
                                        )
                                      ]),
                                    );
                                  })
                                  ),
                                  Container(child: Column(children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Total Cost Price: $costPrice',
                                      style: columnNamesTextStyle,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text('Total Sale Price: $salesPrice',
                                      style: columnNamesTextStyle,
                                      ),
                                    ),
                                  ],),),

                        ],
                      ),
                    ),
                  ),
                );
              }
            }));
  }
}

class InventoryItem {
  final String itemCode;
  final String quantity;
  final String costPrice;
  final String salesPrice;

  InventoryItem(this.itemCode, this.quantity, this.costPrice, this.salesPrice);
}
