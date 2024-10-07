import 'package:e_commerce/consts.dart';
import 'package:e_commerce/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

//shift + alt + o

//download extension
// - adb interface
// - error lense
// - prettier
// - flutter widget snipeads

void main() {
  runApp(const Petzation());
}

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class Petzation extends StatelessWidget {
  const Petzation({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      // material app = kerangka
      debugShowCheckedModeBanner: false,  //untuk menghilangkan banner debug
      title: 'Petzation',
      //untuk mnegindetified
      //ada super class dan subclass
      //()yg ada gitunya itu parametear
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Muli',
        // biar density atau kepadetan mobile app nya, buat adaptive di semua devices
        visualDensity: VisualDensity.adaptivePlatformDensity,  //buat responsive
        textTheme: const TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor)
        )
      ),

      home: const SplashScreen(),
    );
  }
}