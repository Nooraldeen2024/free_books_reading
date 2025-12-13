import 'package:flutter/material.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/custom_app_bar.dart';
import 'package:free_books_reading/Features/presentation/view/widgets/featured_list_view.dart';
import 'package:free_books_reading/core/utils/assets.dart';
import 'package:free_books_reading/core/utils/style.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomAppBar(),
          FeatureedBooksListView(),
          SizedBox(height: 40),
          Text('Best Seller', style: Styles.txtStyle18),
          SizedBox(height: 20),
          BeatSellerListViewItem(),
        ],
      ),
    );
  }
}

class BeatSellerListViewItem extends StatelessWidget {
  const BeatSellerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 125,
      child: Row(
        children: [
          AspectRatio(
            aspectRatio: 2.8 / 4,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.red,
                image: const DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(AssetsData.testimage),
                ),
              ),
            ),
          ),
          SizedBox(width: 30),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: const Text(
                  'Harry potter and the Gloma is the Golblet of fire',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Styles.txtStyle20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
