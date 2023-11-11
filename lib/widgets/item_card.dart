import 'package:flutter/material.dart';

class Item{
  String name, description;
  int amount, price, power;

  Item(this.name, this.amount, this.price, this.power, this.description);
}

class ItemCard extends StatelessWidget {
  final Item item;

  const ItemCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 10,
      color: const Color.fromARGB(255, 17, 178, 199),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
          onTap: (){
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Item Details'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${item.name}'),
                        // TODO: Munculkan value-value lainnya
                        Text('Amount: ${item.amount.toString()}'),
                        Text('Price: ${item.price.toString()}'),
                        Text('Power: ${item.power.toString()}'),
                        Text('Description: ${item.description}'),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      child: const Text('OK'),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              },
            );
          },
          child: Container(
          // Container untuk menyimpan Icon dan Text
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.name,
                        overflow: TextOverflow.fade,
                        maxLines: 1,
                        softWrap: false,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(5)),
                      Text(
                        "Price: ${item.price.toString()} gil",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Power: +${item.power.toString()}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Description: ${item.description}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                        softWrap: false,
                        textAlign: TextAlign.justify,
                        style: const TextStyle(color: Colors.white),
                      ),
                      const Padding(padding: EdgeInsets.all(3)),
                      Text(
                        "Amount: ${item.amount.toString()}",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        softWrap: false,
                        textAlign: TextAlign.center,
                        style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: 12),
                      ),
                    ],
                ),
          ),
      ),
    );
  }
}