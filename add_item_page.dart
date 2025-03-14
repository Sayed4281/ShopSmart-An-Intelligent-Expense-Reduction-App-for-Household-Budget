import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  @override
  _AddItemPageState createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  String itemName = '';
  double price = 0.0;
  String shopName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) {
                setState(() {
                  itemName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  price = double.parse(value);
                });
              },
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            TextField(
              onChanged: (value) {
                setState(() {
                  shopName = value;
                });
              },
              decoration: InputDecoration(labelText: 'Shop Name'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Implement logic to add the item
                // You can access itemName, price, shopName here
              },
              child: Text('Add Item'),
            ),
          ],
        ),
      ),
    );
  }
}
