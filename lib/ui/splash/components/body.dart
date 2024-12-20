import 'package:e_commerce/consts.dart';
import 'package:e_commerce/size_config.dart';
import 'package:e_commerce/ui/auth/login_screen.dart';
import 'package:flutter/material.dart';

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

//widget extraction itu untuk memisah logic dan juga widget nya, jadi yg diatas itu logic nya yg dibawah itu widgetnya

class _BodyState extends State<Body> {
  int currentPage = 0;
  final PageController _pageController = PageController(); //for controlling our route yg di page builder ya ga si? bisa jg dibilang buat dia ke catalogue screen, PINDAH HALAMN

  // List<String> product = List.generate( //wadah prduct atau genarate product
  //   10, (index) => "Product ${index + 1}"
  //   );

  // dasar pengambilan data dari API
  List<Map<String, String>> splashData = [
  {
    "text": "Welcome to Petzation! your lovely pet's best friend",
    "image": "assets/images/logo_berwarna.png", // Gambar default untuk terang
    "image_dark": "assets/images/logo_putih.png", // Gambar untuk tema gelap
  },
  {
    "text": "We sell a pet product around jakarta \n and around the world",
    "image": "assets/images/logo_berwarna.png",
    "image_dark": "assets/images/logo_putih.png",
  },
  {
    "text": "Let's make a big changes \n through a better e-commerce app",
    "image": "assets/images/logo_berwarna.png",
    "image_dark": "assets/images/logo_putih.png",
  },
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea( //for make our project ga kektutupan ama system hpnya
        child: Column(
          children: [
            Expanded //buat mengisi kekosongan yg ada, biar isinya proposinal
            (
              flex: 3, //untuk ngasih jarak 3 column dan 3 row utk itu berada
              child: SizedBox(// in tuh buat dia buat space gitu lh(jarak antara widget2), kalo tanpa ini ga bisa pake widht apa height, dan jg gabisa pake double.infinity
                width: double.infinity,//ini tuh buat bikin ke tengah, jadi dia akan memenuhi layar yg ada, bisa dibilang dia akan ngestract jadi dia bakal ke tengah
                child: PageView.builder( //pageview meng handle swipe swipe activity
                  controller: _pageController,
                  onPageChanged: (value)  { //kalo perlu argument/sesuatu yg mewakili integer kita bisa taro value
                      //initial state method for statefull widfet behavior
                      //state awal utk perubahan yg akan terjadi, di dalam state full ada state method
                      //kalo mengawali statefull behavior
                      setState(() { // set itu perubahan state, untuk perubahan gitu cuenah
                        currentPage = value;// manggil integer representatif yg udh kita panggil di awal, dia mengambil data dari page pertama
                      });
                    },
                  itemCount: splashData.length, //utk mengasih //.length utk ngasih tau size utk array nya 
                  itemBuilder: (context, index) => SplashContent( //item builder utk jembatan antara data dan
                    text: splashData[index]["text"]! , 
                    image:  splashData[index]["image"]!,
                    imageDark: splashData[index]["image_dark"]!,
                    )
                  //context mereprentasikan halaman sekarang
                  //index itu, list di akses dengan index
                  //buider bisa di pake dimana aja, disini kita pake di pageview, biar pas
                ),
              ),
            ), //expanded buat mengisi kekosongan yg ada, biar isinya proposional
           Expanded(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.center, // Aligns the dots in the center
            children: List.generate(
              splashData.length, 
              (index) => _dotIndicator(index: index), //diisi index aja, karna disini udh jelas kita mau kasih index
              ),
            ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: double.infinity, //ini tuh buat bikin ke tengah, jadi dia akan memenuhi layar yg ada, bisa dibilang dia akan ngestract jadi dia bakal ke tengah
                child: ElevatedButton( 
                  style: ElevatedButton.styleFrom(  //buat style button, ini tuh buat bikin buttonnya ke tengah
                    backgroundColor: primaryColor,
                    padding: const EdgeInsets.all(8)  //buat jarak antara text dan button
                  ),

                  onPressed: () {
                    if (currentPage == splashData.length - 1) {
                      // kode yg dipake buat berpindah antar halaman
                      // Aksi untuk halaman terakhir, pindah ke halaman utama
                      //what is length? panjangnya data/banyanknya data
                      Navigator.pushReplacement(
                        context, //context itu represantisikan currrent page kita
                        MaterialPageRoute(
                          builder: (context) =>  LoginScreen())
                      );
                      
                    } else {
                        // Berpindah ke halaman splash berikutnya
                        _pageController.animateToPage(
                        currentPage + 1,  // Geser ke halaman berikutnya
                        duration: animationDuration,  // Durasi animasi
                        curve: Curves.easeIn,  // Kurva animasi
                      );

                        
          

                      
                    }
                  },// onpressed for acion,() => {} dummy (represntasi dari function yg kosong) ngasih function mau ke mana
                 //"expresion" kalo di code itu kayak di block code
                  child: Text( 
                    currentPage == splashData.length - 1 ? "Start" : "Next",
                    
                    style: const TextStyle(
                      color: Colors.white,
                      
                    ),
                  ),
                 //"intensitas" itu frekuensi
                 
                 
                 ),
              ),
            )
          ],
        ),
        
      )
  
    );
  }

  // ini untuk logika dots indicator
  AnimatedContainer _dotIndicator({required int index}) {
  return AnimatedContainer(
    duration: animationDuration, // Durasi animasi (300ms)
    curve: Curves.easeInOut, // Kurva animasi untuk transisi yang lebih halus
    
    margin: const EdgeInsets.only(right: 10), // Jarak antar titik
    width: currentPage == index ? 20 : 10,
    height: 10,
    decoration: BoxDecoration(
      color: currentPage == index ? primaryColor : secondaryColor,  //ini itu if else  Warna titik aktif dan tidak aktif 
    ),
  );
}

}

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
    // Mendapatkan mode tema saat ini (terang atau gelap)
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
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
