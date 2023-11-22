import 'dart:convert';
import 'package:fantasy_guild_market_mobile/screens/menu.dart';
import 'package:flutter/material.dart';
// TODO: Import drawer yang sudah dibuat sebelumnya
import 'package:fantasy_guild_market_mobile/widgets/left_drawer.dart';
import 'package:fantasy_guild_market_mobile/widgets/item_card.dart';
import 'package:fantasy_guild_market_mobile/screens/show_product.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class ProductFormPage extends StatefulWidget {
    const ProductFormPage({super.key});

    @override
    State<ProductFormPage> createState() => _ProductFormState();
}

class _ProductFormState extends State<ProductFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  int _price = 0;
  int _power = 0;
  String _description = "";

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();

        return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text(
                  'Add Your Product',
                ),
              ),
              backgroundColor: Colors.cyan,
              foregroundColor: Colors.white,
            ),
            // TODO: Tambahkan drawer yang sudah dibuat di sini
            drawer: const LeftDrawer(),
            body: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Product Name",
                          labelText: "Product Name",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            _name = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Fill out the blank name!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Amount",
                          labelText: "Amount",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // TODO: Tambahkan variabel yang sesuai
                        onChanged: (String? value) {
                          setState(() {
                            _amount= int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Fill out the amount!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Amount must be an numbers!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Price",
                          labelText: "Price",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // TODO: Tambahkan variabel yang sesuai
                        onChanged: (String? value) {
                          setState(() {
                            _price= int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Fill out the price!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Price must be an numbers!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Power",
                          labelText: "Power",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        // TODO: Tambahkan variabel yang sesuai
                        onChanged: (String? value) {
                          setState(() {
                            _power= int.parse(value!);
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Fill out the power!";
                          }
                          if (int.tryParse(value) == null) {
                            return "Power must be an numbers!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Description",
                          labelText: "Description",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            // TODO: Tambahkan variabel yang sesuai
                            _description = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return "Fill out the description!";
                          }
                          return null;
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.cyan),
                          ),
                          onPressed: () async {
                           if (_formKey.currentState!.validate()) {
                                // Kirim ke Django dan tunggu respons
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                final response = await request.postJson(
                                "http://127.0.0.1:8000/create-flutter/",
                                jsonEncode(<String, String>{
                                    'name': _name,
                                    'amount': _amount.toString(),
                                    'price': _price.toString(),
                                    'power': _power.toString(),
                                    'description': _description,
                                    // TODO: Sesuaikan field data sesuai dengan aplikasimu
                                }));
                                if (response['status'] == 'success') {
                                  if (!context.mounted) return;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                    content: Text("Product Successfully Saved!"),
                                    ));
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                } else {
                                  if (!context.mounted) return;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                        content:
                                            Text("There's been a mistake, try again!"),
                                    ));
                                }
                              InventoryProduct.listProduct.add(Item(_name, _amount, _price, _power, _description));
                              _formKey.currentState!.reset();
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
}