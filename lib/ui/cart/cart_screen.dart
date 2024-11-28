import 'package:e_commerce/consts.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // inisialisasi provider
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
      ),
      body: cartProvider.items.isEmpty
      ? const Center(child: Text('Your cart is empty'))
      : ListView.builder(
        itemCount: cartProvider.items.length,
        itemBuilder: (context, index) { 
          final cartItem = cartProvider.items.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(cartItem.image),
              ),
              title: Text(cartItem.title),
              subtitle: Text('Quantity : ${cartItem.quantity}'),
              trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {cartProvider.removeItems(cartItem.id);},
              ),
            ),
          );
         }
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Total",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            Text(
              "${cartProvider.totalPrice}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: primaryColor
              ),
            )
          ],
        ),
      ),
    );
  }
}