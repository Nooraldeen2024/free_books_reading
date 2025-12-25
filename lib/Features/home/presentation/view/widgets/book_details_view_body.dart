import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/books_details_section.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                BookDetailsSection(book: bookModel),
                const Expanded(child: SizedBox(height: 50)),
                const SilimilarBooksSection(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
