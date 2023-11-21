import 'package:flutter/material.dart';
import 'package:harta_karun/widgets/left_drawer.dart';
import 'package:harta_karun/widgets/shop_card.dart';

class MyHomePage extends StatelessWidget {
    MyHomePage({Key? key}) : super(key: key);

    final List<ShopItem> items = [
      ShopItem("Lihat Item", Icons.checklist,Color.fromARGB(255, 243, 128, 33)),
      ShopItem("Tambah Item", Icons.add_shopping_cart,Color.fromARGB(232, 234, 191, 0)),
      ShopItem("Logout", Icons.logout,Colors.red),
    ];
    
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Harta Karun',
          ),
          backgroundColor: Color.fromARGB(255, 100, 49, 6),
          foregroundColor: Colors.white,
        ),
        // Masukkan drawer sebagai parameter nilai drawer dari widget Scaffold
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
                    'Harta Karun', // Text yang menandakan toko
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
                children: items.asMap().entries.map((entry) {
                  int index = entry.key;
                  ShopItem item = entry.value;
                  Color backgroundColor = Colors.blue;

                  // Berikan warna yang berbeda berdasarkan indeks
                  if (index == 0) {
                    backgroundColor = const Color.fromARGB(255, 243, 128, 33); // Warna "Lihat Item"
                  } else if (index == 1) {
                    backgroundColor = Color.fromARGB(232, 234, 191, 0); // Warna "Tambah Item"
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