import 'package:flutter/material.dart';

class Item{
  String name, description;
  int price;

  Item(this.name, this.price, this.description);
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(255, 17, 178, 199),
      child: InkWell(
          child: Container(
          // Container untuk menyimpan Icon dan Text
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
              ),
              padding: const EdgeInsets.all(8),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      item.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      "Price: ${item.price.toString()}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                      "Description: ${item.description}",
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
      ),
    );
  }
}