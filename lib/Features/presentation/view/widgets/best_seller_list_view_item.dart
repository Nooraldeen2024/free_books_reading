import 'package:flutter/material.dart';
import 'package:free_books_reading/core/utils/assets.dart';
import 'package:free_books_reading/core/utils/style.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key});

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
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
              const SizedBox(height: 3),
              const Text('J.K Rowling', style: Styles.txtStyle14),
              const SizedBox(height: 3),
              Row(
                children: [
                  Text(
                    '19.99\$',
                    style: Styles.txtStyle20.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
