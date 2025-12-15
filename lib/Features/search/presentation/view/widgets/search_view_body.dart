import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/search/presentation/view/widgets/custom_seach_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(children: const [CustomSearchTextfield()]),
    );
  }
}
