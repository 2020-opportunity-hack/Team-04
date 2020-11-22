import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:ohack/inventoryMenu.dart';

class CreateItemSummary extends StatefulWidget {
  final String itemCode;
  final String description;
  final List<Object> materialTypes;
  final String cutting;
  final String stitching;
  final String other;
  final String transportCost;
  final String costPrice;
  final String salePrice;
  final List<Object> otherFieldValue;

  final Function createSectionContainer;
  const CreateItemSummary(
      {Key key,
      this.itemCode,
      this.description,
      this.materialTypes,
      this.cutting,
      this.stitching,
      this.other,
      this.transportCost,
      this.costPrice,
      this.salePrice,
      this.otherFieldValue,
      this.createSectionContainer})
      : super(key: key);

  @override
  _CreateItemSummaryState createState() => _CreateItemSummaryState();
}

class _CreateItemSummaryState extends State<CreateItemSummary> {
  @override
  Widget build(BuildContext context) {
    final TextStyle style = TextStyle(
        fontFamily: 'Montserrat', fontSize: 20.0, fontWeight: FontWeight.bold);

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

    Widget _customHeading(headingName) {
      return Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
        child: Text(
          headingName,
          textAlign: TextAlign.center,
          style: style.copyWith(
            fontSize: 18,
          ),
        ),
      );
    }

    final createButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InventoryMenu()),
        );
      },
      child: Text("Create",
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

    Widget _createSummaryRow(String fieldName, String fieldValue) {
      if (fieldValue == null) {
        fieldValue = '';
      }
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 3,
              child: Text(
                fieldName,
                style:
                    style.copyWith(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
            Expanded(flex: 1, child: SizedBox()),
            Expanded(
              flex: 5,
              child: Text(
                fieldValue,
                style:
                    style.copyWith(fontSize: 18, fontWeight: FontWeight.normal),
              ),
            ),
          ],
        ),
      );
    }

    Widget _createMaterialType() {
      if (widget.materialTypes == null) {
        return Text('None');
      }

      // List<Widget> fn() {
      //   List<Widget> children = [];
      //   for (var i = 0; i < widget.materialTypes.length; i++) {
      //     HashMap<dynamic, dynamic> entry = widget.materialTypes[i];
      //     children.add(Column(children: [
      //       _createSummaryRow('Material', entry['Material']),
      //       _createSummaryRow('Length', entry['Length']),
      //       _createSummaryRow('Width', entry['Width']),
      //     ],));
      //   }
      //   return children;
      // }

      // return Container(
      //   child: Column(
      //     children: fn(),
      //   ),
      // );

      return Container(
          child: Column(
        children: widget.materialTypes.map((row) {
          print(row);
          Map rowMap = row;
          return Column(
            children: [
              _createSummaryRow('Material:', rowMap['Material']),
              _createSummaryRow('Length:', rowMap['Length']),
              _createSummaryRow('Width:', rowMap['Width'])
            ],
          );
        }).toList(),
      ));
    }

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
                      maxWidth: MediaQuery.of(context).size.width - 50,
                    ),
                    child: Column(
                      children: [
                        widget.createSectionContainer([
                          _createSummaryRow('Item Code:', widget.itemCode),
                          _createSummaryRow('Description:', widget.description),
                        ]),
                        widget.createSectionContainer([
                          _customHeading('Material Type'),
                          _createSummaryRow('', ''),
                          // below function maps all material types
                          _createMaterialType()
                        ]),
                        widget.createSectionContainer([
                          _customHeading('Labor'),
                          _createSummaryRow('Cutting:', widget.cutting),
                          _createSummaryRow('Stitching:', widget.stitching),
                          _createSummaryRow('Other:', widget.other),
                        ]),
                        widget.createSectionContainer([
                          _customHeading('Cost'),
                          _createSummaryRow(
                              'Transport Cost:', widget.transportCost),
                          _createSummaryRow('Cost Price:', widget.costPrice),
                          _createSummaryRow('Sale Price:', widget.salePrice),
                        ]),
                        widget.createSectionContainer([
                          _customHeading('Other'),
                          _createSummaryRow('', '')
                          // logic for checking if other fields were filled
                        ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 25),
                                width: MediaQuery.of(context).size.width / 3,
                                child: createButton),
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
}
