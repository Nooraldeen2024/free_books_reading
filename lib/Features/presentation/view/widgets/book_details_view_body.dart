import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/Custom_book_details_app_bar.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: [CustomBookDetailsAppBar()]),
    );
  }
}
