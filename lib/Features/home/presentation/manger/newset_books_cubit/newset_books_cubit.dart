import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:free_books_reading/Features/home/data/models/book_model/book_model.dart';

part 'newset_books_state.dart';

class NewsetBooksCubit extends Cubit<NewsetBooksState> {
  NewsetBooksCubit() : super(NewsetBooksInitial());
}
