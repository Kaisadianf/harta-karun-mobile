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

# TUGAS 8

### 1. Jelaskan perbedaan antara Navigator.push() dan Navigator.pushReplacement(), disertai dengan contoh mengenai penggunaan kedua metode tersebut yang tepat!
`Navigator.push()`: Metode ini digunakan untuk menambahkan rute baru ke tumpukan rute (route stack) pada navigator. Rute baru ditambahkan ke atas rute yang ada. Pengguna masih dapat kembali ke rute sebelumnya dengan menggunakan tombol kembali.
```dart
Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);
```
`Navigator.pushReplacement()`: Metode ini juga menambahkan rute baru ke tumpukan rute, tetapi menggantikan rute yang ada pada tumpukan dengan rute baru. Ini berguna ketika Anda ingin mengganti layar sebelumnya sehingga pengguna tidak dapat kembali ke layar sebelumnya menggunakan tombol kembali.
```dart
Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => NewScreen()),
);
```

### 2. Jelaskan masing-masing layout widget pada Flutter dan konteks penggunaannya masing-masing!
- `Container` digunakan untuk mengelompokkan, mengatur, dan menghias _widget_ lain. **Konteks penggunaannya**, membungkus _widget-widget_ lain untuk mengatur tata letak atau memberikan dekorasi.
- `Row dan Column`, `Row` digunakan untuk menyusun _widget_ secara horizontal, sedangkan `Column` digunakan untuk menyusun _widget_ secara vertikal. **Konteks penggunaannya**, membuat tata letak yang mengikuti arah tertentu (horizontal atau vertikal).
- `Stack`, memungkinkan penumpukan _widget_ satu di atas yang lain. **Konteks penggunaannya**, menempatkan _widget-widget_ di atas satu sama lain, seperti _overlay_.
- `ListView`, menampilkan daftar _widget_ secara bergulir. **Konteks penggunaannya**, ,enampilkan daftar item, seperti daftar kontak atau pesan.

### 3. Sebutkan apa saja elemen input pada form yang kamu pakai pada tugas kali ini dan jelaskan mengapa kamu menggunakan elemen input tersebut!
Dalam tugas ini, elemen input pada formulir Flutter yang digunakan adalah:
1. **TextFormField untuk Nama Item:**
   - Digunakan untuk menerima input teks (nama item) dari pengguna.
   - Mendekorasi dengan `hintText`, `labelText`, dan `border`.
   - Fungsi **onChanged** digunakan untuk mengupdate variabel _name.
   - Fungsi vali**dator digunakan untuk memastikan bahwa input tidak boleh kosong.
2. **TextFormField untuk Jumlah:**
   - Digunakan untuk menerima input teks (jumlah item) dari pengguna.
   - Mendekorasi dengan `hintText`, `labelText`, dan `border`.
   - Fungsi **onChanged** digunakan untuk mengupdate variabel _amount setelah mengonversi input ke integer.
   - Fungsi **validator** memastikan bahwa input tidak boleh kosong dan harus berupa angka.
3. **TextFormField untuk Deskripsi:**
   - Digunakan untuk menerima input teks (deskripsi item) dari pengguna.
   - Mendekorasi dengan `hintText`, `labelText`, dan `border`.
   - Fungsi **onChanged** digunakan untuk mengupdate variabel _description.
   - Fungsi **validator** memastikan bahwa input tidak boleh kosong.

Penggunaan `TextFormField` memungkinkan pengguna untuk memasukkan data dengan nyaman, sementara validasi pada setiap bidang memastikan bahwa data yang dimasukkan sesuai dengan kebutuhan aplikasi.

### 4. Bagaimana penerapan clean architecture pada aplikasi Flutter?
**Clean Architecture** adalah pendekatan pengembangan perangkat lunak yang mengorganisir kode ke dalam beberapa lapisan terpisah dengan aturan dependensi yang jelas. Dalam konteks **Flutter**, penerapan **Clean Architecture** melibatkan pembagian kode menjadi tiga lapisan utama:

1. **Lapisan Presentasi (Presentation Layer)**:
- Berisi UI dan logika UI.
- Menggunakan widget Flutter untuk menampilkan tata letak.
2. **Lapisan Domain (Domain Layer)**:
- Berisi aturan bisnis dan entitas.
- Tidak tergantung pada detail implementasi seperti Flutter atau penyimpanan data.
3. **Lapisan Data (Data Layer)**:
- Bertanggung jawab untuk mengelola data, komunikasi jaringan, penyimpanan lokal, dll.
- Implementasi repository dan sumber data.

Manfaat **Clean Architecture** termasuk pemisahan konsep, pengujian yang lebih mudah, dan fleksibilitas dalam mengganti atau mengupgrade teknologi pada setiap lapisan tanpa memengaruhi yang lain. Pemisahan ini membantu menjaga kode agar bersih, terorganisir, dan mudah dipelihara.

### 5. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial)
- Membuat halaman baru pada aplikasi: Saya membuat file `shoplist_form.dart` pada direnktori `lib/screens`.

Elemen input yang saya buat adalah name, amount, dan description dengan TextFormField yang dibungkus Padding. 

Saya juga menambah tombol save untuk menyimpan input dari form.
```dart
child: const Text(
  "Save",
  style: TextStyle(color: Colors.white),
)
```

Setiap elemen input di formulir divalidasi agar tidak kosong dan sesuai data type modelnya.
```dart
validator: (String? value) { // validasi data type
  if (value == null || value.isEmpty) { // validasi input tidak kosong
    return "Error Message"; 
  }
  if (int.tryParse(value) == null) {
    return "Amount has to be a number!"; // Contoh validasi data type untuk integer
  }
  return null;
},
```

- Mengarahkan pengguna ke halaman form tambah item baru ketika menekan tombol `Tambah Item` pada halaman utama.
```dart
if (item.name == "Tambah Item") {
  Navigator.push(context,
    MaterialPageRoute(builder: (context) => const WardrobeFormPage()));
}
```
Saya menggunakan navigator pust untuk navigasi ke page forms ketika card Tambah Item ditekan.

- Memunculkan data sesuai isi dari formulir yang diisi dalam sebuah pop-up setelah menekan tombol Save pada halaman formulir tambah item baru.
Ketika pengguna menekan tombol `Save`, aplikasi akan melakukan validasi dan jika semua data benar, aplikasi akan menampilkan dialog pop-up dengan data yang sesuai dengan apa yang telah diisi pengguna dalam form tersebut. Tombol `OK` ketika ditekan, akan menutup dialog dengan memanggil Navigator.pop(context), yang menghapus AlertDialog dari tampilan. Setelah dialog ditampilkan, `_formKey.currentState!.reset()` membersihkan form, sehingga formulir bersih dari data sebelumnya.
```dart
onPressed: () {
  if (_formKey.currentState!.validate()) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Item berhasil tersimpan'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              children: [
                Text('Nama: $_name'),
                Text('Jumlah: $_amount'),
                Text('Description: $_description')
              ],),),
          actions: [
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },),],);},);
  _formKey.currentState!.reset(); }},
```

- Membuat sebuah drawer
Saya membuat file `left_drawer.dart` pada lib/widgets. 
Lalu, saya membuat 2 opsi untuk ke halaman utama dan tambah item dalam ListTile anak dari ListView.
Ketika salah satu opsi ditekan, `Navigator.pushReplacement` akan navigasi ke halaman yang sesuai.
```dart
Widget build(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        ...
        ListTile(
          leading: const Icon(Icons.home_outlined),
          title: const Text('Halaman Utama'),
          onTap: () {
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => MyHomePage(),
                ));
          },
        ),
        ListTile(
          leading: const Icon(Icons.add_box_rounded),
          title: const Text('Tambah Item'),
          onTap: () {
            Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => WardrobeFormPage(),)); 
        },),],),);}
```