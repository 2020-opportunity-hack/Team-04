import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class CreateInventoryItem extends StatefulWidget {
  @override
  _CreateInventoryItemState createState() => _CreateInventoryItemState();
}

class _CreateInventoryItemState extends State<CreateInventoryItem> {

  final fbInstance = FirebaseDatabase.instance.reference().child("inventory");
  String itemCode;
  String material;
  String numLen;
  String width;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final heading = Container(
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 30.0),
      alignment: new FractionalOffset(0.2, -0.05),
      child: Text(
        'Create Inventory Item',
        textAlign: TextAlign.center,
        style: style.copyWith(
          fontSize: 22,
        ),
      ),
    );

    final itemCodeInput = TextFormField(
        decoration: InputDecoration(labelText: 'Item Code'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter an item code';
          }
          // need to validate if item code exist
          return null;
        },
        onChanged: (val) {
          setState(() {
            itemCode = val;
          });
        }
    );

    final materialTypeInput = TextFormField(
        decoration: InputDecoration(labelText: 'Material'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter an material';
          }
          // need to validate if item code exist
          return null;
        },
        onChanged: (val) {
          setState(() {
            material = val;
          });
        }
    );

    final numberLengthInput = TextFormField(
        decoration: InputDecoration(labelText: 'Number / Length:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter Number / Length';
          }
          // need to validate if item code exist
          return null;
        },
        onChanged: (val) {
          setState(() {
            numLen = val;
          });
        }
    );

    final widthInput = TextFormField(
        decoration: InputDecoration(labelText: 'Width:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter width';
          }
          // need to validate if item code exist
          return null;
        },
        onChanged: (val) {
          setState(() {
            width = val;
          });
        }
    );

    final buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey));

    final createButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          writeData();
        },
        child: Text("Create",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final backButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery
            .of(context)
            .size
            .width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
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
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Payir - Thoorgayi'),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
          child: Column(
            children: [
              heading,
              Form(
                child: Column(
                  children: <Widget>[
                    Row(
                      children: [
                        Expanded(child: itemCodeInput),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: materialTypeInput),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: numberLengthInput),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(child: widthInput),
                      ],
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    createButton,
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
    );
  }
  void writeData() {
    fbInstance.child("deliverable_product").push().set({
      "item_code": itemCode,
      "material": material,
      "number_length": numLen,
      "width": width
    });
  }
}
