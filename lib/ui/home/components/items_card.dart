//item itu untuk mendefinidiksn bagaiman asebuah objek akan terjadi
//menjadikan semua object reusable

import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';
import 'package:e_commerce/consts.dart';

class ItemsCard extends StatelessWidget {
  const ItemsCard({super.key, required this.product, required this.press});

  final Product product;//ini itu sub class dari anak anak yg punya banyak data
  final VoidCallback press; //mengasih sebuah feed back ke user



  //mvvm adalah model view-view model
  //model itu detail data
  //item itu untuk mendefinidiksn bagaiman sebuah objek akan terjadi
  //menjadikan semua object reusable
  //ui sama view sama
  
   @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press, // Memanggil fungsi press saat ditekan
      child: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(defaultPadding),
              decoration: BoxDecoration(
                color: product.color,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.asset(product.image),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: defaultPadding),
            child: Text(
              product.title,
              style: const TextStyle(color: textColor),
            ),
          ),
          Text("Rp ${product.price}")
        ],
      ),
    );
  }
}