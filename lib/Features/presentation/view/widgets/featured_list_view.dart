import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_list_view.dart';

class FeatureedBooksListView extends StatelessWidget {
  const FeatureedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return FeaturedListViewItem();
        },
      ),
    );
  }
}
