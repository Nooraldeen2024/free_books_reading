import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Row(
        children: [
          Image.asset(AssetsData.reading, height: 22),
          const Spacer(),
          IconButton(onPressed: () {}, icon: Icon(Icons.search, size: 30)),
        ],
      ),
    );
  }
}
