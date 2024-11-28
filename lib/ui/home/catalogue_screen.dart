import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/settings/profile_screen.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/ui/cart/cart_screen.dart';
import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/bottom_nav_bar.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/item_card.dart';
import 'package:e_commerce/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

class CatalogueScreen extends StatefulWidget {
  const CatalogueScreen({super.key});

  @override
  State<CatalogueScreen> createState() => _CatalogueScreenState();
}

class _CatalogueScreenState extends State<CatalogueScreen> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const CatalogueScreen(), //index 1
    const WishlistScreen(), //index 2
    const SettingsScreen(), //index 3
    const ProfileScreen() //index 4
  ];

  // function utk aksi tap pada bottom navbar
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; //maksudnya index yg muncul pertama itu index 0
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).brightness == Brightness.dark
            ? Colors.black // Warna background jika tema gelap
            : Colors.white, // Warna background jika tema terang
        elevation: 0, // menghilangkan efek bayangan, biar z nya 0
        actions: [
          IconButton(
              onPressed:
                  () {}, //ini dummy function biar ga error, itu () buat function nya dan {} buat blok kode nya
              icon: const Icon(Icons.search)),
          IconButton(
              onPressed:
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CartScreen())
                    );
                  },
              icon: const Icon(Icons.shopping_cart_checkout_outlined))
        ],
      ),
      body: _selectedIndex == 0
      ? Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, //buat lawan arah sama default
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Pets",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const Categories(), //buat nampilin view pager
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: GridView.builder(
              //main axist bakal selalu ngikutin parent nya coy || gridview itu kembaan listview, klo list mah kan gitu bisa row ama col, klo grid bentuk nya kotak2
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  //griddelegate = mengatur tata letak grid. //ngebungkus widget biasa biar bisa ditempatin di custom scrollview(lebih banyak opsi dari slider) //cross itu sebaliknya dri main, cross nya row brarrti column, main nya ttp row, dan sebaliknya.
                  crossAxisCount: 2, //jarak horizontal
                  mainAxisSpacing: defaultPadding,
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio:
                      0.75 //perbandingan tinggi dan lebar tiap item
                  ),
              itemCount: product.length, // nampilin sesuai jumlah item di list
              itemBuilder: (context, index) => ItemCard(
                  product: product[index],
                  press: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          //buat pindah halaman baru
                          builder: (context) =>
                              DetailScreen(product: product[index]) //const DetailScreen()
                          ))),
            ),
          ))
        ],
      )
      // : adalah representasi dari ternary operator
      : _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedIndex, 
        onItemTapped: _onItemTapped
      ),
    );
  }
}
