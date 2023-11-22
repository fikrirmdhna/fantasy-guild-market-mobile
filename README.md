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

# Tugas 8

<details>
<summary>Read More</summary>

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
</details>

# Tugas 9
## Membuat halaman login di Flutter
Membuat file login.dart di dalam folder screens, yang berisi, seperti [ini](lib/screens/login.dart)

## Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter
1. Jalan kan perintah `python3 manage.py startapp authentication` untuk membuat app baru dari proyek Django yang lalu dan menambahkannya ke dalam routing dan INSTALLED_APPS di settings.py folder proyek.

2. Install dependencies `pip install django-cors-headers` di dalam proyek Django dan tambahkan `corsheaders` ke INSTALLED_APPS dan `corsheaders.middleware.CorsMiddleware` pada settings.py folder proyek. 

3. Lalu tambahkan kode berikut di bagian bawah file settings.py dalam folder proyek:
    ```python
    CORS_ALLOW_ALL_ORIGINS = True
    CORS_ALLOW_CREDENTIALS = True
    CSRF_COOKIE_SECURE = True
    SESSION_COOKIE_SECURE = True
    CSRF_COOKIE_SAMESITE = 'None'
    SESSION_COOKIE_SAMESITE = 'None'
    ```
4. Di dalam authentication/views.py isi kode dengan:
    ```python
    import json
    from django.shortcuts import render
    from django.contrib.auth import authenticate, login as auth_login, logout as auth_logout
    from django.contrib.auth.models import User
    from django.http import JsonResponse
    from django.views.decorators.csrf import csrf_exempt

    @csrf_exempt
    def register(request):
        if request.method == "POST":
            input = json.loads(request.body)
            username = input['username']
            password = input['password']

            if User.objects.filter(username=username).exists():
                return JsonResponse({"status": False, "message": "Username is already found!"}, status=400)
            
            user = User.objects.create_user(username = username, password = password)
            user.save()
            
            return JsonResponse({
                "status": True,
                "message": "Success!"
            }, status=200)
        
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)

    @csrf_exempt
    def logout(request):
        username = request.user.username

        try:
            auth_logout(request)
            return JsonResponse({
                "username": username,
                "status": True,
                "message": "Logout berhasil!"
            }, status=200)
        except:
            return JsonResponse({
            "status": False,
            "message": "Logout gagal."
            }, status=401)
    ```

5. Dalam proyek Flutter jalankan perintah `flutter pub add provider` dan `flutter pub add pbp_django_auth`.

6. Ubah main.dart menjadi seperti [ini](lib/main.dart).

7. install dependensi `flutter pub add http` dan tambahkan kode `<uses-permission android:name="android.permission.INTERNET" />` pada `android/app/src/main/AndroidManifest.xml` untuk memberikan akses internet.

## Membuat model kustom sesuai dengan proyek aplikasi Django
1. Membuka `localhost:8000/json` proyek Django dan copy paste semua isi ke web (Quicktype)[https://app.quicktype.io]. Ubah nama class sesuai dengan yang diperlukan dan ubah ke dalam bahasa dart lalu copy code tersebut.

2. Dalam proyek Flutter tambahkan folder models di dalam folder lib, lalu buat file product.card dan paste code yang sudah di copy sebelumnya.

## Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON
Membuat file list_product.dart di dalam folder screens dan hanya menampilkan name, amount, dan description dari product yang ada, seperti [ini](lib/screens/list_product.dart).

## Membuat halaman detail dari setiap product di dalam list_product.dart
1. Membuat file detail_product.dart di dalam folder screens.

2. Membuat StatelessWidget untuk menampilkan detail setiap data Product setelah di fetch dan diiterate, seperti [ini](lib/screens/detail_product.dart).

## Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? 
Ya bisa, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Metode ini disebut sebagai dynamic JSON parsing. Dalam hal ini, data JSON diurai langsung ke dalam struktur data yang sesuai di dalam bahasa pemrograman kita tanpa harus membuat model terlebih dahulu. Ini sering digunakan ketika struktur data tidak diketahui sebelumnya atau ketika kita ingin fleksibilitas dalam menangani berbagai format JSON.

## Fungsi dari CookieRequest 
CookieRequest dapat digunakan untuk mengirim permintaan HTTP yang menyertakan cookie. Saat autentikasi dikelola atau sesi di aplikasi Flutter, membagikan instance CookieRequest ke semua komponen memastikan bahwa informasi cookie terjaga dan dapat digunakan secara konsisten di seluruh aplikasi. Ini penting dalam aplikasi yang melibatkan autentikasi, di mana keberlanjutan sesi seringkali memerlukan konsistensi dalam penggunaan cookie.

## Mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter
1. Melakukan fetch data secara async dengan dependensi yang sudah diinstall sebelumnya, seperti:
    ```dart
    Future<List<Products>> fetchProduct(request) async {
        // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
        // melakukan decode response menjadi bentuk json
        var data = await request.get('http://127.0.0.1:8000/get-product/');  
        // melakukan konversi data json menjadi object Products
        List<Products> listProduct = [];
        for (var d in data) {
            if (d != null) {
            listProduct.add(Products.fromJson(d));
            }
        }
        return listProduct;
    }
    ```

2. Dan menampilkan data menggunakan widget FutureBuilder.

## Mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter
1. User mengisi data akun, yaitu `username` dan `password`, di halaman `LoginPage`.
2. Setelah menekan tombol login, fungsi `login` pada objek `CookieRequest` dipanggil, yang kemudian mengirimkan permintaan HTTP ke URL endpoint proyek Django.
3. Pada Django, proses autentikasi dilakukan, seperti contoh penggunaan kode `user = authenticate(username=username, password=password)` dalam `views.py` yang terkait dengan autentikasi.
4. Setelahnya, dilakukan pengecekan apakah `user` tidak sama dengan `None` dan apakah `user` aktif (`user.is_active`).
5. Kembali ke aplikasi Flutter, jika kondisi `request.loggedIn` terpenuhi, pengguna akan diarahkan ke halaman `MyHomePage`.

## Fungsi dari widget - widget yang digunakan dalam tugas ini
| Widget | Fungsi |
| :-------------: | :-------------: |
| **FutureBuilder** | widget untuk menggunakan async function |
| **ListView.builder** | widget untuk menampilkan data sebagai list dengan fitur scroll |
| **TextField** | widget untuk tempat menginput suatu teks |
| **Column** | widget untuk menyusun isinya secara vertikal |
| **Navigator** | widget untuk menavigasi antar screen |
| **Scaffold** | widget yang mendasari struktur dasar aplikasi |
| **SizedBox** | widget untuk memberikan batasan ukuran widget di dalamnya |