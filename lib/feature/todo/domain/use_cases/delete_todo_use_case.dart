import 'package:dartz/dartz.dart';
import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/use_case.dart';
import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class DeleteTodoUseCase implements UseCase<ModelTodo , Params<ModelTodo>>{
  final TodoRepository repository;
  DeleteTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, ModelTodo>> call(Params params) async {
  await repository.deleteTodo(params.data);
    throw UnimplementedError();
  }

}