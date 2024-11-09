import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tod/models/shop.dart';
import 'package:tod/pages/cart_page.dart';
import 'package:tod/pages/intro_page.dart';
import 'package:tod/pages/shop_pages.dart';
import 'package:tod/themes/light_mode.dart';

void main(){
  runApp(ChangeNotifierProvider(create: (context)=>Shop(),child: MyApp(),));
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroPage(),
      theme: lightmode,
      routes: {
        '/intro_page':(context) => IntroPage(),
        '/shop_page':(context) => ShopPages(),
        '/cart_page':(context) => CartPage(),
      },
    );
  }
}
