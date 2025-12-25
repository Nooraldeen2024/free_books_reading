import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books_reading/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/custom_book_item.dart';
import 'package:free_books_reading/core/utils/app_router.dart';
import 'package:free_books_reading/core/widgets/custom_error_widget.dart';
import 'package:free_books_reading/core/widgets/custom_loading_indicator.dart';
import 'package:go_router/go_router.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksFailure) {
          return CustomErroWidget(errMessage: state.errMessage);
        } else if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.replace(
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
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
