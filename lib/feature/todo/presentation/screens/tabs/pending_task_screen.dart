import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../../controllers/todo_controller.dart';
import '../../widgets/task_list.dart';

class PendingTasksScreen extends GetView<TodoController> {
  const PendingTasksScreen({Key? key}) : super(key: key);

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
            TasksList(taskList: controller.pendingTasks)
          ],
        );

  }
}
