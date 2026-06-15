import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/features/home/data/data_sources/home_local_data_source.dart';
import 'package:bookly_app/features/home/data/data_sources/home_remote_data_source.dart';
import 'package:bookly_app/features/home/domain/entities/book_entities.dart';
import 'package:bookly_app/features/home/domain/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final HomeRemoteDataSource homeRemoteDataSource;
  final HomeLocalDataSource homeLocalDataSource;
  HomeRepoImpl({
    required this.homeRemoteDataSource,
    required this.homeLocalDataSource,
  });
  @override
  Future<Either<Failure, List<BookEntities>>> fetchNewestBooks() async {
    try {
      List<BookEntities> books;
      books = homeLocalDataSource.fetchNewestBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchNewestBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerEror.fromDioException(e));
      }
      return left(ServerEror(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntities>>> fetchFeaturedBooks() async {
    try {
      List<BookEntities> books;
      books = homeLocalDataSource.fetchFeaturedBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchFeaturedBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerEror.fromDioException(e));
      }
      return left(ServerEror(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookEntities>>> fetchSimilerBooks({
    required String category,
  }) async {
    try {
      List<BookEntities> books;
      books = homeLocalDataSource.fetchSimilerBooks();
      if (books.isNotEmpty) {
        return right(books);
      }
      books = await homeRemoteDataSource.fetchSimilerBooks();
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerEror.fromDioException(e));
      }
      return left(ServerEror(errmessage: e.toString()));
    }
  }
}
