import 'package:flutter/material.dart';
import 'package:flutter_kakao_app/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor: Colors.white, toolbarTextStyle: const TextTheme(
            headline6: TextStyle(color: Colors.black, fontSize: 24),

          ).bodyText2, titleTextStyle: const TextTheme(
            headline6: TextStyle(color: Colors.black, fontSize: 24),

          ).headline6,
          iconTheme: const IconThemeData(color: Colors.black)
        ),
      ),
      home: MainScreen(),
    );
  }
}
