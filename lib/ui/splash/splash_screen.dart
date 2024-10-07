import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/ui/splash/components/body.dart';
import 'package:flutter/material.dart';

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    //kita harus manggil ini di starting awal, kalo mau ngambil di size config
    return const Scaffold( //scafold buat canvas nya
      body: Body(),
    );
  }
}