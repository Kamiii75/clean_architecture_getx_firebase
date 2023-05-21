
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../shared/utils/guid_gen.dart';
import '../../../../shared/utils/use_case.dart';
import '../../domain/entities/todo_model.dart';
import '../../domain/use_cases/add_todo_use_case.dart';
import '../../domain/use_cases/delete_todo_use_case.dart';
import '../../domain/use_cases/edit_todo_use_case.dart';
import '../../domain/use_cases/get_todo_use_case.dart';
import '../widgets/edit_task.dart';

class TodoController extends GetxController {
  /// Lists @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
  List<ModelTodo> removedTasks = [];
  List<ModelTodo> pendingTasks = [];
  List<ModelTodo> completedTasks = [];
  List<ModelTodo> favoriteTasks = [];

  /// Lists @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
  /// UseCases @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
  final AddTodoUseCase addTodoUseCase;
  final EditTodoUseCase editTodoUseCase;
  final DeleteTodoUseCase deleteTodoUseCase;
  final GetAllTodoUseCase getAllTodoUseCase;

  TodoController(
      {required this.addTodoUseCase,
      required this.editTodoUseCase,
      required this.deleteTodoUseCase,
      required this.getAllTodoUseCase});

  /// UseCases @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
  ///
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();

  /// Functions @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))

  void removeOrDeleteTask(BuildContext ctx, ModelTodo task) {
    task.isDeleted! ? deleteTask(task: task) : removeTask(task: task);
  }

  void editTask(BuildContext context, ModelTodo task) {
    Navigator.of(context).pop();
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: EditTaskScreen(oldTask: task),
              ),
            ));
  }

  Future<void> addTask() async {
    var task = ModelTodo(
        id: GUIDGen.generate(),
        title: titleController.text,
        description: descController.text,
        date: DateTime.now().toString(),
        status: '');

    final result = await addTodoUseCase(Params(task));

    result.fold((failure) => null, (todo) => null);
  }

  void updateTask({required ModelTodo task}) {}

  markFavoriteOrUnFavoriteTask({required ModelTodo task}) {}

  restoreTask({required ModelTodo task}) {}

  deleteTask({required ModelTodo task}) {}

  removeTask({required ModelTodo task}) {}

  void editTaskOldNew(
      {required ModelTodo oldTask, required ModelTodo newTask}) {}

  /// Functions @@@###$$$%%%^^^&&&***(((!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!)))
}
