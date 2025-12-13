import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_app_bar.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/featured_list_view.dart';
import 'package:free_books_reading/core/utils/style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeatureedBooksListView(),
          SizedBox(height: 40),
          Text('Best Seller', style: Styles.titleMedium),
        ],
      ),
    );
  }
}
