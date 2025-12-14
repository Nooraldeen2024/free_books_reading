import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/style.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });
  final MainAxisAlignment mainAxisAlignment;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(Icons.star, color: Colors.amber, size: 20),
        const SizedBox(width: 6.3),
        const Text('4.8', style: Styles.txtStyle16),
        const SizedBox(width: 5),
        Opacity(opacity: 0.5, child: Text('(245)', style: Styles.txtStyle14)),
      ],
    );
  }
}
