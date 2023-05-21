import 'package:dartz/dartz.dart';
import '../../../../shared/errors/failure.dart';
import '../../../../shared/utils/use_case.dart';
import '../entities/todo_model.dart';
import '../repositories/todo_repository.dart';

class AddTodoUseCase implements UseCase<ModelTodo , Params<ModelTodo>>{
  final TodoRepository repository;
  AddTodoUseCase({required this.repository});

  @override
  Future<Either<Failure, ModelTodo>> call(Params params) async {
  await repository.addTodo(params.data);
    throw UnimplementedError();
  }

}