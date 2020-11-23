import 'package:flutter/material.dart';
import 'main.dart';
import 'package:firebase_database/firebase_database.dart';

class UpdateInventoryItem extends StatefulWidget {
  String itemK;
  @override
  _UpdateInventoryItemState createState() => _UpdateInventoryItemState();
}

class _UpdateInventoryItemState extends State<UpdateInventoryItem> {

  bool greenUnderLine = false;
  String quantity;
  String transportCost;
  String costPrice;
  String salesPrice;
  String itemKey;

  Map<dynamic, dynamic> itemCodes = {};
  Map<dynamic, dynamic> keyValue = {};
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final fbInstance = FirebaseDatabase.instance
        .reference()
        .child("inventory")
        .child("deliverable_product");

     getInventoryRecords() async {
       await fbInstance.once().then((DataSnapshot snapshot) {
         itemCodes = snapshot.value;
         for (var k in itemCodes.keys) {
           itemCodes.putIfAbsent(k, () => k["item_code"]);
//           print(k);
         }
       });
     }


    updateItem() {
       keyValue.forEach((key, value) {
         print(key + " " + value + " " + itemKey);
         fbInstance
             .child(itemKey)
             .update({key: value});
       });
      }

     getInventoryRecords();

      final heading = Padding(
        padding: const EdgeInsets.only(bottom: 20.0),
        child: Text(
          'Update Inventory Item',
          textAlign: TextAlign.center,
          style: style.copyWith(
            fontSize: 30,
          ),
        ),
      );

      final description = Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          'Input the Item Code to update Quantity',
          textAlign: TextAlign.center,
          style: style.copyWith(
            fontSize: 20,
          ),
        ),
      );

    final itemCodeInput = TextFormField(
        decoration: const InputDecoration(
            labelText: 'Enter an item code',
            errorText: "please enter item code",
//            focusedBorder: UnderlineInputBorder(
//              borderSide: BorderSide(color: Colors.green)
//            )
        ),
        onChanged: (String value) async {
          checkForCodeItem(value);
//        if(v)
//          border: new OutlineInputBorder(
//            borderSide: new BorderSide(color: Colors.green));
         },
        validator: (String value) {
          return value.contains('@') ? 'Do not use the @ char.' : null;
        },
      );

      final quantityInput = TextFormField(
        decoration: const InputDecoration(
          labelText: 'Enter Quantity',
        ),
        onChanged: (val) {
          setState(() {
            quantity = val;
            keyValue.update("quantity", (v) => quantity, ifAbsent: () => quantity);
          });
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a quantity';
          }
          if (int.parse(value) <= 0) {
            return 'Quantity must be greater than 0';
          }
          return null;
        },
      );

      final transportInput = TextFormField(
        decoration: const InputDecoration(
          labelText: 'Enter transport cost',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a cost';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            keyValue.update("transport_cost", (v) => val, ifAbsent: () => val);
          });
        },
      );

      final costInput = TextFormField(
        decoration: const InputDecoration(
          labelText: 'Enter cost price',
        ),
        onChanged: (val) {
          setState(() {
            keyValue.update("cost_price", (v) => val, ifAbsent: () => val);
          });
        },
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a cost';
          }
          return null;
        },
      );

      final saleInput = TextFormField(
        decoration: const InputDecoration(
          labelText: 'Enter sale price',
        ),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter a cost';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            keyValue.update("sale_price", (v) => val, ifAbsent: () => val);
          });
        },
      );

      final buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
      );

      final incrementButton = ElevatedButton(
        style: buttonStyle,
        onPressed: null,
        child: Text(
          "+",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

      final decrementButton = ElevatedButton(
        style: buttonStyle,
        onPressed: null,
        child: Text(
          "-",
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
      );

      final updateButton = ElevatedButton(
        onPressed: () {
//          Navigator.push(
//            context,
//            MaterialPageRoute(builder: (context) => MyHomePage()),
//          );
          updateItem();
        },
        child: Text("Update",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      );

      final backButton = ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        },
        child: Text("Back",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      );


      return Scaffold(
        appBar: AppBar(
          title: Text('Payir - Thoorgayi'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    heading,
                    description,
                    Form(
                      child: Column(
                        children: <Widget>[
                          itemCodeInput,
                          Row(
                            children: [
                              Expanded(child: quantityInput),
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 5.0, bottom: 5.0),
                                  child: incrementButton),
                              Container(
                                  padding: EdgeInsets.only(
                                      left: 10.0, top: 5.0, bottom: 5.0),
                                  child: decrementButton),
                            ],
                          ),
                          transportInput,
                          costInput,
                          saleInput,
                          SizedBox(
                            height: 35,
                          ),
                          updateButton,
                          SizedBox(
                            height: 35,
                          ),
                          backButton,
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
  }

  checkForCodeItem(String value) {
    print(value);
    itemCodes.forEach((k,v) =>
    {
      if(v["item_code"].compareTo(value) == 0){
        itemKey = k,
        print("Selected Item Code" + itemKey),
      }
    });
  }
}