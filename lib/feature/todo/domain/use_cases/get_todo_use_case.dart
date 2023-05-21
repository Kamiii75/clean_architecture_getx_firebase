import 'package:dartz/dartz.dart';
import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/use_case.dart';
import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class GetAllTodoUseCase implements UseCase<List<ModelTodo> , NoParams>{
  final TodoRepository repository;
  GetAllTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, List<ModelTodo> >> call(NoParams params) async {
  await repository.getAllTodo();
    throw UnimplementedError();
  }

}