import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/tabs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'my_drawer.dart';

class TabScreen extends GetView<TabsController> {
  const TabScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text(controller.title.value)),
        actions: [
          IconButton(
            onPressed: () => controller.addTask(context),
            icon: const Icon(Icons.add),
          )
        ],
      ),
      drawer: const MyDrawer(),
      body: Obx(() => controller.page.value),
      floatingActionButton: Obx(() => controller.tabIndex.value == 0
          ? FloatingActionButton(
              onPressed: () => controller.addTask(context),
              tooltip: 'Add Task',
              child: const Icon(Icons.add),
            )
          : const SizedBox.shrink()),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.tabIndex.value,
        onTap: (index) => controller.setTabIndex(index),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.incomplete_circle_rounded),
              label: 'Pending Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.done), label: 'Completed Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite), label: 'Favorite Task')
        ],
      ),
    );
  }
}
