import 'package:e_commerce/state-management/wishlist_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final wishlistProvider = Provider.of<WishlistProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Wishlist"),
      ),
      body: wishlistProvider.wishlistItem.isEmpty
      ? const Center(child: Text("Your wishlist is Empty"))
      : ListView.builder(
        itemCount: wishlistProvider.wishlistItem.length,
        itemBuilder: (context, index) {
          // ignore: non_constant_identifier_names
          final WishlistItem = wishlistProvider.wishlistItem.values.toList()[index];
          return Card(
            margin: const EdgeInsets.symmetric(
              vertical: 5,
              horizontal: 10
            ),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(WishlistItem.image),
              ),
              title: Text(WishlistItem.title),
              trailing: IconButton(
                onPressed: () {
                  wishlistProvider.removeItemFromFav(WishlistItem.id);
                }, 
                icon: const Icon(Icons.delete)
              )
            ),
          );
        }
      )
    );
  }
}