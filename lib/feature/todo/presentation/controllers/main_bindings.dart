import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/tabs_controller.dart';
import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/theme_controller.dart';
import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/todo_controller.dart';
import 'package:get/get.dart';



class MainBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ThemeController());
    Get.lazyPut(() => TabsController());
    Get.lazyPut(() => TodoController(addTodoUseCase: Get.find(), editTodoUseCase: Get.find(), deleteTodoUseCase: Get.find(), getAllTodoUseCase: Get.find()));
  }
}
