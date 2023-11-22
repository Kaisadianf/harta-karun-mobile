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

# TUGAS 9

### 1. Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Iya, kita bisa melakukan pengambilan data JSON tanpa membuat model terlebih dahulu. Hal ini umumnya disebut sebagai "_parsing_" data JSON. Dalam beberapa kasus, seperti ketika struktur data JSON cukup sederhana, kita bisa menggunakan _library_ atau fungsi _built-in_ untuk mengurai JSON dan mendapatkan nilai-nilainya. Namun, untuk aplikasi yang lebih kompleks atau memiliki struktur data yang rumit, menggunakan model dapat memberikan manfaat seperti validasi otomatis dan kemudahan penggunaan.

Keputusan antara penggunaan model atau tidak juga tergantung pada kebutuhan aplikasi. Jika struktur data cukup sederhana dan tidak ada kebutuhan validasi khusus, tanpa model bisa lebih sederhana. Namun, jika kita ingin menjaga keamanan dan validasi data dengan lebih baik, membuat model bisa menjadi pilihan yang lebih baik.

### 2. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.
`CookieRequest` adalah suatu objek atau kelas yang dirancang untuk menangani operasi terkait _cookie_ atau autentikasi saat berinteraksi dengan web service atau server. Dengan menambahkan `provider` seperti dalam program, instance `CookieRequest` akan dibagikan ke semua komponen dalam aplikasi.

Penggunaan Objek CookieRequest dapat diakses di berbagai bagian aplikasi dengan melakukan langkah-langkah seperti pada tutorial 8, dan kemungkinan besar dapat digunakan untuk menangani autentikasi atau operasi terkait _cookie_ saat berinteraksi dengan web service Django.Dengan cara ini, integrasi sistem autentikasi pada Flutter dengan Django dapat dilakukan dengan memanfaatkan package `pbp_django_auth` dan `provider`, serta dengan menyediakan instance `CookieRequest` yang dibagikan ke seluruh komponen aplikasi.

### 3. Jelaskan mekanisme pengambilan data dari JSON hingga dapat ditampilkan pada Flutter.
Mekanisme umumnya melibatkan penggunaan library seperti `dart:convert` untuk mengonversi string **JSON** menjadi objek **Dart**. Proses ini biasanya terdiri dari:
- Mengambil response JSON dari server.
- Menggunakan `json.decode()` untuk mengonversi string JSON menjadi objek Dart.
- Menggunakan nilai-nilai tersebut untuk mengisi model atau struktur data yang sesuai.
- Menampilkan data tersebut di antarmuka pengguna Flutter menggunakan _widget_ seperti `ListView`, `Text`, dll.

### 4. Jelaskan mekanisme autentikasi dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
Proses autentikasi antara **Flutter** dan **Django** antara lain, ialah :
- Menggunakan metode autentikasi yang sesuai (misalnya, JWT).
- Mengirimkan data login dari Flutter ke server Django.
- Django memproses dan memvalidasi data login.
- Apabila sukses, server mengembalikan token yang digunakan oleh Flutter untuk otentikasi di masa mendatang.
- Kita menyimpan token dan menggunakannya untuk setiap permintaan ke server.

### 5. Sebutkan seluruh widget yang kamu pakai pada tugas ini dan jelaskan fungsinya masing-masing.
Berikut adalah beberapa widget yang digunakan dalam tugas ini:

1. **FutureBuilder:**
   - **Digunakan di:** `_ItemPageState` pada `ItemPage`.
   - **Fungsinya:** Menangani pengambilan data dari server secara asynchronous dan membangun antarmuka berdasarkan status future.
2. **ListView.builder:**
   - **Digunakan di:** `_ItemPageState` pada `ItemPage`.
   - **Fungsinya:** Menampilkan daftar item secara dinamis sesuai dengan data yang diterima dari server Django.
3. **TextField:**
   - **Digunakan di:** `_LoginPageState` pada `LoginPage`, `_ShopFormPageState` pada `ShopFormPage`, dan `_ShopCardState` pada `ShopCard`.
   - **Fungsinya:** Mengambil input teks dari pengguna, seperti username dan password pada halaman login, serta nama, jumlah, dan deskripsi pada formulir penambahan item belanja.
4. **ElevatedButton:**
   - **Digunakan di:** `_LoginPageState` pada `LoginPage` dan `_ShopFormPageState` pada `ShopFormPage`.
   - **Fungsinya:** Membuat tombol yang dapat di-klik untuk mengeksekusi aksi tertentu, seperti tombol "Login" dan "Save".
5. **http (package):**
   - **Digunakan di:** `_ItemPageState` pada `ItemPage`.
   - **Fungsinya:** Untuk melakukan permintaan HTTP ke server Django dalam rangka pengambilan data item.
6. **json (package):**
   - **Digunakan di:** `models.dart`.
   - **Fungsinya:** Mengonversi data JSON menjadi objek Dart dan sebaliknya.
7. **Navigator:**
   - **Digunakan di:** `_ShopCardState` pada `ShopCard`.
   - **Fungsinya:** Untuk melakukan navigasi antar halaman saat suatu aksi tertentu, seperti menambah item, melihat daftar item, dan melakukan logout.
8. **Scaffold:**
   - **Digunakan di:** `LoginPage`, `ShopFormPage`, `ShopCard`, dan `ItemPage`.
   - **Fungsinya:** Menyediakan struktur dasar untuk halaman, seperti AppBar, Drawer, dan body.
9. **AppBar:**
   - **Digunakan di:** `LoginPage`, `ShopFormPage`, `ShopCard`, dan `ItemPage`.
   - **Fungsinya:** Menampilkan AppBar (bilah atas) pada setiap halaman dengan judul yang sesuai.
10. **Drawer:**
   - **Digunakan di:** `MyApp` (root), `ItemPage`, dan `ShopCard`.
   - **Fungsinya:** Menyediakan menu geser (Drawer) untuk navigasi antar halaman.
11. **DrawerHeader:**
   - **Digunakan di:** `LeftDrawer`.
   - **Fungsinya:** Menampilkan header khusus pada Drawer.
12. **Text:**
   - **Digunakan di:** Berbagai tempat seperti `DrawerHeader`, `ShopCard`, dan `ShopItem`.
   - **Fungsinya:** Menampilkan teks sesuai kebutuhan.
13. **Padding:**
   - **Digunakan di:** Berbagai tempat seperti `LoginPage`, `ShopFormPage`, `ShopCard`, dan `ItemPage`.
   - **Fungsinya:** Memberikan ruang padding di sekitar elemen-elemen widget.
14. **Align:**
   - **Digunakan di:** `ShopFormPage`.
   - **Fungsinya:** Memposisikan widget-child ke suatu posisi di dalam parent widget.
15. **InkWell:**
   - **Digunakan di:** `ShopCard`.
   - **Fungsinya:** Memberikan efek respons pada sentuhan (touch) ke suatu area dan menangani aksi yang sesuai.
16. **Container:**
   - **Digunakan di:** `ShopCard` dan `ItemPage`.
   - **Fungsinya:** Menyediakan wadah untuk widget lain dan dapat memiliki properti seperti margin, padding, dan warna latar.
17. **SnackBar:**
    - **Digunakan di:** Berbagai tempat seperti `ShopCard`.
    - **Fungsinya:** Menampilkan pemberitahuan singkat pada bagian bawah layar.
18. **CircularProgressIndicator:**
    - **Digunakan di:** `ItemPage`.
    - **Fungsinya:** Menampilkan indikator putaran untuk menunjukkan bahwa aplikasi sedang melakukan tugas tertentu secara asynchronous.
19. **Key:**
    - **Digunakan di:** Beberapa widget seperti `MyApp`, `LoginPage`, dan `ShopFormPage`.
    - **Fungsinya:** Memberikan kunci unik pada widget-widget tertentu.

Widget-widget tersebut bersama-sama membangun antarmuka dan logika aplikasi secara keseluruhan. Setiap widget memiliki peran spesifik dalam menyusun tampilan dan berinteraksi dengan pengguna serta server Django.

### 6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
- menghubungkan Flutter dengan project Django sebelumnya seperti dalam tutorial
- membuat file baru dalam folder baru `models/models.dart`
```dart
import 'dart:convert';

List<Item> itemFromJson(String str) => List<Item>.from(json.decode(str).map((x) => Item.fromJson(x)));

String itemToJson(List<Item> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Item {
    String model;
    int pk;
    Fields fields;

    Item({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    int amount;
    String description;

    Fields({
        required this.user,
        required this.name,
        required this.amount,
        required this.description,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        amount: json["amount"],
        description: json["description"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "amount": amount,
        "description": description,
    };
}
```

- merubah isi file `list_item.dart` dalam folder screens menjadi
```dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:harta_karun/models/models.dart';
import 'package:harta_karun/widgets/left_drawer.dart';
import 'package:harta_karun/screens/item_detail.dart';

class ItemPage extends StatefulWidget {
    const ItemPage({Key? key}) : super(key: key);

    @override
    _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
Future<List<Item>> fetchItem() async {
    // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
    var url = Uri.parse(
        'https://kaisa-dian-tugas.pbp.cs.ui.ac.id/json/');
    var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
    );

    // melakukan decode response menjadi bentuk json
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // melakukan konversi data json menjadi object Item
    List<Item> list_item = [];
    for (var d in data) {
        if (d != null) {
            list_item.add(Item.fromJson(d));
        }
    }
    return list_item;
}

@override
Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Daftar Item',
            ),
          ),
          backgroundColor: Color.fromARGB(255, 100, 49, 6),
          foregroundColor: Colors.white,
        ),
        drawer: const LeftDrawer(),
        body: FutureBuilder(
            future: fetchItem(),
            builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                } else {
                    if (!snapshot.hasData) {
                    return const Column(
                        children: [
                        Text(
                            "Tidak ada data item.",
                            style:
                                TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                        ],
                    );
                } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (_, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetailPage(item: snapshot.data![index]),
                            ),
                          );
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
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
                                Text("${snapshot.data![index].fields.amount}"),
                                const SizedBox(height: 10),
                                Text(
                                    "${snapshot.data![index].fields.description}")
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                }
            }));
    }
}
```
- membuat `item_detail.dart` dalam folder screens
```dart
import 'package:flutter/material.dart';
import 'package:harta_karun/models/models.dart';

class ItemDetailPage extends StatelessWidget {
  final Item item;

  const ItemDetailPage({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.fields.name),
        backgroundColor: Color.fromARGB(255, 100, 49, 6),
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Item Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text('Amount: ${item.fields.amount}'),
            SizedBox(height: 10),
            Text('Description: ${item.fields.description}'),
          ],
        ),
      ),
    );
  }
}
```
-membuat file `login.dart` dalam folder screens
```dart
import 'package:harta_karun/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
    runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
const LoginApp({super.key});

@override
Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Login',
        theme: ThemeData(
            primarySwatch: Colors.blue,
    ),
    home: const LoginPage(),
    );
    }
}

class LoginPage extends StatefulWidget {
    const LoginPage({super.key});

    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final TextEditingController _usernameController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context) {
        final request = context.watch<CookieRequest>();
        return Scaffold(
            appBar: AppBar(
                title: const Text('Login'),
            ),
            body: Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        TextField(
                            controller: _usernameController,
                            decoration: const InputDecoration(
                                labelText: 'Username',
                            ),
                        ),
                        const SizedBox(height: 12.0),
                        TextField(
                            controller: _passwordController,
                            decoration: const InputDecoration(
                                labelText: 'Password',
                            ),
                            obscureText: true,
                        ),
                        const SizedBox(height: 24.0),
                        ElevatedButton(
                            onPressed: () async {
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                // Cek kredensial
                                // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                                // Untuk menyambungkan Android emulator dengan Django pada localhost,
                                // gunakan URL http://10.0.2.2/
                                final response = await request.login("https://kaisa-dian-tugas.pbp.cs.ui.ac.id/auth/login/", {
                                'username': username,
                                'password': password,
                                });
                    
                                if (request.loggedIn) {
                                    String message = response['message'];
                                    String uname = response['username'];
                                    Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(builder: (context) => MyHomePage()),
                                    );
                                    ScaffoldMessenger.of(context)
                                        ..hideCurrentSnackBar()
                                        ..showSnackBar(
                                            SnackBar(content: Text("$message Selamat datang, $uname.")));
                                    } else {
                                    showDialog(
                                        context: context,
                                        builder: (context) => AlertDialog(
                                            title: const Text('Login Gagal'),
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
                            },
                            child: const Text('Login'),
                        ),
                    ],
                ),
            ),
        );
    }
}
```
- mengubah isi `shoplist_form.dart` menjadi
```dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:harta_karun/screens/menu.dart';
import 'package:harta_karun/widgets/left_drawer.dart';

class ShopFormPage extends StatefulWidget {
  const ShopFormPage({super.key});

  @override
  State<ShopFormPage> createState() => _ShopFormPageState();
}

class _ShopFormPageState extends State<ShopFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = "";
  int _amount = 0;
  String _description = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Form Tambah Item',
          ),
        ),
        backgroundColor: Color.fromARGB(255, 100, 49, 6),
        foregroundColor: Colors.white,
      ),
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
                    hintText: "Nama Item",
                    labelText: "Nama Item",
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
                      return "Nama tidak boleh kosong!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Jumlah",
                    labelText: "Jumlah",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _amount = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Jumlah tidak boleh kosong!";
                    }
                    if (int.tryParse(value) == null) {
                      return "Jumlah harus berupa angka!";
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Deskripsi",
                    labelText: "Deskripsi",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _description = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return "Deskripsi tidak boleh kosong!";
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
                          MaterialStateProperty.all(Color.fromARGB(255, 243, 128, 33)),
                    ),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                          // Kirim ke Django dan tunggu respons
                          // TODO: Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                          final response = await request.postJson(
                          "https://kaisa-dian-tugas.pbp.cs.ui.ac.id/create-flutter/",
                          jsonEncode(<String, String>{
                              'name': _name,
                              'amount': _amount.toString(),
                              'description': _description,
                              // TODO: Sesuaikan field data sesuai dengan aplikasimu
                          }));
                          if (response['status'] == 'success') {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                              content: Text("Produk baru berhasil disimpan!"),
                              ));
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(builder: (context) => MyHomePage()),
                              );
                          } else {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                  content:
                                      Text("Terdapat kesalahan, silakan coba lagi."),
                              ));
                          }
                      }
                  },
                    child: const Text(
                      "Save",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ]
          )
        ),
      ),
    );
  }
}
```
- mengubah file `shop_card.dart` menjadi
```dart
import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:harta_karun/screens/login.dart';
import 'package:harta_karun/screens/shoplist_form.dart';
import 'package:harta_karun/screens/list_item.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color;

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, Color backgroundColor, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Material(
      color: Color.fromARGB(232, 234, 191, 0),
      child: InkWell(
        // Area responsive terhadap sentuhan
        onTap: () async {
          // Memunculkan SnackBar ketika diklik
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
                content: Text("Kamu telah menekan tombol ${item.name}!")));
          // Navigate ke route yang sesuai (tergantung jenis tombol)
          if (item.name == "Tambah Item") {
            Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ShopFormPage(),
                  ));
          }
           else if (item.name == "Lihat Item") {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ItemPage()));
          }
          else if (item.name == "Logout") {
            final response = await request.logout(
                // Ganti URL dan jangan lupa tambahkan trailing slash (/) di akhir URL!
                "https://kaisa-dian-tugas.pbp.cs.ui.ac.id/auth/logout/");
            String message = response["message"];
            if (response['status']) {
              String uname = response["username"];
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message Sampai jumpa, $uname."),
              ));
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text("$message"),
              ));
            }
          }
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
- merubah isi `main.dart`
```dart
import 'package:flutter/material.dart';
import 'package:harta_karun/screens/login.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Provider(
            create: (_) {
                CookieRequest request = CookieRequest();
                return request;
            },
            child: MaterialApp(
                title: 'Harta Karun',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 100, 49, 6)),
                    useMaterial3: true,
                ),
                home: LoginPage()),
        );
    }
}
```