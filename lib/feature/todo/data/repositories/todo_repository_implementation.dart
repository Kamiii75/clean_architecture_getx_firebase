
import 'package:dartz/dartz.dart';

import '../../../../shared/errors/failure.dart';
import '../../domain/entities/todo_model.dart';
import '../../domain/repositories/todo_repository.dart';
import '../database/todo_remore_database.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatabase remoteDatabase;

  TodoRepositoryImpl({required this.remoteDatabase});

  @override
  Future<Either<Failure, bool>> addTodo(ModelTodo mdl) async {
    try {
      final result = await remoteDatabase.addTodo(mdl);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteTodo(ModelTodo mdl) async {
    try {
      final result = await remoteDatabase.deleteTodo(mdl);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, ModelTodo>> editTodo(ModelTodo mdl) async {
    try {
      final result = await remoteDatabase.editTodo(mdl);

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ModelTodo>>> getAllTodo() async {
    try {
      final result = await remoteDatabase.getAllTodo();

      return Right(result);
    } catch (error) {
      return Left(Failure(message: error.toString()));
    }
  }
}
