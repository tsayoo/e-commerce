import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// mengimplementasikan konsep oop --> inheritance
class ThemeProvider extends ChangeNotifier {
  bool _isDarkTheme = false;

  ThemeProvider() {
    _loadTheme(); //function ini akan di olah dan akan di tinak lanjuti oleh theme provider saat ke trigger sama toggle
  }

  // setter, sebuah var yang bersifat private.
  // getter sepertoi alias, yang bisa didefinisikan di class yg lain
  /*Setter dan Getter itu cara buat ngatur dan ambil nilai dari properti suatu objek.
  Getter: Buat ngambil nilai. Contoh: Kamu tanya, "Apa warna baju aku?" Getter jawab, "Biru."
  Setter: Buat ngatur nilai.
  Contoh: Kamu bilang, "Ubah warna baju aku jadi merah." Setter nurut deh, diubah jadi merah.
  Jadi, getter = ambil, setter = atur. */

  bool get isDarkTheme => _isDarkTheme;

  void toggleTheme(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = isDark;
    await prefs.setBool("isDarkTheme", isDark);
    notifyListeners();
  }

  void _loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkTheme = prefs.getBool("isDarkTheme") ?? false;
    notifyListeners();
  }
}