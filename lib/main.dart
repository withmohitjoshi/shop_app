import 'package:flutter/material.dart';
import 'package:shop_app/home_page.dart';
import 'package:shop_app/product_details_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(254, 206, 1, 1),
          primary: const Color.fromRGBO(254, 206, 1, 1),
        ),
        inputDecorationTheme: const InputDecorationTheme(
            hintStyle: TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
            prefixIconColor: Colors.black54),
        textTheme: const TextTheme(
          titleMedium: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          bodySmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
      ),
      title: 'Shop App',
      home: const ProductDetailsPage(),
    );
  }
}
