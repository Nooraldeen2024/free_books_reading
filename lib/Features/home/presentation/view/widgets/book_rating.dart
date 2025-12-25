import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/style.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
    required this.count,
  });
  final MainAxisAlignment mainAxisAlignment;
  final double rating;
  final int count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 6.3),
        Text(rating.toInt().toString(), style: Styles.txtStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: 0.5,
          child: Text(' ($count)', style: Styles.txtStyle14),
        ),
      ],
    );
  }
}
