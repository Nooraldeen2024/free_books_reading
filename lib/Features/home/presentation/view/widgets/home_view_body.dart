import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/best_seller_list_view.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_app_bar.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/featured_list_view.dart';
import 'package:free_books_reading/core/utils/style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(right: 30, left: 30, top: 20),
                child: CustomAppBar(),
              ),
              FeatureedBooksListView(),
              SizedBox(height: 40),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Text('Best Seller', style: Styles.txtStyle18),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        const SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}
