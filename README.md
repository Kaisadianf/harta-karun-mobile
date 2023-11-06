**Nama   : Kaisa Dian Ferdinand**

**NPM    : 2206816494**

**Kelas  : PBP C**

# TUGAS 7

### 1. Apa perbedaan utama antara stateless dan stateful widget dalam konteks pengembangan aplikasi Flutter?
- **Stateless Widget**, dapat diilustrasikan seperti foto yang tidak bisa berubah. Misalnya, jika kita memiliki gambar pemandangan, itu akan tetap sama sepanjang waktu, tidak peduli apa yang terjadi. **Stateless widget** bekerja seperti itu, mereka adalah _widget_ yang tidak dapat mengalami perubahan setelah kita membuatnya. Mereka ideal untuk hal-hal yang statis, seperti `teks` atau `icon`.
- Sebaliknya, **Stateful Widget**, dapat digambarkan sebagai radio yang bisa diubah. Jika kita menyetel stasiun radio ke satu saluran, kita bisa menggantinya kapan saja. **Stateful widget** memiliki keadaan yang bisa berubah selama hidup aplikasi. Jadi, kita bisa memperbarui tampilan _widget_ sesuai dengan perubahan keadaan. Mereka berguna untuk hal-hal yang perlu berinteraksi dengan pengguna, seperti `formulir input` atau `daftar` yang bisa digulir.

### 2. Sebutkan seluruh widget yang kamu gunakan untuk menyelesaikan tugas ini dan jelaskan fungsinya masing-masing.
Untuk menyelesaikan tugas ini dalam Flutter, saya membutuhkan beberapa komponen dasar yang membantu membangun _interface_ aplikasi. Berikut beberapa komponen tersebut:
1. Widget `Material` digunakan untuk memberikan elemen-elemen tampilan latar belakang yang sesuai dengan desain Material. Dalam tugas ini, saya menggunakannya untuk memberikan warna latar belakang pada kartu.
2. `InkWell` adalah widget yang mengubah area menjadi responsif terhadap sentuhan. Ketika pengguna menyentuhnya, itu akan memicu tindakan tertentu. Di tugas ini, saya menggunakannya untuk menampilkan `Snackbar` ketika kartu diklik.
3. Widget `SnackBar` digunakan untuk menampilkan pesan sementara, seperti notifikasi, di bagian bawah layar setelah suatu tindakan dilakukan. Misalnya, pesan "Kamu telah menekan tombol {item.name}" ditampilkan sebagai `Snackbar` ketika kartu diklik.
4. Widget `Container` digunakan untuk mengelompokkan dan mengatur widget lain dalam satu kotak. Ini dapat digunakan untuk mengatur properti seperti `padding`, `margin`, dan sebagainya.
5. Widget `Icon` digunakan untuk menampilkan _icon_. Saya dapat mengkonfigurasi _icon_, seperti warna dan ukuran _icon_.
6. Widget `Text` digunakan untuk menampilkan teks. Saya dapat mengatur properti seperti warna dan gaya teks.
7. Widget `Column` digunakan untuk mengelompokkan _widget_ dalam tata letak vertikal. Dalam tugas ini, saya menggunakannya untuk menampilkan _icon_ dan teks dalam kartu secara vertikal.
8. Widget `GridView.count` digunakan untuk membuat tata letak grid dengan jumlah kolom yang ditentukan. Di sini, saya menggunakannya untuk menampilkan kartu dalam tata letak grid dengan tiga kolom.
9. Widget `Scaffold` digunakan untuk membuat kerangka dasar untuk halaman, yang mencakup AppBar dan body. Ini menyediakan struktur yang mengelola navigasi, tombol kembali, dan berbagai fitur umum lainnya dalam aplikasi **Flutter**.
10. Widget `AppBar` digunakan untuk membuat bilah atas layar yang menampilkan judul aplikasi dan mungkin juga tombol-tombol lain.
11. Widget `SingleChildScrollView` digunakan untuk mengelola tata letak yang dapat di-_scroll_. Ini memungkinkan konten di dalamnya digulir jika kontennya terlalu panjang.
12. Widget `Padding` digunakan untuk memberikan jarak antara widget dalam tata letak, sehingga saya dapat mengatur tata letak dengan lebih baik.

## 3. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step (bukan hanya sekadar mengikuti tutorial)
- Saya men-_generate_ proyek **Flutter** baru dengan nama `harta_karun`, kemudian masuk ke dalam direktori proyek tersebut dengan menjalankan,
```dart
flutter create <APP_NAME>
cd <APP_NAME>
```
pada Terminal atau Command Prompt.
- Selanjutnya saya melakukan `git init` pada `root folder` dan `add`-`commit`-`push` proyek ke sebuah repositori di GitHub.
~~~
https://github.com/Kaisadianf/harta-karun-mobile 
~~~
- Lalu saya menambahkan file baru bernama `menu.dart` dalam direktori `harta_karun/lib` dan mengisinya dengan code berikut:
```dart
import 'package:flutter/material.dart';

class ShopItem {
  final String name;
  final IconData icon;

  ShopItem(this.name, this.icon);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;
  final Color backgroundColor;

  const ShopCard(this.item, this.backgroundColor, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor, 
      child: InkWell(
        onTap: () {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}")));
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

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key}) : super(key: key);
  final List<ShopItem> items = [
    ShopItem("Lihat Item", Icons.checklist),
    ShopItem("Tambah Item", Icons.add_shopping_cart),
    ShopItem("Logout", Icons.logout),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Harta Karun',
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0), 
          child: Column(
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                child: Text(
                  'Welcome to Harta Karun!', 
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                primary: true,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                shrinkWrap: true,
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  ShopItem item = entry.value;
                  Color backgroundColor = Colors.blue;

                  // Berikan warna yang berbeda berdasarkan indeks
                  if (index == 0) {
                    backgroundColor = const Color.fromARGB(255, 243, 128, 33); // Warna "Lihat Item"
                  } else if (index == 1) {
                    backgroundColor = Color.fromARGB(232, 255, 217, 47); // Warna "Tambah Item"
                  } else if (index == 2) {
                    backgroundColor = Colors.red; // Warna "Logout"
                  }
                  // Iterasi untuk setiap item
                  return ShopCard(item, backgroundColor,
                      key: ValueKey<int>(index));
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```
- Kemudian saya mengubah isi file `main.dart` dengan code berikut:
```dart
import 'package:flutter/material.dart';
import 'package:harta_karun/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
```