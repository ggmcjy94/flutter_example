import 'package:flutter/material.dart';
import 'package:flutter_recipe_app/pages/recipe_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: "PatuaOne"), // 전체 폰트
      home: RecipePage(),
    );
  }
}

