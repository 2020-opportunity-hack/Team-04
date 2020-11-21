import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:ohack/updateInventory.dart';
import 'package:ohack/createItem.dart';
import 'main.dart';

class InventoryMenu extends StatefulWidget {

  @override
  _InventoryState createState() => _InventoryState();
}


class _InventoryState extends State<InventoryMenu> {

  final fb = FirebaseDatabase.instance.reference();
  int productId;

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final createButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CreateInventoryItem()),
        );
      },
      child: Text("Create item",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final editButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UpdateInventoryItem()),
        );
      },
      child: Text("Edit item",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final viewButton = ElevatedButton(
      onPressed: () {
        viewData();
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage()),
        );
      },
      child: Text("View all items",
          textAlign: TextAlign.center,
          style:
          style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Payir - Thoorgayi'),
      ),
      // body: Center(
      //   child: ElevatedButton(
      //     child: Text('Open route'),
      //     onPressed: () {
      //       // Navigate to second route when tapped.
      //     },
      //   ),
      // ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width - 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                        
                    child: createButton),
                Container(
                    width: MediaQuery.of(context).size.width - 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: editButton),
                Container(
                    width: MediaQuery.of(context).size.width - 50,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 35, vertical: 20),
                    child: viewButton)
              ],
            ),
          ),
        ),
      ),
    );
  }
  void viewData() {
    fb.once().then((DataSnapshot snapshot) {
      print('Data: ${snapshot.value}');
    });
  }
}
