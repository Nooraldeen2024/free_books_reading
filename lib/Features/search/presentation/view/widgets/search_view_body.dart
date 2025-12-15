import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/search/presentation/view/widgets/custom_seach_text_field.dart';
import 'package:free_books_reading/Features/search/presentation/view/widgets/search_reasult_list_view.dart';
import 'package:free_books_reading/core/utils/style.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextfield(),
          SizedBox(height: 16),
          Text(
            'Search Reasult',
            textAlign: TextAlign.start,
            style: Styles.txtStyle18,
          ),
          SizedBox(height: 16),
          Expanded(child: SearchReasultListView()),
        ],
      ),
    );
  }
}
