import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_app_bar.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [CustomAppBar()]);
  }
}
