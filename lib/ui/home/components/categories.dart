import 'package:e_commerce/consts.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}
// state atas untuk menyimpen apa yg digunakan oleh super class
//state bawah buat variable variable kecil

class _CategoriesState extends State<Categories> {
  //list itu kurung kotak []
  //kalo map itu kurung kurawal{}
  //kalo ini list, pengembailan nya juga harus list, gabisa langsung dipanggil
  // untuk inisiali view pager
  List<String> categories = [ //map itu kurawal, list itu kurung kotak
    "Food", 
    "Kit", 
    "Accessories", 
    "Grooming"
  ];

  int selectedIndex =0; //untuk ngasih tau selected index dimulai dari 0, ngasih tau pertama itu mulai dari mana, ya pertama ito zero lahh

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: defaultPadding), //kebawah, dibuat list dulu
      child: SizedBox(
        //sizedbox untuk nambahin dia ada jaraknya antara viewpager dan widget nya
        height: 25,
        //listview dibuat untuk ngslide horizontal, utk create a scrollable linear array horizontal
        child: ListView.builder(
          scrollDirection: Axis.horizontal,  //ini buat nge scroll nya ke horizontal atau row
            //builder utk menampung data, untuk nge build ui nya
            itemCount: categories.length, //dari ney
            itemBuilder: (context, index) =>
                _buildCategory(index) //ini buat nampung/membangun data yg bakal
            ),
      ),
    );
  }

  GestureDetector _buildCategory(int index) { //buat nyesuaiin dengan device nya
    return GestureDetector(
      //gesture detector itu kayak buat deteksi pergerakan menggunakan pen, tapi bisa juga tidak menggunakan pen
      //Boiler Plate Code itu kalo itu udh di defind, trus kita defind ulang, jadi numpuk2
      // index itu buat data array
      onTap: () {
        setState(() { //buat nampilin perubahan
          selectedIndex =
              index; //buat index nya itu menjadi zero,di default in index nya jadi 0 dibagian sebelm override
        });
      },
      // kalo to many positional argument berarti coba tambahin child, pokoknya hirarq nya salah

      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: selectedIndex == index ? primaryColor : secondaryColor //ini itu if else  Warna titik aktif dan tidak aktif
              ),
            ),
            Container( //buat yg garis dibawah teks
              margin: const EdgeInsets.only(
                top: 3
              ),
              height: 2,
              width: 30,
              color: selectedIndex == index ? primaryColor : secondaryColor,
            )
          ],
        ),
      ),
    );
  }
}