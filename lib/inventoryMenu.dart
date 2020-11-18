import 'package:flutter/material.dart';

class InventoryMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Manager'),
      ),
      body: new ListView(
        children: [
          ElevatedButton(onPressed: null, child: Text('Create')),
          ElevatedButton(onPressed: null, child: Text('Update')),
          ElevatedButton(onPressed: null, child: Text('View All')),
        ],
      ),
    );
  }
}
