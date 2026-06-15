import 'package:bookly_app/core/utils/api_services.dart';
import 'package:bookly_app/features/home/data/model/book_model/book_model.dart';
import 'package:bookly_app/features/home/domain/entities/book_entities.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntities>> fetchFeaturedBooks();
  Future<List<BookEntities>> fetchNewestBooks();
  Future<List<BookEntities>> fetchSimilerBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices apiServices;

  HomeRemoteDataSourceImpl({required this.apiServices});
  @override
  Future<List<BookEntities>> fetchFeaturedBooks() async {
    var data = await apiServices.get(
      endPoints:
          'volumes?filter=free-ebooks&orderBy=relevance&q=computer science',
    );
    return getBooksList(data);
  }

  List<BookEntities> getBooksList(Map<String, dynamic> data) {
    List<BookEntities> books = [];
    for (var element in data['items']) {
      books.add(BookModel.fromJson(element));
    }
    return books;
  }

  @override
  Future<List<BookEntities>> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  Future<List<BookEntities>> fetchSimilerBooks() {
    // TODO: implement fetchSimilerBooks
    throw UnimplementedError();
  }
}
