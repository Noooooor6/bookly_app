part of 'similer_books_cubit.dart';

sealed class SimilerBooksState extends Equatable {
  const SimilerBooksState();

  @override
  List<Object> get props => [];
}

final class SimilerBooksInitial extends SimilerBooksState {}

class SimilerBooksLoading extends SimilerBooksState {}

class SimilerBooksSuccess extends SimilerBooksState {
  final List<BookModel> bookModel;

  const SimilerBooksSuccess({required this.bookModel});
}

class SimilerBooksFailure extends SimilerBooksState {
  final String errmessage;

  const SimilerBooksFailure({required this.errmessage});
}
