import 'package:bookly_app/constans.dart';
import 'package:bookly_app/core/errors/failure.dart';
import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiServices apiServices;

  HomeRepoImpl({required this.apiServices});
  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiServices.get(
        endPoints:
            'volumes?filter=free-ebooks&orderBy=newest&q=programming&key=$apiKey',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerEror.fromDioException(e));
      }
      return left(ServerEror(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiServices.get(
        endPoints: 'volumes?filter=free-ebooks&q=programming&key=$apiKey',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerEror.fromDioException(e));
      }
      return left(ServerEror(errmessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilerBooks({
    required String category,
  }) async {
    try {
      var data = await apiServices.get(
        endPoints:
            'volumes?filter=free-ebooks&Sorting=relevance&q=programming&key=$apiKey',
      );

      List<BookModel> books = [];

      for (var item in data['items']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerEror.fromDioException(e));
      }
      return left(ServerEror(errmessage: e.toString()));
    }
  }
}
