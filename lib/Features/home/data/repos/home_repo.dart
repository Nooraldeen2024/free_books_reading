import 'package:dartz/dartz.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
import 'package:free_books_reading/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimailerBooks({
    required String cstegory,
  });
}
