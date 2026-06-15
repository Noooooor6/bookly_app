import 'package:hive/hive.dart';
part 'book_entities.g.dart';

@HiveType(typeId: 0)
class BookEntities {
  @HiveField(0)
  final String bookId;
  @HiveField(1)
  final String? image;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String? auther;
  @HiveField(4)
  final num? price;

  BookEntities({
    required this.bookId,
    required this.image,
    required this.title,
    required this.auther,
    required this.price,
  });
}
