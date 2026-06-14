import 'package:bookly_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class UseCase<Type, param> {
  Future<Either<Failure, Type>> call([param param]);
}
