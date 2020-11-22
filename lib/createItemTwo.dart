import 'package:flutter/material.dart';
import 'package:ohack/createItemSummary.dart';

class CreateInventoryItemTwo extends StatefulWidget {
  final String itemCode;
  final String description;
  final List<Map> materialTypes;

  final Function createSectionContainer;
  const CreateInventoryItemTwo(
      {Key key,
      this.itemCode,
      this.description,
      this.materialTypes,
      this.createSectionContainer})
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
  List<Map> otherFieldValue = [];

  List<Widget> otherList = [];
  String otherKeyField = '';
  String otherValueField = '';
  bool showFieldsEmpty = false;

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
        onChanged: (val) {
          setState(() {
            cutting = val;
          });
        });

    final stitchingInput = TextFormField(
        decoration: InputDecoration(labelText: 'Stitching:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ....';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            stitching = val;
          });
        });

    final otherInput = TextFormField(
        decoration: InputDecoration(labelText: 'Other:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ....';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            other = val;
          });
        });

    final transportInput = TextFormField(
        decoration: InputDecoration(labelText: 'Transport Cost:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ....';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            transportCost = val;
          });
        });

    final costInput = TextFormField(
        decoration: InputDecoration(labelText: 'Cost Price:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ....';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            costPrice = val;
          });
        });

    final saleInput = TextFormField(
        decoration: InputDecoration(labelText: 'Sale Price:'),
        validator: (value) {
          if (value.isEmpty) {
            return 'Please enter ....';
          }
          return null;
        },
        onChanged: (val) {
          setState(() {
            salePrice = val;
          });
        });

    Widget _otherRow() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        children: [
          Container(
            margin:
                const EdgeInsets.only(left: 5, right: 10, top: 5, bottom: 5),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 3.5),
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Enter field name'),
                  validator: (value) {
                    return null;
                  },
                  onChanged: (val) {
                    setState(() {
                      otherKeyField = val;
                    });
                  },
                )),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: ConstrainedBox(
                constraints: BoxConstraints(
                    maxWidth: MediaQuery.of(context).size.width / 3.5),
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'Enter a value'),
                    validator: (value) {
                      if (otherKeyField.length == 0) {
                        return 'Enter Field Name First';
                      }
                      return null;
                    },
                    onChanged: (val) {
                      setState(() {
                        otherValueField = val;
                      });
                    })),
          ),
          Container(
              margin:
                  const EdgeInsets.only(left: 10, right: 5, top: 5, bottom: 5),
              child: ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 10),
                  child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.grey[600]),
                      ),
                      onPressed: null,
                      child: Text('X',
                          textAlign: TextAlign.center,
                          style: style.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold))))),
        ],
      );
    }

    void _submitOtherFields() {
      otherFieldValue
          .add({'keyField': otherKeyField, 'valueField': otherValueField});
      otherKeyField = '';
      otherValueField = '';
    }

    final emptyFieldError = Container(
      margin: const EdgeInsets.only(top: 5),
      child: Text('Fill empty fields',
          textAlign: TextAlign.center,
          style: style.copyWith(
              color: Colors.purple[600], fontWeight: FontWeight.normal)),
    );

    final addOtherButton = ElevatedButton(
      onPressed: () {
        if (otherKeyField.length == 0 || otherValueField.length == 0) {
          setState(() {
            showFieldsEmpty = true;
          });
          return null;
        }
        showFieldsEmpty = false;
        setState(() {
          _submitOtherFields();
          otherList.add(_otherRow());
        });
      },
      child: Text("+ Add Other",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    if (otherList.isEmpty) {
      otherList.add(_otherRow());
    }

    final nextButton = ElevatedButton(
      onPressed: () {
        if (otherKeyField.length > 0 && otherValueField.length > 0) {
          _submitOtherFields();
        }
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CreateItemSummary(
                    createSectionContainer: widget.createSectionContainer,
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
                        widget.createSectionContainer([
                          _customHeading('Labor'),
                          cuttingInput,
                          stitchingInput,
                          otherInput,
                        ]),
                        widget.createSectionContainer([
                          _customHeading('Cost'),
                          transportInput,
                          costInput,
                          saleInput,
                        ]),
                        widget.createSectionContainer([
                          _customHeading('Other'),
                          Column(children: otherList),
                          showFieldsEmpty ? emptyFieldError : SizedBox(),
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

// class OtherRow extends StatelessWidget {
//   final Function delete;
//   OtherRow({this.delete});

//   // final removeOtherButton = ElevatedButton(
//   //   onPressed: delete,

//   //   //   () {
//   //   //   setState(() {
//   //   //     // replace otherList[0] with the value indicator we want to remove
//   //   //     otherList.remove(otherList[0]);
//   //   //   });
//   //   // },
//   //   child: Text('X'),
//   //   style: ButtonStyle(
//   //     elevation: MaterialStateProperty.all<double>(3),
//   //     backgroundColor: MaterialStateProperty.all<Color>(Colors.grey[300]),
//   //   ),
//   // );

//   @override
//   Widget build(BuildContext context) {}
// }
