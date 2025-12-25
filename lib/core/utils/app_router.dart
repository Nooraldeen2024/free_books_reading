import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';
import 'package:free_books_reading/Features/home/data/repos/home_repo_impl.dart';
import 'package:free_books_reading/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:free_books_reading/Features/home/presentation/view/home_view.dart';
import 'package:free_books_reading/Features/splash/presentation/view/splash_view.dart';
import 'package:free_books_reading/Features/home/presentation/view/book_details_view.dart';
import 'package:free_books_reading/Features/search/presentation/view/search_view.dart';
import 'package:free_books_reading/core/utils/api_service.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kBookDetailsView = '/BookDetailsView';
  static const kSearchView = '/SearchView';
  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kBookDetailsView,
        builder: (context, state) => BlocProvider(
          create: (context) =>
              SimilarBooksCubit(HomeRepoImpl(ApiService(Dio()))),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),
      GoRoute(
        path: kSearchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
