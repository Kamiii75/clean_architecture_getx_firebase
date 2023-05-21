import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../screens/tabs/completed_task_screen.dart';
import '../screens/tabs/favorite_task_screen.dart';
import '../screens/tabs/pending_task_screen.dart';
import '../widgets/add_task.dart';

class TabsController extends GetxController {
  TabsController(){
    setTitle(pageDetails[0]['title']);
    setPage(pageDetails[0]['pageName']);
  }



  RxString title = ''.obs;
  setTitle(String val) {
    title.value=val;
  }

  Rx<Widget> page = Container().obs;


  setPage(Widget val) {
    page.value = val;
  }

  RxInt tabIndex = 0.obs;


  setTabIndex(int val) {
    tabIndex.value = val;

    setTitle(pageDetails[val]['title']);
    setPage(pageDetails[val]['pageName']);
  }

  List<Map<String, dynamic>> pageDetails = [
    {'pageName': const PendingTasksScreen(), 'title': 'Pending Tasks'},
    {'pageName': const CompletedTasksScreen(), 'title': 'Completed Tasks'},
    {'pageName': const FavoriteTasksScreen(), 'title': 'Favorite Tasks'},
  ];

  void addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom),
                child: const AddTaskScreen(),
              ),
            ));
  }
}
