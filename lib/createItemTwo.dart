import 'package:flutter/material.dart';
import 'main.dart';
import 'package:ohack/createItem.dart';
import 'package:ohack/createItemSummary.dart';

class CreateInventoryItemTwo extends StatefulWidget {
  final String itemCode;
  final String description;
  final List<Object> materialTypes;

  final Function createSectionContainerfn;
  const CreateInventoryItemTwo(
      {Key key,
      this.itemCode,
      this.description,
      this.materialTypes,
      this.createSectionContainerfn})
      : super(key: key);

  @override
  _CreateInventoryItemTwoState createState() => _CreateInventoryItemTwoState();
}

class _CreateInventoryItemTwoState extends State<CreateInventoryItemTwo> {
  String cutting;
  String stitching;
  String other;
  String transportCost;
  String costPrice;
  String salePrice;
  List<Object> otherFieldValue = [];

  final List<Widget> otherList = [];

  @override
  Widget build(BuildContext context) {
    // testing

    TextStyle style = TextStyle(
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

    final cuttingInput = TextFormField(
      decoration: InputDecoration(labelText: 'Cutting:'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ....';
        }
        return null;
      },
    );

    final stitchingInput = TextFormField(
      decoration: InputDecoration(labelText: 'Stitching:'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ....';
        }
        return null;
      },
    );

    final otherInput = TextFormField(
      decoration: InputDecoration(labelText: 'Other:'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ....';
        }
        return null;
      },
    );

    final transportInput = TextFormField(
      decoration: InputDecoration(labelText: 'Transport Cost:'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ....';
        }
        return null;
      },
    );

    final costInput = TextFormField(
      decoration: InputDecoration(labelText: 'Cost Price:'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ....';
        }
        return null;
      },
    );

    final saleInput = TextFormField(
      decoration: InputDecoration(labelText: 'Sale Price:'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter ....';
        }
        return null;
      },
    );

    final addOtherButton = ElevatedButton(
      onPressed: () {
        setState(() {
          // otherList.add(_otherRow());
          otherList.add(Text('widget'));
        });
      },
      child: Text("+ Add Other",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    // if (otherList.isEmpty) {
    //   otherList.add(_otherRow());
    // }

    if (otherList.isEmpty) {
      otherList.add(Text('widget'));
    }

    // Widget otherListView = ListView.builder(
    //   itemCount: otherList.length,
    //   shrinkWrap: true,
    //   itemBuilder: (context, index) {
    //     return otherList[index];
    //   },
    // );

    final nextButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateItemSummary(
                  createSectionContainerfn: widget.createSectionContainerfn,
                  itemCode: widget.itemCode,
                  description: widget.description,
                  materialTypes: widget.materialTypes,
                  cutting: cutting,
                  stitching: stitching,
                  other: other,
                  transportCost: transportCost,
                  costPrice: costPrice,
                  salePrice: salePrice,
                  otherFieldValue: otherFieldValue,
                  )),
        );
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
                        widget.createSectionContainerfn([
                          _customHeading('Labor'),
                          cuttingInput,
                          stitchingInput,
                          otherInput,
                        ]),
                        widget.createSectionContainerfn([
                          _customHeading('Cost'),
                          transportInput,
                          costInput,
                          saleInput,
                        ]),
                        widget.createSectionContainerfn([
                          _customHeading('Other'),
                          // _otherRow(),
                          Column(
                            children: otherList
                                .map((element) => OtherRow(delete: () {
                                      setState(() {
                                        otherList.remove(element);
                                      });
                                    }))
                                .toList(),
                          ),
                          // otherListView,
                          Container(
                              padding: EdgeInsets.only(top: 10.0),
                              child: addOtherButton),
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
}

class OtherRow extends StatelessWidget {
  final Function delete;
  OtherRow({this.delete});

  final emptyFieldInput = TextFormField(
    decoration: InputDecoration(labelText: 'Enter field name'),
    validator: (value) {
      return null;
    },
  );

  final emptyValueInput = TextFormField(
    decoration: InputDecoration(labelText: 'Enter a value'),
    validator: (value) {
      return null;
    },
  );

  // final removeOtherButton = ElevatedButton(
  //   onPressed: delete,

  //   //   () {
  //   //   setState(() {
  //   //     // replace otherList[0] with the value indicator we want to remove
  //   //     otherList.remove(otherList[0]);
  //   //   });
  //   // },
  //   child: Text('X'),
  //   style: ButtonStyle(
  //     elevation: MaterialStateProperty.all<double>(3),
  //     backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
  //   ),
  // );

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.baseline,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 3.5),
              child: emptyFieldInput),
        ),
        // Expanded(flex: 1, child: SizedBox()),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width / 3.5),
              child: emptyValueInput),
        ),
        // Expanded(flex: 1, child: SizedBox()),
        Container(
            margin:
                const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 10),
                child: ElevatedButton(onPressed: delete, child: Text('X')))),
        // FlatButton.icon(
        //   onPressed: delete,
        //   label: Text('delete'),
        //   icon: Icon(Icons.delete),
        // ),
      ],
    );
  }
}
