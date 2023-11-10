import 'package:flutter/material.dart';
import 'package:fantasy_guild_market_mobile/widgets/left_drawer.dart';
import 'package:fantasy_guild_market_mobile/widgets/item_card.dart';

class MyProduct extends StatefulWidget{
  const MyProduct({super.key});

  @override
  State<MyProduct> createState() => _MyProductState();
}

class InventoryProduct {
  static List<Item> listProduct = <Item>[];
}

class _MyProductState extends State<MyProduct> {
  @override
  Widget build(BuildContext context){
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
    final double itemWidth = size.width / 2;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
          foregroundColor: Colors.white,
        title: const Center( 
          child: Text(
          "My Product", 
          style: TextStyle(color: Colors.white)
          ),
        )
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                    GridView.count(
                      // Container pada card kita.
                      primary: true,
                      padding: const EdgeInsets.all(20),
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: (itemWidth / itemHeight),
                      shrinkWrap: true,
                      children: InventoryProduct.listProduct.map((Item item) {
                        // Iterasi untuk setiap item
                        return ItemCard(item);
                      }).toList(),
                    ),  
                  ]
              ),
            ),
      ),
    );

  }
}