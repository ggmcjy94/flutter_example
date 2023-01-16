import 'package:flutter/material.dart';
import 'package:flutter_getx_todo/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter todo page',
      theme: ThemeData(
        primaryColor: Colors.orange[200],
        appBarTheme: AppBarTheme(
          elevation: 0.0
        )
      ),
      home: HomeScreen(),
    );
  }
}


