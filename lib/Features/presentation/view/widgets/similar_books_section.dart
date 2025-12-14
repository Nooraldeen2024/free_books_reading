import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/similer_books_list_view.dart';
import 'package:free_books_reading/core/utils/style.dart';

class SilimilarBooksSection extends StatelessWidget {
  const SilimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'You can also like',
          style: Styles.txtStyle14.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        SimilarBooksListView(),
      ],
    );
  }
}
