import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
import 'package:free_books_reading/Features/home/data/repos/home_repo.dart';
import 'package:free_books_reading/core/errors/failure.dart';
import 'package:free_books_reading/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?filtering=free-ebooks&Sorting=newest &q=subject:Programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
        endPoint: 'volumes?filtering=free-ebooks&q=subject:Programming',
      );
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}

// import 'package:dartz/dartz.dart';
// import 'package:dio/dio.dart';
// import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
// import 'package:free_books_reading/Features/home/data/repos/home_repo.dart';
// import 'package:free_books_reading/core/errors/failure.dart';
// import 'package:free_books_reading/core/utils/api_service.dart';

// class HomeRepoImpl implements HomeRepo {
//   final ApiService apiService;

//   HomeRepoImpl(this.apiService);

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
//     try {
//       final data = await apiService.get(
//         endPoint:
//             'volumes?filtering=free-ebooks&sorting=newest&q=subject:Programming',
//       );

//       // ✅ Google Books يرجّع items (وليس item)
//       final items = (data is Map<String, dynamic>)
//           ? (data['items'] as List?)
//           : null;

//       // ✅ إذا مافي نتائج أو items = null نرجع قائمة فاضية بدون كراش
//       if (items == null) {
//         return right(<BookModel>[]);
//       }

//       final books = items
//           .whereType<Map>()
//           .map((item) => BookModel.fromJson(Map<String, dynamic>.from(item)))
//           .toList();

//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }

//   @override
//   Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
//     try {
//       final data = await apiService.get(
//         endPoint: 'volumes?filtering=free-ebooks&q=subject:Programming',
//       );

//       // ✅ Google Books يرجّع items (وليس item)
//       final items = (data is Map<String, dynamic>)
//           ? (data['items'] as List?)
//           : null;

//       // ✅ إذا مافي نتائج أو items = null نرجع قائمة فاضية بدون كراش
//       if (items == null) {
//         return right(<BookModel>[]);
//       }

//       final books = items
//           .whereType<Map>()
//           .map((item) => BookModel.fromJson(Map<String, dynamic>.from(item)))
//           .toList();

//       return right(books);
//     } catch (e) {
//       if (e is DioException) {
//         return left(ServerFailure.fromDioException(e));
//       }
//       return left(ServerFailure(e.toString()));
//     }
//   }
// }
