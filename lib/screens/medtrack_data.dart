import 'package:flutter/material.dart';

// Item Model
class Item {
  final String name;
  final int price;
  final String category;
  final int amount;
  final String description;

  Item(
      {required this.name,
      required this.price,
      required this.category,
      required this.amount,
      required this.description});
}

// Global Items List
List<Item> items = [];

// Item List Page
class ItemListPage extends StatelessWidget {
  final List<Item> items;

  const ItemListPage({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Item'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text(
                'Price: ${item.price}, Category: ${item.category}, Amount: ${item.amount}'),
          );
        },
      ),
    );
  }
}
