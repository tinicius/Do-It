import 'package:dartz/dartz.dart';
import 'package:do_it/modules/tasks/domain/entities/assignment.dart';
import 'package:do_it/modules/tasks/domain/errors/errors.dart';
import 'package:do_it/modules/tasks/domain/repositories/search_repository.dart';
import 'package:do_it/modules/tasks/domain/usecases/search_assignment_by_title.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class SearchRepositoryMock extends Mock implements SearchRepository {}

main() {
  final repository = SearchRepositoryMock();
  final usecase = SearchAssignmentByTitleImpl(repository);

  test('must emit List<Assignment>>', () async {
    when(() => repository.search("any"))
        .thenAnswer((_) async => const Right(<Assignment>[]));

    final result = await usecase("any");

    expect(result, isA<Right>());
    expect(result.fold((l) => l, (r) => r), isA<List<Assignment>>());
  });

  test('must emit Failure when receive a invalid title', () async {
    when(() => repository.search("any"))
        .thenAnswer((_) async => const Right(<Assignment>[]));

    final result = await usecase("");

    expect(result.isLeft(), true);
    expect(result.fold((l) => l, (r) => r), isA<InvalidTitleError>());
  });
}
