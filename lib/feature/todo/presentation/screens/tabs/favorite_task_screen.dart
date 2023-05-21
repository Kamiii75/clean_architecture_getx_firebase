import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/todo_controller.dart';
import '../../widgets/task_list.dart';

class FavoriteTasksScreen extends GetView<TodoController> {
  const FavoriteTasksScreen({Key? key}) : super(key: key);
  static const String id = 'task_screen';

  @override
  Widget build(BuildContext context) {

            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      '${controller.favoriteTasks.length.toString()} Favorites',
                    ),
                  ),
                ),
                TasksList(taskList: controller.favoriteTasks)
              ],
            );


  }
}
