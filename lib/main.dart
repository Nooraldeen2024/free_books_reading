import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/splash_view.dart';
import 'package:free_books_reading/constants.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: kPrimaryColor),
      home: SplashView(),
    );
  }
}
