import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/books_details_section.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: const [
                CustomBookDetailsAppBar(),
                BookDetailsSection(),
                Expanded(child: SizedBox(height: 50)),
                SilimilarBooksSection(),
                SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
