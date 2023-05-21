import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/theme_controller.dart';
import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/todo_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyDrawer extends GetView<TodoController> {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          GestureDetector(
            // onTap: () =>
            //     Navigator.of(context).pushReplacementNamed(TabScreen.id),
            child: ListTile(
              title: const Text('My Tasks'),
              leading: const Icon(Icons.folder_special),
              trailing: Text(
                  '${controller.pendingTasks.length} | ${controller.completedTasks.length}'),
            ),
          ),
          GestureDetector(
            // onTap: () =>
            //     Navigator.of(context).pushReplacementNamed(RecycleBin.id),
            child: ListTile(
              title: const Text('Bin'),
              leading: const Icon(Icons.delete),
              trailing: Text(controller.removedTasks.length.toString()),
            ),
          ),
          GetBuilder<ThemeController>(builder: (themeProvider) {
            return ListTile(
              title: Text(themeProvider.switchValue.value
                  ? 'Dark Theme'
                  : 'Light Theme'),
              trailing: Switch(
                  value: themeProvider.switchValue.value,
                  onChanged: (val) => themeProvider.onEventSwitch(val)),
            );
          })
        ]),
      ),
    );
  }
}
