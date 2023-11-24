import 'package:fantasy_guild_market_mobile/screens/detail_product.dart';
import 'package:flutter/material.dart';
import 'package:fantasy_guild_market_mobile/models/product.dart';
import 'package:fantasy_guild_market_mobile/widgets/left_drawer.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';



class ProductPage extends StatefulWidget {
    const ProductPage({Key? key}) : super(key: key);

    @override
    State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
Future<List<Products>> fetchProduct(request) async {
    // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    // melakukan decode response menjadi bentuk json
    var data = await request.get('https://fikri-dhiya21-tugas.pbp.cs.ui.ac.id/get-product/');  
    // melakukan konversi data json menjadi object Products
    List<Products> listProduct = [];
    for (var d in data) {
        if (d != null) {
          listProduct.add(Products.fromJson(d));
          // InventoryProduct.listProduct.add(Products.fromJson(d) as Item);
        }
    }
    return listProduct;
}

@override
Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
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
        body:  
          FutureBuilder(
            future: fetchProduct(request),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                      return const Column(
                          children: [
                          Text(
                              "Tidak ada data produk.",
                              style:
                                  TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                          ],
                      );
                    } else {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) =>InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ProductDetailsPage(item: snapshot.data![index]),
                                    ),
                                  );
                                },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  padding: const EdgeInsets.all(20.0),
                                  child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                      Text(
                                      "${snapshot.data![index].fields.name}",
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                      ),
                                      ),
                                      const SizedBox(height: 10),
                                      Text("Amount: ${snapshot.data![index].fields.amount}"),
                                      const SizedBox(height: 10),
                                      Text(
                                          "Description: ${snapshot.data![index].fields.description}")
                                  ],
                                  ),
                              )
                            ),
                         );
                      }
                    }
                }
            )
        );
    }
}
