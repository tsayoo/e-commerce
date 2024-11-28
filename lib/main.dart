import 'package:e_commerce/consts.dart';
import 'package:e_commerce/settings/settings_screen.dart';
import 'package:e_commerce/state-management/cart_provider.dart';
import 'package:e_commerce/state-management/theme_provider.dart';
import 'package:e_commerce/state-management/wishlist_provider.dart'; // Impor WishlistProvider
// import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:e_commerce/ui/auth/register_screen.dart';
import 'package:e_commerce/ui/home/catalogue_screen.dart';
import 'package:e_commerce/ui/splash/components/body.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//shift + alt + o

//download extension
// - adb interface
// - error lense
// - prettier
// - flutter widget snipeads

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ChangeNotifierProvider(create: (_) => WishlistProvider()), // Menambahkan WishlistProvider
        ChangeNotifierProvider(create: (_) => CartProvider())
      ],
      child: const Petzation(),
    ),
  );
}

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class Petzation extends StatefulWidget {
  const Petzation({super.key});

  @override
  State<Petzation> createState() => _PetzationState();
}

class _PetzationState extends State<Petzation> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) { 
        return MaterialApp(
          // material app = kerangka
          debugShowCheckedModeBanner: false,  //untuk menghilangkan banner debug
          title: 'Petzation',
          //untuk mnegindetified
          //ada super class dan subclass
          //()yg ada gitunya itu parametear
          theme: ThemeData(
            brightness: themeProvider.isDarkTheme ? Brightness.dark : Brightness.light,
            scaffoldBackgroundColor: themeProvider.isDarkTheme ? Colors.black : Colors.white,

            fontFamily: 'Muli',
            // biar density atau kepadetan mobile app nya, biar adaptive di semua devices
            visualDensity: VisualDensity.adaptivePlatformDensity,  //buat responsive
            textTheme: const TextTheme(
              bodyMedium: TextStyle(color: textColor),
              bodySmall: TextStyle(color: textColor)
            )
          ),
          initialRoute: '/',   
          routes: {
            //format pasangan key : value adalah => nama rute : kelas yang dituju
            '/': (context) => const Body(),
            '/register': (context) => Registerpage(),
            '/settings' : (context) => const SettingsScreen(),
            '/catalogue' : (context) => const CatalogueScreen()
          },
        );
      },
    );
  }
}
//isinya konfigurasi utama, dan informasi penting aplikasi
