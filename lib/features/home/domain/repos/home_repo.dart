import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/domain/entities/book_entities.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookEntities>>> fetchNewestBooks();
  Future<Either<Failure, List<BookEntities>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookEntities>>> fetchSimilerBooks({
    required String category,
  });
}
