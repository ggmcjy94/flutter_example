import 'package:flutter/material.dart';
import 'package:flutter_shoppingcart_app/pages/shoppingcart_page.dart';
import 'package:flutter_shoppingcart_app/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: theme(),
      home: ShoppingCartPage(),
    );
  }
}
