import 'package:fantasy_guild_market_mobile/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'dart:convert' as convert;


class RegisterPage extends StatefulWidget {
    const RegisterPage({super.key});
    static const ROUTE_NAME = '/register';

    @override
    State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController _username = TextEditingController();
    final TextEditingController _password = TextEditingController();
    final TextEditingController _confirmPassword = TextEditingController();

    // String _username = "";
    // String _password = "";
    // String _confirmPassword = "";

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Register'),
            ),
            body: Container(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: _username,
                          decoration: InputDecoration(
                            hintText: "Username",
                            labelText: "Username",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // onChanged: (String? value) {
                          //   setState(() {
                          //     _username = value!;
                          //   });
                          // },
                          autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Fill out the blank username!";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: _password,
                          decoration: InputDecoration(
                            hintText: "Password",
                            labelText: "Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // onChanged: (String? value) {
                          //   setState(() {
                          //     _password = value!;
                          //   });
                          // },
                          autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Fill out the blank password!";
                            } else if (value == _username.text) {
                              return "Password cannot be the same as username";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          obscureText: true,
                          controller: _confirmPassword,
                          decoration: InputDecoration(
                            hintText: "Comfirm Password",
                            labelText: "Confirm Password",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                          // onChanged: (String? value) {
                          //   setState(() {
                          //     _confirmPassword = value!;
                          //   });
                          // },
                          autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                          validator: (String? value) {
                            if (value == null || value.isEmpty) {
                              return "Fill out the blank password!";
                            } else if (value != _password.text) {
                              return "Re-enter the same password";
                            }
                            return null;
                          },
                        ),
                      ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                               if (_formKey.currentState!.validate()) {
                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.postJson(
                                      "https://fikri-dhiya21-tugas.pbp.cs.ui.ac.id/auth/register/",
                                      convert.jsonEncode(<String, String>{
                                        'username': _username.text,
                                        'password': _password.text,
                                      }));

                                 if (response['status']) {
                                    if (!context.mounted) return;
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text(
                                          "Your account is successfully registered!"),
                                    ));
                                    if (!context.mounted) return;
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => const LoginPage()),
                                    );
                                 } else {
                                    if (!context.mounted) return;
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Failed to Register'),
                                            content:
                                                Text(response['message']),
                                            actions: [
                                                TextButton(
                                                    child: const Text('OK'),
                                                    onPressed: () {
                                                        Navigator.pop(context);
                                                    },
                                                ),
                                            ],
                                        ),
                                    );
                                  }
                                  _formKey.currentState!.reset();
                               }
                            },
                            child: const Text('Register'),
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                          onPressed: () {
                            if (!context.mounted) return;
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LoginPage()),
                              );
                          },
                          child: const Text('Back'),
                         )
                    ],
                ),
            ),
          ),
        );
    }
}