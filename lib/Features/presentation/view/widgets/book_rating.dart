import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/style.dart';

class BookRating extends StatelessWidget {
  const BookRating({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.star, color: Colors.amber),
        const SizedBox(width: 6.3),
        const Text('4.8', style: Styles.txtStyle16),
        const SizedBox(width: 5),
        Text(
          '(245)',
          style: Styles.txtStyle14.copyWith(color: Color(0xff707070)),
        ),
      ],
    );
  }
}
