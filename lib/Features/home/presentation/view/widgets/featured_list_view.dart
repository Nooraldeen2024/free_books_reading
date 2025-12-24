import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books_reading/Features/home/presentation/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:free_books_reading/core/widgets/custom_error_widget.dart';
import 'package:free_books_reading/core/widgets/custom_loading_indicator.dart';

class FeatureedBooksListView extends StatelessWidget {
  const FeatureedBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeatureBooksCubit, FeatureBooksState>(
      builder: (context, state) {
        if (state is FeatureBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context, index) {
                final imageUrl =
                    state.books[index].volumeInfo.imageLinks?.smallThumbnail ??
                    state.books[index].volumeInfo.imageLinks?.thumbnail ??
                    'https://via.placeholder.com/128x196.png?text=No+Image';
                return CustomBookImage(imageUrl: imageUrl);
              },
            ),
          );
        } else if (state is FeatureBooksFailure) {
          return CustomErroWidget(errMessage: state.errMessage);
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
