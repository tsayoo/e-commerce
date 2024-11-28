import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartCounter extends StatefulWidget {

  final Product product;
  // adalah sebuah callback utk kirim quantity ke add to cart
  // final Function(int) onQuantityChanged;

  const CartCounter({super.key, required this.product});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  // bikin default jumlah item jadi 1
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);

    return Row(
      children: <Widget>[
        // logika utk decrement (-)
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          onPressed: quantity > 1
          ? () {
            setState(() {
              // set state hanya utk inisialisasi awal atau langkah yang mw diam
              // akan mengurangi 
              quantity--;
          });  
          // utk ngirim quantity terbaru 
          // widget.onQuantityChanged(quantity);
          cartProvider.removeItems(widget.product.id.toString());
          }
          // null akan mendisable tombol jika quantitas kurang dari 1
          : null,
          child: const Icon(Icons.remove),
        ),   
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            quantity.toString().padLeft(2, "0"), //padleft utk menambahkan angka 0 di depan jadi 2 itu biar ada dua angka, trs klo misal cuma ad 1 digit bakalan ditambahin angka 0 didepannya
            style: const TextStyle(fontSize: 18, color: textColor),
          ),
          ),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(35, 35),
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          child: const Icon(Icons.add),
          onPressed: () {
            setState(() {
              // utk menambah scera lokal
              quantity++;
          }); 
          // widget.onQuantityChanged(quantity);
          // - pendeklarasian info yg akan dikirim ke add to cart (tombol keranjang)
          // - merupakan starting point dmn quantitas akan dibawa oleh tombol + ke halaman kranjang
          // - ini yang nyambungin angka yang ad di cart counter ke halaman keranjang. jembatannya tombol add to cart
          cartProvider.addItems(
            widget.product.id.toString(),
            widget.product.title,
            widget.product.price,
            widget.product.image,
            1
            );
          }
          )
      ],
    );
  }
}