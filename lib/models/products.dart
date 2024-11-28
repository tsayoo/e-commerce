// ignore: unused_import
import 'package:e_commerce/consts.dart';
import 'package:flutter/material.dart';

// satusatunya acuan utk data yang digunakan
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
      image: "assets/images/kandang-hairdryer.png",
      color: const Color(0xFF3D82AE)),
  Product(
      id: 2,
      title: "Pet Grooming Clipper Set",
      price: 1450000,
      size: 5,
      description: dummyText,
      image: "assets/images/Pet-groomingkit.png",
      color: const Color(0xFFD3A984)),
  Product(
      id: 3,
      title: "Pet Travelling Bottle",
      price: 350000,
      size: 30,
      description: dummyText,
      image: "assets/images/Pet-travelling-bottle.png",
      color: const Color.fromARGB(255, 9, 188, 228)),
  Product(
      id: 4,
      title: "Pet Drink Fountain Automatic",
      price: 800000,
      size: 11,
      description: dummyText,
      image: "assets/images/auto-water-fountain.png",
      color: const Color.fromARGB(255, 77, 132, 215)),
  Product(
      id: 5,
      title: "Car Seat Pet Travel",
      price: 1000000,
      size: 23,
      description: dummyText,
      image: "assets/images/car-seat.png",
      color: const Color.fromARGB(255, 130, 130, 130)),
  Product(
    id: 6,
    title: "Kitten Care Nursing kit",
    price: 500000,
    size: 8,
    description: dummyText,
    image: "assets/images/PNursing-kit.png",
    color: const Color.fromARGB(255, 17, 104, 158),
  ),
  Product(
    id: 6,
    title: "Pet food Cat Choize (Cat)",
    price: 500000,
    size: 10,
    description: dummyText,
    image: "assets/images/CatChoize_food.png",
    color: const Color.fromARGB(255, 17, 104, 158),
  ),
  Product(
    id: 6,
    title: "Pet Accesories Cute Dinosaurus",
    price: 80000,
    size: 15,
    description: dummyText,
    image: "assets/images/pet_dinosaurus_model_biru.png",
    color: const Color.fromARGB(255, 46, 149, 213),
  ),
  Product(
    id: 6,
    title: "Pet Food Himalaya (Dog)",
    price: 32000,
    size: 100,
    description: dummyText,
    image: "assets/images/Himalaya_dog_food.png",
    color: const Color.fromARGB(255, 17, 104, 158),
  ),
  Product(
    id: 6,
    title: "Pet Food Life Cat (Cat)",
    price: 10000,
    size: 9,
    description: dummyText,
    image: "assets/images/LifeCat_food.png",
    color: const Color.fromARGB(255, 17, 104, 158),
  ),
  Product(
    id: 6,
    title: "Pet Grooming Clippers",
    price: 68000,
    size: 30,
    description: dummyText,
    image: "assets/images/image(11)(1).png",
    color: const Color.fromARGB(255, 17, 104, 158),
  ),
];

String dummyText =
    "Lorem Ipsum dolor sit amet";

String descriptionText = "Lorem ipsum dolar sit amet";