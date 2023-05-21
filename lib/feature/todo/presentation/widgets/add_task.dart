import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTaskScreen extends GetView<TodoController> {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        return Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text('Add Task', style: TextStyle(fontSize: 24)),
              const SizedBox(height: 10),
              TextField(
                autofocus: true,
                controller: controller.titleController,
                decoration: const InputDecoration(
                    label: Text('Title'), border: OutlineInputBorder()),
              ),
              const SizedBox(height: 10),
              TextField(
                maxLines: 5,
                minLines: 3,
                autofocus: true,
                controller: controller.descController,
                decoration: const InputDecoration(
                    label: Text('Description'), border: OutlineInputBorder()),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Cancel')),
                  const SizedBox(width: 20),
                  ElevatedButton(
                      onPressed: () {
                        controller.addTask();
                        Navigator.pop(context);
                      },
                      child: const Text('Add')),
                ],
              )
            ],
          ),
        );

  }
}
