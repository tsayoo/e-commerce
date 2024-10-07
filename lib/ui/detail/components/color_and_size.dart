import 'package:e_commerce/consts.dart';
import 'package:e_commerce/models/products.dart';
import 'package:flutter/material.dart';

class ColorAndSize extends StatelessWidget {
  const ColorAndSize({super.key, required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, 
            children: [
              Text("Color"),
              Row(
                children: [
                  ColorPicker(
                    color: Color(0xFF3D82AE), 
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFFF8C078), 
                    isSelected: true,
                  ),
                  ColorPicker(
                    color: Color(0xFF989493), 
                    isSelected: true,
                  )
                ],
              )
            ],
          ),
        ),
        Expanded(
          // other way to showing and modifying the text
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Size",
                style: TextStyle(color: textColor),
              ),
              RichText( // kalo text adalah superclass kalo textspan  adalah subclass dari superclass textrich.
            text: TextSpan(
              style: const TextStyle(color: textColor),
              children: [
                const TextSpan(text: "Size"),
                TextSpan(
                  text: "${product.size} cm",
                  style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(fontWeight: FontWeight.bold)
                )
              ]
            ),
          )
            ],
          )
        )
      ],
    );
  }
}

class ColorPicker extends StatelessWidget {
  const ColorPicker({super.key, required this.color, required this.isSelected});

  final Color color;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(
        top: defaultPadding,
        right: defaultPadding
      ),
      padding: const EdgeInsets.all(2.5),
      width: 20,
      height: 20,
      // modifikasi border utk color picker
      decoration: BoxDecoration(
        shape: BoxShape.circle, // bentuk
        border: Border.all( //mau ngasih bayangan disekeliling lingkaran
          color: isSelected ? color : Colors.transparent
        )
      ),

      child: DecoratedBox( //pke decoratedbox biar bisa pake sub class yg ada di boxdecoration, biar variatif lgi
      //modif utk colorpickernya
        decoration: BoxDecoration( //bedanya klo decoratedbox bisa manggil widget, gak terbatas.
          color: color,
          shape: BoxShape.circle
        )
      ),
    );
  }
}
 //edgeinsets vertycal bikin jarak vertikal/horixontal
 //klo yg only itu bisa nentuin jaraknya tuh mau top, left, bot, atau semua