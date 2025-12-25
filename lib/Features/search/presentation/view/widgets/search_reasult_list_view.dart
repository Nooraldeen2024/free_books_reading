import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/best_seller_list_view_item.dart';

class SearchReasultListView extends StatelessWidget {
  const SearchReasultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          // child: BookListViewItem(bookModel: ,),
          child: Text('data'),
        );
      },
    );
  }
}
