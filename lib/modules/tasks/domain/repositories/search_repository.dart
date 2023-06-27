import 'package:dartz/dartz.dart';

import '../entities/assignment.dart';
import '../errors/errors.dart';

abstract class SearchRepository {
  Future<Either<FailureSearch, List<Assignment>>> search(String title);
}
