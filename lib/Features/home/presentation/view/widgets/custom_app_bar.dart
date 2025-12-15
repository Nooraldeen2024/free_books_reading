import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/app_router.dart';
import 'package:free_books_reading/core/utils/assets.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(AssetsData.reading, height: 22),
        const Spacer(),
        IconButton(
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSearchView);
          },
          icon: Icon(Icons.search, size: 30),
        ),
      ],
    );
  }
}
