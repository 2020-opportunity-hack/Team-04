import 'package:easy_localization/easy_localization.dart';

import 'package:flutter/material.dart';
import 'package:ohack/inventoryMenu.dart';

class OptionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

    final disabledButtonStyle = ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
    );

    final invoiceButton = ElevatedButton(
      onPressed: null,
      child: Text("Invoice",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold))
          .tr(),
      style: disabledButtonStyle,
    );

    final salesButton = ElevatedButton(
      onPressed: null,
      child: Text("Sales",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      style: disabledButtonStyle,
    );

    final purchaseButton = ElevatedButton(
      onPressed: null,
      child: Text("Purchase",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      style: disabledButtonStyle,
    );

    final inventoryButton = ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InventoryMenu()),
        );
      },
      child: Text("Inventory",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    final reportButton = ElevatedButton(
      onPressed: null,
      child: Text("Reports",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      style: disabledButtonStyle,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Payir - thoorigai'),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
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
                      child: invoiceButton),
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: salesButton),
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: purchaseButton),
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: inventoryButton),
                  Container(
                      width: MediaQuery.of(context).size.width - 50,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 35, vertical: 20),
                      child: reportButton)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
