// ignore: unused_import
import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

class Product {
  //ini itu untuk modelnya
  //model itu apa??
  //model itu data nya

  final String image, title, description;
  final int price, size, id;
  final Color color;

  Product({
    required this.id,
    required this.image,
    required this.title,
    required this.price,
    required this.description,
    required this.size,
    required this.color,
  }
      // this adalah, untuk manandakan bahwa object terkait hanya bisa di akses oleh class terkait
      //atau class yg sebelumnya memanggil product

      );
}


 List<Product> product = [
  Product(
      id: 1,
      title: "Pet Grooming Drying Cage",
      price: 2700000,
      size: 16,
      description: dummyText,
      image: "assets/images/kandang-hairdryer.jpg",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Pet Grooming Clipper Set",
      price: 1450000,
      size: 5,
      description: dummyText,
      image: "assets/images/Pet-groomingKit.jpg",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Pet Travelling Bottle",
      price: 350000,
      size: 30,
      description: dummyText,
      image: "assets/images/Pet-travelling-bottle.jpg",
      color: const Color(0xFF989493)),
  Product(
      id: 4,
      title: "Pet Drink Fountain Automatic",
      price: 800000,
      size: 11,
      description: dummyText,
      image: "assets/images/Water-fountain.jpg",
      color: const Color(0xFFE6B398)),
  Product(
      id: 5,
      title: "Car Seat Pet Travel",
      price: 1000000,
      size: 23,
      description: dummyText,
      image: "assets/images/CarSeat.jpg",
      color: const Color(0xFFFB7883)),
  Product(
    id: 6,
    title: "Kitten Care Nursing kit",
    price: 500000,
    size: 8,
    description: dummyText,
    image: "assets/images/PNursing-kit.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum dolor sit amet";

String descriptionText = "Lorem ipsum dolar sit amet";