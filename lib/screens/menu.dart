import 'package:flutter/material.dart';
import 'package:fantasy_guild_market_mobile/widgets/left_drawer.dart';
import 'package:fantasy_guild_market_mobile/widgets/product_card.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);

  final List<InventoryItem> items = [
      InventoryItem("Show Product", Icons.checklist, Colors.green),
      InventoryItem("Show Product JSON", Icons.checklist, const Color.fromARGB(255, 72, 148, 210)),
      InventoryItem("Add Product", Icons.add_shopping_cart, Colors.blueGrey),
      InventoryItem("Logout", Icons.logout, Colors.deepPurple),
  ];

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
            backgroundColor : Colors.cyan,
              foregroundColor: Colors.white,
            title: const Text(
              'Fantasy Guild Market',
              textAlign:TextAlign.left,
              style: TextStyle(color: Colors.white),
            ),
          ),
          drawer: const LeftDrawer(),
          body: SingleChildScrollView(
            // Widget wrapper yang dapat discroll
            child: Padding(
              padding: const EdgeInsets.all(10.0), // Set padding dari halaman
              child: Column(
                // Widget untuk menampilkan children secara vertikal
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                    // Widget Text untuk menampilkan tulisan dengan alignment center dan style yang sesuai
                    child: Text(
                      'Inventory Item', // Text yang menandakan toko
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  // Grid layout
                  GridView.count(
                    // Container pada card kita.
                    primary: true,
                    padding: const EdgeInsets.all(20),
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: items.map((InventoryItem item) {
                      // Iterasi untuk setiap item
                      return InventoryCard(item);
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        );
    }
}

