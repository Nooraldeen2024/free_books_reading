import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books_reading/Features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:free_books_reading/Features/home/presentation/view/widgets/best_seller_list_view_item.dart';
import 'package:free_books_reading/core/widgets/custom_error_widget.dart';
import 'package:free_books_reading/core/widgets/custom_loading_indicator.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewsetBooksState>(
      builder: (context, state) {
        if (state is NewsetBooksSuccess) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: state.books[index]),
              ),
              childCount: state.books.length,
            ),
          );
        } else if (state is NewsetBooksFailure) {
          return SliverToBoxAdapter(
            child: CustomErroWidget(errMessage: state.errMessage),
          );
        } else {
          return const SliverToBoxAdapter(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
