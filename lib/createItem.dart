import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ohack/createItemTwo.dart';
import 'package:easy_localization/easy_localization.dart';

class CreateInventoryItem extends StatefulWidget {
  @override
  _CreateInventoryItemState createState() => _CreateInventoryItemState();
}

class _CreateInventoryItemState extends State<CreateInventoryItem> {
  final fbInstance = FirebaseDatabase.instance.reference().child("inventory");
  String itemCode;
  String description;
  List<Object> materialTypes;

  final List<Widget> materialTypeList = [];
  String material = '';
  String numLen = '';
  String width = '';
  bool showFieldsEmpty = false;

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

    Widget createSectionContainer(List<Widget> children) {
      return Container(
        width: MediaQuery.of(context).size.width - 50,
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );
    }

    final heading = Container(
      margin: EdgeInsets.fromLTRB(5.0, 30.0, 20.0, 25.0),
      alignment: Alignment.center,
      child: Text(
        'Create_Inventory_Item',
        textAlign: TextAlign.center,
        style: style.copyWith(
          fontSize: 22,
        ),
      ).tr(),
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
            return 'Please enter a material';
          }
          // need to validate if item code exist
          return null;
        },
        onChanged: (val) {
          setState(() {
            materialTypes.add({'Material', val});
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
            materialTypes.add({'Length', val});
            // need debug : onchange is not printing for some reason
            print(val);
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
            materialTypes.add({'Width', val});
            width = val;
          });
        });

    final removeMaterialButton = Container(
      margin: EdgeInsets.only(top: 5),
      child: ElevatedButton(onPressed: () {}, child: Text('Remove')),
    );

    Widget _materialRow() {
      return Container(
        margin: EdgeInsets.only(top: 15, left: 5, right: 5),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.grey[200], width: 3),
            borderRadius: BorderRadius.circular(5)),
        child: Column(
          children: [
            materialTypeInput,
            numberLengthInput,
            widthInput,
            removeMaterialButton
          ],
        ),
      );
    }

    final emptyFieldError = Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text('Fill empty fields',
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.purple[600], fontWeight: FontWeight.normal)),
    );

    final addMaterialButton = ElevatedButton(
      onPressed: () {
        if (material.length == 0 || numLen.length == 0 || width.length == 0) {
          print('something still empty');
          setState(() {
            showFieldsEmpty = true;
          });
          return null;
        }
        showFieldsEmpty = false;
        setState(() {
          materialTypeList.add(_materialRow());
          material = '';
          numLen = '';
          width = '';
        });
      },
      child: Text("+ Add Material Type",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    if (materialTypeList.isEmpty) {
      materialTypeList.add(_materialRow());
    }

    final nextButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateInventoryItemTwo(
                    createSectionContainerfn: createSectionContainer,
                    itemCode: itemCode,
                    description: description,
                    materialTypes: materialTypes,
                  )),
        );
        // writeData();
      },
      child: Text("Next",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final backButton = ElevatedButton(
      onPressed: () {
        Navigator.pop(context);
      },
      child: Text("Back",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Payir - Thoorgayi'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 0.0),
            child: Column(
              children: [
                heading,
                Form(
                  child: ConstrainedBox(
                    constraints: new BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width - 50,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        createSectionContainer(
                            [itemCodeInput, itemDescriptionInput]),
                        createSectionContainer([
                          _customHeading('Material Type'),
                          Column(
                            children: materialTypeList,
                          ),
                          showFieldsEmpty ? emptyFieldError : SizedBox(),
                          Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: addMaterialButton),
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 25),
                                width: MediaQuery.of(context).size.width / 3,
                                child: nextButton),
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 25),
                                width: MediaQuery.of(context).size.width / 3,
                                child: backButton),
                          ],
                        ),
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

//   void writeData() {
//     fbInstance.child("deliverable_product").push().set({
//       "item_code": itemCode,
//       "material": material,
//       "number_length": numLen,
//       "width": width
//     });
//   }
}
