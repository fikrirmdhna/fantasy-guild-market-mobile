# Fantasy Guild Market Mobile

A new Flutter project by Fikri Dhiya Ramadhana - PBP C.

## Getting Started
<details>
<summary>Read More</summary>
This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
</details>
</br>

# Tugas 7

<details>
<summary>Read More</summary>

## Membuat program Flutter dengan nama fantasy_guild_market_mobile
1. Dengan menggunakan terminal dan menjalankan perintah `flutter create fantasy_guild_market_mobile` maka folder proyek dari app flutter akan dibuat secara otomatis. 

2. Membuat file menu.dart di dalam folder lib yang berisikan kode line 39 dst dari main.dart. 

3. Menambahkan `import 'package:fantasy_guild_market_mobile/menu.dart';` di dalam main.dart agar class MyHomePage tetap dikenali.

4. Mengubah kode main.dart `home: const MyHomePage(title: 'Flutter Demo Home Page'),` menjadi `home: MyHomePage()`

5. Pada menu.dart, ubah sifat widget menjadi Stateless Widget dan ganti isi dari class MyHomePage extend StatelessWidget menjadi:
    ```dart
    MyHomePage({Key? key}) : super(key: key);

    final List<InventoryItem> items = [
        InventoryItem("Lihat Produk", Icons.checklist, Colors.green),
        InventoryItem("Tambah Produk", Icons.add_shopping_cart, Colors.blueGrey),
        InventoryItem("Logout", Icons.logout, Colors.deepPurple),
    ];
    
    @override
        Widget build(BuildContext context) {
            return Scaffold(
                appBar: AppBar(
                backgroundColor : Colors.cyan,
                title: const Text(
                'Fantasy Guild Market',
                textAlign:TextAlign.left,
                style: TextStyle(color: Colors.white),
                ),
            ),
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
                        crossAxisCount: 3,
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
    ```

6. Menambahkan class baru di dalam menu.dart, yaitu:
    ```dart
    class InventoryItem {
        final String name;
        final IconData icon;
        final Color color;

        InventoryItem(this.name, this.icon, this.color);
    }
    ```

7. Membuat Inventory Card dengan membuat class InventoryCard:
    ``` dart
    class InventoryCard extends StatelessWidget {
    final InventoryItem item;

    const InventoryCard(this.item, {super.key}); // Constructor

    @override
    Widget build(BuildContext context) {
        return Material(
        color: item.color,
        child: InkWell(
            // Area responsive terhadap sentuhan
            onTap: () {
            // Memunculkan SnackBar ketika diklik
            ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(SnackBar(
                    content: Text("Kamu telah menekan tombol ${item.name}!")));
            },
            child: Container(
            // Container untuk menyimpan Icon dan Text
            padding: const EdgeInsets.all(8),
            child: Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Icon(
                    item.icon,
                    color: Colors.white,
                    size: 30.0,
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    Text(
                    item.name,
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
    ```

## Membuat tiga tombol sederhana dengan ikon dan teks
Membuat instance InventoryItem baru di final List item menu.dart:
* Lihat Item 
    ```dart
    InventoryItem("Lihat Produk", Icons.checklist, Colors.green),
    ```
* Tambah Item
    ```dart
    InventoryItem("Tambah Produk", Icons.add_shopping_cart, Colors.blueGrey),
    ```
* Logout
    ```dart
    InventoryItem("Logout", Icons.logout, Colors.deepPurple),
    ```

## Memunculkan snackbar
1. Membuat child di dalam class InventoryCard yang berisikan instance dari InkWell

2. Menggunakan function bawaan onTap:() yang berisikan: 
    ```dart
    child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
        },
    ```

## Perbedaan utama stateless dan stateful widget dan fungsinya
| Stateless Widget | Stateful Widget |
| ------------- | ------------- |
| Data yang sudah dibuat tidak dapat diubah (immutable) | Data dapat diubah setelah dibuat (mutable) |
| Merender tampilan berdasarkan properti yang diberikan | Terdapat setState untuk merender ulang data saat mengalami perubahan |
| Tampilan bersifat fixed | Tampilan bersifat dinamis |

## Widget yang digunakan dalam tugas ini
Dalam tugas ini, widget yang digunakan adalah implementasi dari abstract class StatelessWidget yang berfungsi untuk menampilkan properti fixed yang diberikan seperti tombol lihat item, daftar item, dan logout. Lalu meng-override class Widget atau parent dari abstract class StatelessWidget untuk menampilkan tampilan yang diinginkan.
</details>
</br>

# Tugas 8
## Membuat minimal satu halaman formulir untuk menambah item
1. * Membuat file screens baru bernama product_form.dart untuk menampilkan form yang berisi:
        ```dart
        import 'package:flutter/material.dart';
        // TODO: Import drawer yang sudah dibuat sebelumnya
        import 'package:fantasy_guild_market_mobile/widgets/left_drawer.dart';
        import 'package:fantasy_guild_market_mobile/widgets/item_card.dart';
        import 'package:fantasy_guild_market_mobile/screens/show_product.dart';

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
                return Scaffold(
                    appBar: AppBar(
                        ...
                    )
            }
        ```
        dengan menambahkan elemen - elemen input yang sesuai pada tugas Django sebelumnya. 

    * Membuat tombol save dalam form:
        ``` dart
        Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
                style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(Colors.cyan),
                ),
                onPressed: () {
                if (_formKey.currentState!.validate()) {
                    showDialog(
                        ...
                    )
                child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                    ),
                ),
            ),
        ),
        ```

    * Dan memvalidasi setiap input agar tidak kosong dan tipe data harus sesuai dengan menambahkan validator:
        ```dart 
        validator: (String? value) {
            if (value == null || value.isEmpty) {
            return "Fill out the price!";
            }
            if (int.tryParse(value) == null) {
            return "Price must be an numbers!";
            }
            return null;
        },
        ```

## Mengarahkan tombol Add Product ke form pada halaman utama
1. Menambahkan kode navigator.push di dalam class InventoryCard pada file product_card.dart: 
    ```dart
    Widget build(BuildContext context) {
    return Material(
      color: item.color,
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () {
            ...
            if (item.name == "Add Product") {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ProductFormPage()));
            }
    ```
    navigator.push ini akan men-stack tampilan form sehingga berada di paling atas stack.

## Memunculkan pop-up data sesuai dengan isi form setelah menekan tombol Save di dalam form 
1. Menambahkan showdialog di dalam function onPressed pada Align tombol save di dalam file product_form.dart:
    ``` dart
    Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Colors.cyan),
            ),
            onPressed: () {
                if (_formKey.currentState!.validate()) {
                    showDialog(
                    context: context,
                    builder: (context) {
                        return AlertDialog(
                        title: const Text('Product successfully saved'),
                        content: SingleChildScrollView(
                            child: Column(
                            crossAxisAlignment:
                                CrossAxisAlignment.start,
                            children: [
                                Text('Name: $_name'),
                                // TODO: Munculkan value-value lainnya
                                Text('Amount: $_amount'),
                                Text('Price: $_price'),
                                Text('Power: $_power'),
                                Text('Description: $_description'),
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
    ```

## Membuat sebuah drawer yang berisi routing ke Main Page, Add Product, dan Show Product
1. * Membuat file widgets baru bernama left_drawer.dart yang berisi:
        ```dart
        import 'package:fantasy_guild_market_mobile/screens/product_form.dart';
        import 'package:fantasy_guild_market_mobile/screens/show_product.dart';
        import 'package:flutter/material.dart';
        import 'package:fantasy_guild_market_mobile/screens/menu.dart';

        class LeftDrawer extends StatelessWidget {
        const LeftDrawer({super.key});

        @override
        Widget build(BuildContext context) {
            return Drawer(
            child: ListView(
                children: [
                const DrawerHeader(
                    // TODO: Bagian drawer header
                    decoration: BoxDecoration(
                    color: Colors.cyan,
                    ),
                    child: Column(
                    children: [
                        Text(
                        'Guild\'s Inventory',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                        ),
                        ),
                        Padding(padding: EdgeInsets.all(10)),
                        Text("Relax, we can provide what all you need",
                            // TODO: Tambahkan gaya teks dengan center alignment, font ukuran 15, warna putih, dan weight biasa
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 15, fontWeight:FontWeight.normal, color: Colors.white),
                            ),
                    ],
                    ),      
                ),
                ...
        ```

    * Lalu menambahkan opsi dan routing masing - masing dari Main Page, Add Product, dan Show Product dalam Class ListTile.
        1. Main Page: 
            ```dart
            ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text('Main Page'),
                // Bagian redirection ke MyHomePage
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyHomePage(),
                    ));
                },
            ),
            ```
        
        2. Add Product:
            ```dart
            ListTile(
                leading: const Icon(Icons.add_shopping_cart),
                title: const Text('Add Product'),
                // Bagian redirection ke ProductFormPage
                onTap: () {
                /*
                TODO: Buatlah routing ke ProductFormPage di sini,
                setelah halaman ProductFormPage sudah dibuat.
                */
                Navigator.pushReplacement(
                    context, 
                    MaterialPageRoute(
                    builder: (context) => const ProductFormPage()
                    ));
                },
            ),
            ```
        
        3. Show Product:
            ```dart
            ListTile(
                leading: const Icon(Icons.checklist),
                title: const Text('Show Product'),
                // Bagian redirection ke MyProduct
                onTap: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const MyProduct(),
                    ));
                },
            ),
            ```

## Perbedaan antara Navigator.push() dan Navigator.pushReplacement() dengan konteks penggunaan masing - masing
| Navigator.push() | Navigator.pushReplacement() |
|:-----------:|:-----------:|
| Menambah route stack baru di paling atas stack. | Menggantikan route yang berada di paling atas stack dengan route baru yang diberikan. |
| Digunakan saat ingin menampilkan screen baru dan bisa kembali ke screen sebelumnya. | Digunakan saat ingin menampilkan screen baru namun tidak ingin kembali ke screen sebelumnya. |

## Layout widget pada Flutter dan konteks penggunaannya masing - masing
1. Container:
    merupakan widget multifungsi yang dapat dijadikan suatu kontainer beberapa widget lain. Digunakan saat ingin mengatur tata letak suatu kumpulan widget. 

2. Row: 
    merupakan penataan isi widget secara berdampingan dari kiri ke kanan. Contohnya, seperti digunakan untuk membuat list nilai dari suatu siswa.

3. Column:
    merupakan penataan isi widget secara vertikal dari atas ke bawah. Contohnya adalah membuat list nilai dari lebih dari satu siswa. 

4. ListView: 
    merupakan penataan dari isi list seperti daftar vertikal atau horizontal. Digunakan saat ingin mengiterasi isi dari suatu list.

5. GridView:
    merupakan penataan widget berdasarkan bentuk grid layout baris dan kolom. Digunakan untuk menampilkan koleksi list dalam bentuk tampilan card. 

6. Stack: 
    merupakan penataan widget yang bertumpuk secara relatif satu sama lain. Digunakan untuk ingin melakukan overlay atau showoff cards. 

## Elemen input pada form dalam tugas ini
1. Name of item (String)
2. Amount (int)
3. Price (int)
4. Power (int)
5. Description (String)

Kelima elemen input form di atas saya gunakan untuk mendapatkan detail dari item yang akan ditambah dan menyesuaikan dengan model dari tugas Django sebelumnya. 

## Penerapan clean architecture pada aplikasi Flutter
Pada flutter penerapan clean architecture dapat dilakukan dengan mengorganisir aplikasi menjadi tiga layer utama, yaitu domain layer, data layer, dan presentation layer. Penerapan ini dilakukan agar aplikasi lebih terstruktur dan mudah untuk dimodifikasi atau diuji untuk kedepannya.

Di dalam tugas ini, seperti di dalam folder lib terdapat folder screens, widgets, dan file main.dart. Di dalam folder screens berisi kumpulan tampilan dari aplikasi, sedangkan widgets berisi container - container yang berupa widget yang akan digunakan di setiap tampilan aplikasi dari screens dan main.dart adalah inti dari aplikasi untuk menjalankan isi dari kedua folder screens dan widgets. 