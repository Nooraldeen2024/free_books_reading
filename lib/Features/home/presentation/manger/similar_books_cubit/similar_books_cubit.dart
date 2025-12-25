import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
import 'package:free_books_reading/Features/home/data/repos/home_repo.dart';
import 'package:free_books_reading/Features/home/presentation/manger/feature_books_cubit/feature_books_cubit.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilarBooks({required String categary}) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetchSimailerBooks(cstegory: categary);
    result.fold(
      (failure) {
        emit(SimilarBooksFailure(failure.errMessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
