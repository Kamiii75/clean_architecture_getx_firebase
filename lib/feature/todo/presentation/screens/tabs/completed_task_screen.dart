import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../widgets/task_list.dart';

class CompletedTasksScreen extends GetView<TodoController> {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Chip(
                    label: Text(
                      '${controller.pendingTasks.length.toString()} Pending | ${controller
                          .completedTasks.length.toString()}  Completed',
                    ),
                  ),
                ),
                TasksList(taskList: controller.completedTasks)
              ],
            );


  }
}
