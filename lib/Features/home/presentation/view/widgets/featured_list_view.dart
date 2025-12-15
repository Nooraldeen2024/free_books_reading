import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_book_item.dart';

class FeatureedBooksListView extends StatelessWidget {
  const FeatureedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return CustomBookImage();
        },
      ),
    );
  }
}
