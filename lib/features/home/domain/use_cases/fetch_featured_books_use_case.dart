import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/use_cases/use_case.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeaturedBooksUseCase extends UseCase<List<BookModel>, int> {
  final HomeRepo homeRepo;

  FetchFeaturedBooksUseCase({required this.homeRepo});

  @override
  Future<Either<Failure, List<BookModel>>> call([int? param]) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
