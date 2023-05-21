import '../../domain/entities/todo_model.dart';

abstract class TodoRemoteDatabase{

  Future<bool> addTodo(ModelTodo mdl);
  Future<ModelTodo> editTodo(ModelTodo mdl);
  Future<bool> deleteTodo(ModelTodo mdl);
  Future<List<ModelTodo>> getAllTodo();
}