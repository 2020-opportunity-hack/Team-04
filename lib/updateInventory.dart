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
      decoration: const InputDecoration(labelText: 'Enter an item code'),
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
        labelText: 'Enter Quantity',
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
    );

    final costInput = TextFormField(
      decoration: const InputDecoration(
        labelText: 'Enter cost price',
      ),
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
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
        padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
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
                              padding: EdgeInsets.only(left:10.0, top: 5.0, bottom: 5.0),
                              child: incrementButton),
                            Container(
                              padding: EdgeInsets.only(left:10.0, top: 5.0, bottom: 5.0),
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
}
