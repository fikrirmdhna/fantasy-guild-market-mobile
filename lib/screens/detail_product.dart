import 'package:flutter/material.dart';
import 'package:fantasy_guild_market_mobile/models/product.dart';

class ProductDetailsPage extends StatelessWidget {
  final Products item;

  const ProductDetailsPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${item.fields.name}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('Amount: ${item.fields.amount}'),
            const SizedBox(height: 10),
            Text("Price: ${item.fields.price} gil"),
            const SizedBox(height: 10),
            Text("Power: +${item.fields.power}"),
            const SizedBox(height: 10),
            Text('Description: ${item.fields.description}'),
          ],
        ),
      ),
    );
  }
}