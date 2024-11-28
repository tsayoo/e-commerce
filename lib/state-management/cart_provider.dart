import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int price;
  final String image;
  int quantity;

  //ini buat nyimpe data apa aja yg bakal kita pake dri catalog ke keranjang
  CartItem({
    required this.id, 
    required this.title, 
    required this.price,
    required this.image,
    this.quantity = 1,
  });
}

//NAH NAON IEU?? bedanya extend ama with?
//with tuh buat pke fitu2 tertentu
//extend tuh pewarissan, jdi sungsi/fitur utama nya bakal terwariskan atau kepake
//mixin ama mixins apalagi cba? ini buat klo kita mw nerapin sebuah FP (Functional Programming)

//buat tau apa perbedaan antara OOP dan FP
class CartProvider with ChangeNotifier {
  //1 setter bisa dibuat beberapa getter
  final Map<String, CartItem> _items = {};

  // setter itu private 
  // getter itu public dan bisa diakses di file manapun asalkan dikenalkan providernya

  //getter 1
  Map<String, CartItem> get items => _items;

  final Map<String, int> _quantities = {};
  
  int getQuantity(String productId) => _quantities[productId] ?? 1;

  //getter 2
  //ni beda nih, fungsianya ngehandle perhitungan jumlah total harga
  //yang ada di cart
  int get totalPrice {
    return _items.values.fold(
      // inisial status sebelum operasi matematika dilakukan 
      0,
      // zero itu nilai default
      (sum, item) => sum + item.price * item.quantity, //sum klo di excel buat nambahin column  //sum itu sebenarnya nol //sum itu buat ngasih tau adanya proses pertambahan
      // bisa aja diganti number, soalnya itu cuma buat deklarasi matematika
    );
  }

  void updateQuantity(String productId, int quantity) {
    _quantities[productId] = quantity;
    notifyListeners();
  }

  void addItems(String id, String title , int price, String image, int quantity) {
    // menambahkan produk ke dlm keranjang sesuai jumlah yang ditentukan
    if (_items.containsKey(id)) {
      _items[id]!.quantity += quantity; 
    } else {
        _items[id] = CartItem(id: id, title: title, price: price, image: image, quantity: 1);
        // put if absent dipake klo ga main dgn quantitas
    }
    notifyListeners();
  } 

  //ini buat ngehapus
  void removeItems(String id) {
    _items.remove(id);
    notifyListeners();
//     if (_items.containsKey(id)) {
//       // kurangi kuantitas item
//       _items[id]!.quantity--;

// // jika kuantitas item 0, hapus item dari cart
//    if (_items[id]!.quantity <= 0) {
//     _items.remove(id);
//    }
//   }
//     notifyListeners();
  }
}