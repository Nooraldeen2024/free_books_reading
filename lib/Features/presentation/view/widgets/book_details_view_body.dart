import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/book_rating.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_book_details_app_bar.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_book_item.dart';
import 'package:free_books_reading/core/utils/style.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [
          CustomBookDetailsAppBar(),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: width * .2),
            child: CustomBookImage(),
          ),
          const SizedBox(height: 43),
          Text('The june book', style: Styles.txtStyle30),
          const SizedBox(height: 6),
          Opacity(
            opacity: 0.7,
            child: Text('Rudyard kipling', style: Styles.txtStyle18),
          ),
          const SizedBox(height: 18),
          BookRating(mainAxisAlignment: MainAxisAlignment.center),
        ],
      ),
    );
  }
}
