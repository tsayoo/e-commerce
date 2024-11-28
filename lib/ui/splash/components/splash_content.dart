import 'package:e_commerce/size_config.dart';
import 'package:flutter/material.dart';

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class SplashContent extends StatelessWidget {
  const SplashContent({
    super.key, 
    required this.text, 
    required this.image,
    required this.imageDark,
  });
  
  final String text, image, imageDark;

  @override
  Widget build(BuildContext context) {
    // Menentukan mode tema gelap atau terang
    bool isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;
    
    // Pilih gambar berdasarkan mode tema
    String imageToUse = isDarkMode ? imageDark : image;
    
    // Pilih warna teks berdasarkan mode tema
    Color textColor = isDarkMode ? Colors.white : Colors.black;

    return Column(
      children: [
        const Spacer(),
        Text(
          'Petzation',
          style: TextStyle(
            color: Colors.green,
            fontSize: getPropotinateScreenWidht(36.0),
          ),
        ),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor, // Gunakan warna teks yang sesuai dengan mode
          ),
        ),
        Image.asset(imageToUse), // Gunakan gambar berdasarkan mode
      ],
    );
  }
}