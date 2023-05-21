import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../entities/todo_model.dart';

abstract class TodoRepository{

  Future<Either<Failure,bool>> addTodo(ModelTodo mdl);
  Future<Either<Failure,ModelTodo>> editTodo(ModelTodo mdl);
  Future<Either<Failure,bool>> deleteTodo(ModelTodo mdl);
  Future<Either<Failure,List<ModelTodo>>> getAllTodo();
}