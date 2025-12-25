import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books_reading/Features/home/presentation/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:free_books_reading/core/utils/app_router.dart';
import 'package:free_books_reading/core/widgets/custom_error_widget.dart';
import 'package:free_books_reading/core/widgets/custom_loading_indicator.dart';
import 'package:go_router/go_router.dart';

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
                return GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push(
                      AppRouter.kBookDetailsView,
                      extra: state.books[index],
                    );
                  },
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        '',
                  ),
                );
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
