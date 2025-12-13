import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_app_bar.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: const [CustomAppBar(), FeatureedBooksListView()]);
  }
}

class FeatureedBooksListView extends StatelessWidget {
  const FeatureedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.3,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: FeaturedListViewItem(),
          );
        },
      ),
    );
  }
}
