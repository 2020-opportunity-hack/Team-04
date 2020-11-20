import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'package:ohack/createItemTwo.dart';

class CreateInventoryItem extends StatefulWidget {
  @override
  _CreateInventoryItemState createState() => _CreateInventoryItemState();
}

class _CreateInventoryItemState extends State<CreateInventoryItem> {
  final fbInstance = FirebaseDatabase.instance.reference().child("inventory");
  String itemCode;
  String description;
  String material;
  String numLen;
  String width;

  final List<Widget> materialTypeList = [];

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

    Widget _customHeading(headingName) {
      return Container(
        margin: EdgeInsets.only(top: 15.0, bottom: 5.0),
        child: Text(
          headingName,
          textAlign: TextAlign.center,
          style: style.copyWith(
            fontSize: 18,
          ),
        ),
      );
    }

    final heading = Container(
      margin: EdgeInsets.fromLTRB(5.0, 15.0, 20.0, 30.0),
      alignment: Alignment.center,
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
        });

    final itemDescriptionInput = TextFormField(
        decoration: InputDecoration(labelText: 'Description'),
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
        });

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
        });

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
        });

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
    });

    Widget _materialRow() {
      return Column(
        children: [
          materialTypeInput,
          numberLengthInput,
          widthInput
        ],
      );
    }

    final addMaterialButton = ElevatedButton(
      onPressed: () {
        setState(() {
          materialTypeList.add(_materialRow());
        });
      },
      child: Text("+ Add Material Type",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    Widget materialListView = ListView.builder(
      itemCount: materialTypeList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return materialTypeList[index];
      },
    );

    final nextButton = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CreateInventoryItemTwo()),
          );
          writeData();
        },
        child: Text("Next",
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
        minWidth: MediaQuery.of(context).size.width,
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
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
            child: Column(
              children: [
                heading,
                Form(
                  child: ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxWidth: 300.0,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        itemCodeInput,
                        itemDescriptionInput,
                        _customHeading('Material Type'),
                        Column(children: [
                          _materialRow(),
                          materialListView,
                          ],
                        
                        ),
                        
                        Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: addMaterialButton),
                        SizedBox(
                          height: 35,
                        ),
                        nextButton,
                        SizedBox(
                          height: 35,
                        ),
                        backButton,
                      ],
                    ),
                  ),
                )
              ],
            ),
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
