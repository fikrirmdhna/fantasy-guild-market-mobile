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
Dalam tugas ini, widget yang digunakan adalah implementasi dari abstract class StatelessWidget yang berfungsi untuk menampilkan properti fixed yang diberikan seperti tombol lihat item, daftar item, dan logout. Lalu meng-override class Widget atau parent dari abstract class StatelessWidget untuk menampilkan tampilan yang dinginkan.