import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavButton extends StatelessWidget {
  const FavButton({super.key, required this.product});

// klo bentuknya kek gini, itu inisialisasi.
  final Product product;
/* klo kek gini deklarasi
final Product product;
int quantity */

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final wishlistProvider = Provider.of<WishlistProvider>(context);
    // <>itu artinya generic. tandanya kita cuma ngenalin trs langsung bisa dipake

// buat mriksa apakah produk ad di wishlist atau blm
    final isFavorite = wishlistProvider.wishlistItem.containsKey(
      product.id.toString()
    );
    
    return IconButton(
      onPressed: () {
        if (isFavorite) {
          //untuk menghapus item dari wishlist via tombol fav
          wishlistProvider.removeItemFromFav(product.id.toString());
          } else {
            wishlistProvider.addItemToFav(
              product.id.toString(),
              product.title,
              product.price,
              product.image,
              );
          }
      },
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? Colors.red : Colors.grey,
      ),
    );
  }
}