import 'package:flutter/material.dart';
import 'main.dart';

class UpdateInventoryItem extends StatefulWidget {
  @override
  _UpdateInventoryItemState createState() => _UpdateInventoryItemState();
}

class _UpdateInventoryItemState extends State<UpdateInventoryItem> {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final heading = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        'Update Inventory Item',
        textAlign: TextAlign.center,
        style: style.copyWith(
          fontSize: 30,
        ),
      ),
    );

    final itemCodeInput = TextFormField(
      decoration: const InputDecoration(hintText: 'Enter an item code'),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter an item code';
        }
        // need to validate if item code exist
        return null;
      },
    );

    final quantityInput = TextFormField(
      decoration: const InputDecoration(
        hintText: 'Enter Quantity',
        // hintStyle: 
      ),
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

    final buttonStyle = ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.grey));

    final incrementButton = ElevatedButton(
      style: buttonStyle,
      onPressed: null,
      child: Text(
        "+",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final decrementButton = ElevatedButton(
      style: buttonStyle,
      onPressed: null,
      child: Text(
        "-",
        textAlign: TextAlign.center,
        style: style.copyWith(color: Colors.white, fontWeight: FontWeight.bold),
      ),
    );

    final updateButton = Material(
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
        child: Text("Update",
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
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              heading,
              Form(
                child: Column(
                  children: <Widget>[
                    Row(
                      // problem here <-------
                      children: [
                        Expanded(child: itemCodeInput),
                        Column(
                          children: [
                            incrementButton,
                            decrementButton,
                          ],
                        ),
                        Expanded(child: quantityInput),
                      ],
                    ),
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
    );
  }
}
