import 'package:flutter/material.dart';
import 'main.dart';
import 'package:ohack/createItem.dart';

class CreateInventoryItemTwo extends StatefulWidget {
  @override
  _CreateInventoryItemTwoState createState() => _CreateInventoryItemTwoState();
}

class _CreateInventoryItemTwoState extends State<CreateInventoryItemTwo> {
  final List<Widget> otherList = [];

  @override
  Widget build(BuildContext context) {
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

    Widget _otherRow() {
      return Row(
        children: [
          Expanded(flex: 3, child: emptyFieldInput),
          Expanded(flex: 1, child: SizedBox()),
          Expanded(flex: 3, child: emptyValueInput)
        ],
      );
    }

    final addOtherButton = ElevatedButton(
      onPressed: () {
        setState(() {
          otherList.add(_otherRow());
        });
      },
      child: Text("+ Add Other",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    Widget otherListView = ListView.builder(
      itemCount: otherList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return otherList[index];
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
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
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
            MaterialPageRoute(builder: (context) => CreateInventoryItem()),
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
                      children: [
                        _customHeading('Labor'),
                        cuttingInput,
                        stitchingInput,
                        otherInput,
                        _customHeading('Cost'),
                        transportInput,
                        costInput,
                        saleInput,
                        _customHeading('Other'),
                        
                        _otherRow(),
                        
                        otherListView,
                        Container(
                            padding: EdgeInsets.only(top: 10.0),
                            child: addOtherButton),
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
}
