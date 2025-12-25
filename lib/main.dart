import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:free_books_reading/Features/home/data/repos/home_repo_impl.dart';
import 'package:free_books_reading/Features/home/presentation/manger/feature_books_cubit/feature_books_cubit.dart';
import 'package:free_books_reading/Features/home/presentation/manger/newset_books_cubit/newset_books_cubit.dart';
import 'package:free_books_reading/constants.dart';
import 'package:free_books_reading/core/utils/api_service.dart';
import 'package:free_books_reading/core/utils/app_router.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BooklyApp());
}

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              FeatureBooksCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchFeaturedBooks(),
        ),

        BlocProvider(
          create: (context) =>
              NewsetBooksCubit(HomeRepoImpl(ApiService(Dio())))
                ..fetchNewestdBooks(),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
      ),
    );
  }
}
