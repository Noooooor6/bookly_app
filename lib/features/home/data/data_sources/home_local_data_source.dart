import 'package:bookly_app/constans.dart';
import 'package:bookly_app/features/home/domain/entities/book_entities.dart';
import 'package:hive/hive.dart';

abstract class HomeLocalDataSource {
  List<BookEntities> fetchFeaturedBooks();
  List<BookEntities> fetchNewestBooks();
  List<BookEntities> fetchSimilerBooks();
}

class HomeLocalDataSourceImpl extends HomeLocalDataSource {
  @override
  List<BookEntities> fetchFeaturedBooks() {
    var box = Hive.box<BookEntities>(kFeaturedBox);
    return box.values.toList();
  }

  @override
  List<BookEntities> fetchNewestBooks() {
    var box = Hive.box<BookEntities>(kNewestBox);
    return box.values.toList();
  }

  @override
  List<BookEntities> fetchSimilerBooks() {
    var box = Hive.box<BookEntities>(kSimilerBox);
    return box.values.toList();
  }
}
