import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/book_rating.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/books_action.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:free_books_reading/core/utils/style.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .2),
          child: CustomBookImage(
            imageUrl: book.volumeInfo.imageLinks?.thumbnail ?? '',
          ),
        ),
        const SizedBox(height: 43),
        Text(
          book.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.txtStyle30,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors?[0] ?? '',
            style: Styles.txtStyle18,
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          mainAxisAlignment: MainAxisAlignment.center,
          rating: book.volumeInfo.averageRating ?? 0,
          count: book.volumeInfo.ratingsCount ?? 0,
        ),
        const SizedBox(height: 37),
        const BooksAction(),
      ],
    );
  }
}
