import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class CartCounter extends StatefulWidget {
  const CartCounter({super.key});

  @override
  State<CartCounter> createState() => _CartCounterState();
}

class _CartCounterState extends State<CartCounter> {
  int numOfItems = 1;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () {
            setState(() {
              if (numOfItems > 1) {
                numOfItems--;
              }
          });
        },
          child: const Icon(Icons.remove)
        ),
        const SizedBox(width: defaultPadding),
         Padding(
          padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Text(
            numOfItems.toString().padLeft(2, "0"),
            style: const TextStyle(
              fontSize: 18,
              color: textColor
            ),
          ),
        ),
        const SizedBox(width: defaultPadding),
        OutlinedButton(
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            )
          ),
          onPressed: () {
            setState(() {
              numOfItems++;
            });
          },
           child: const Icon(Icons.add)
        ),
      ],
    );
  }
}