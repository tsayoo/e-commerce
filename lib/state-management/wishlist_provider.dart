import 'package:flutter/material.dart';

class WishlistItem {
  final String id;
  final String title;
  final int price;
  final String image;

  WishlistItem({
    required this.id, 
    required this.title, 
    required this.price, 
    required this.image,});
}

class WishlistProvider with ChangeNotifier {
  final Map<String, WishlistItem> _wishlistItems = {};

  Map<String, WishlistItem> get wishlistItem => _wishlistItems;

  int get itemCount => wishlistItem.length;

  void addItemToFav(String id, String title, int price, String image) {
    if (_wishlistItems.containsKey(id)) {
      //jika sudah ada item yang ditambahkan ke keranjang
      return;
    } else {
      _wishlistItems.putIfAbsent(
        id, 
        () => WishlistItem(id: id, title: title, price: price, image: image)
      );
    }
    notifyListeners();
  }
  //ini buat hapus
  void removeItemFromFav(String id) {
    _wishlistItems.remove(id);
    notifyListeners();
  }
  //ini buat hapus ampe cache2 nya
  void clearWishlist() {
    _wishlistItems.clear();
    notifyListeners();
  }
}