import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
// import 'package:e_commerce/ui/detail/detail_screen.dart';
import 'package:e_commerce/ui/home/components/categories.dart';
import 'package:e_commerce/ui/home/components/items_card.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_svg/flutter_svg.dart';

class CatalogueScreen extends StatelessWidget {
  const CatalogueScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0, // menghilangkan efek bayangan, biar z nya 0
        actions: [
          IconButton(
            onPressed: () {}, //ini dummy function biar ga error, itu () buat function nya dan {} buat blok kode nya
                              //tpi blom jelas klo di klik bakal melakukan function apa.
            icon: const Icon(Icons.search)
          ),
          IconButton(
            onPressed: () {}, //ini dummy function biar ga error, itu () buat function nya dan {} buat blok kode nya
                              //tpi blom jelas klo di klik bakal melakukan function apa.
            icon: const Icon(Icons.shopping_cart_checkout_outlined)
          )
        ],
      ),
      body:  Column(
        crossAxisAlignment: CrossAxisAlignment.start, //buat lawan arah sama default
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Text(
              "Women",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30
              ),
            ),
          ),
          const Categories(), //buat nampilin view pager
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: GridView.builder( //main axist bakal selalu ngikutin parent nya coy || gridview itu kembaan listview, klo list mah kan gitu bisa row ama col, klo grid bentuk nya kotak2
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount( //griddelegate = mengatur tata letak grid. //ngebungkus widget biasa biar bisa ditempatin di custom scrollview(lebih banyak opsi dari slider) //cross itu sebaliknya dri main, cross nya row brarrti column, main nya ttp row, dan sebaliknya.
                  crossAxisCount: 2, //jarak horizontal
                  mainAxisSpacing: defaultPadding, 
                  crossAxisSpacing: defaultPadding,
                  childAspectRatio: 0.75 //perbandingan tinggi dan lebar tiap item
                ), 
                itemCount: product.length,  // nampilin sesuai jumlah item di list
                itemBuilder: (context, index) => ItemsCard(
                  product: product[index], 
                  press: () => Navigator.push(
                    context,
                    MaterialPageRoute(  //buat pindah halaman baru
                      builder: (context) => const CatalogueScreen() //const DetailScreen()
                    )
                  )
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}