import 'package:flutter/material.dart';
import 'main.dart';
import 'package:ohack/createItem.dart';

class CreateInventoryItemTwo extends StatefulWidget {
  final Function createSectionContainerfn;
  const CreateInventoryItemTwo({Key key, this.createSectionContainerfn})
      : super(key: key);

  @override
  _CreateInventoryItemTwoState createState() => _CreateInventoryItemTwoState();
}

class _CreateInventoryItemTwoState extends State<CreateInventoryItemTwo> {
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
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
      child: Text("Next",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final backButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateInventoryItem()),
        );
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
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 50),
          child: emptyFieldInput),
        // Expanded(flex: 1, child: SizedBox()),
        ConstrainedBox(
          constraints: BoxConstraints(maxWidth: 50),
          child: emptyValueInput),
        // Expanded(flex: 1, child: SizedBox()),
        FlatButton.icon(
          onPressed: delete,
          label: Text('delete quote'),
          icon: Icon(Icons.delete),
        ),
      ],
    );
  }
}
