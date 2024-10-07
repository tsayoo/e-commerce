import 'package:flutter/material.dart';

//Secara sederhana, StatelessWidget untuk UI yang tetap, dan StatefulWidget untuk UI yang bisa berubah.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(  //untuk menghilangkan notifikasi dan mengamankan projek biar ga ketutupan
          child: CustomScrollView(   //untuk scrollable
            scrollDirection: Axis.horizontal,  //arah scroll horizontal
            slivers: [
              SliverToBoxAdapter( //widget yang membantu kita membuat sebuah kotak yang dapat di-scrolling
                  child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
              )),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                  child: Container(
                width: 50,
                height: 50,
                color: Colors.pink,
              )),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
              ),
              const SliverPadding(padding: EdgeInsets.all(10)),
              SliverToBoxAdapter(
                child: Container(
                width: 50,
                height: 50,
                color: Colors.black,
              ),
              ),
            ],
          ),
      ),
    );
  }
}