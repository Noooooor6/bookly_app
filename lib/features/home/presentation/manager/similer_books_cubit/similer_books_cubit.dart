import 'package:bloc/bloc.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similer_books_state.dart';

class SimilerBooksCubit extends Cubit<SimilerBooksState> {
  SimilerBooksCubit(this.homeRepo) : super(SimilerBooksInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSimilerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchSimilerBooks(category: category);
    result.fold(
      (failure) => emit(SimilerBooksFailure(errmessage: failure.errmessage)),
      (books) => emit(SimilerBooksSuccess(bookModel: books)),
    );
  }
}
