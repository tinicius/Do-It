import 'package:do_it/modules/tasks/domain/entities/assignment.dart';
import 'package:dartz/dartz.dart';
import 'package:do_it/modules/tasks/domain/errors/errors.dart';
import 'package:do_it/modules/tasks/domain/repositories/search_repository.dart';

abstract class SearchAssignmentByTitle {
  Future<Either<FailureSearch, List<Assignment>>> call(String title);
}

class SearchAssignmentByTitleImpl implements SearchAssignmentByTitle {

  final SearchRepository repository;

  SearchAssignmentByTitleImpl(this.repository);

  @override
  Future<Either<FailureSearch, List<Assignment>>> call(String title)  async{

    if(title == "") return Left(InvalidTitleError());

    return await repository.search(title);
    
  }
  
}
