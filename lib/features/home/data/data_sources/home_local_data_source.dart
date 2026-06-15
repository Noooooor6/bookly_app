import 'package:bookly_app/features/home/domain/entities/book_entities.dart';

abstract class HomeLocalDataSource {
  List<BookEntities> fetchFeaturedBooks();
  List<BookEntities> fetchNewestBooks();
  List<BookEntities> fetchSimilerBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntities> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntities> fetchNewestBooks() {
    // TODO: implement fetchNewestBooks
    throw UnimplementedError();
  }

  @override
  List<BookEntities> fetchSimilerBooks() {
    // TODO: implement fetchSimilerBooks
    throw UnimplementedError();
  }
}
