import 'package:clean_architecture_getx_firebase/feature/todo/presentation/controllers/theme_controller.dart';
import 'package:clean_architecture_getx_firebase/shared/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'feature/todo/presentation/controllers/main_bindings.dart';
import 'feature/todo/presentation/screens/tab_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeController>(
      init: ThemeController(),
      builder: (logic) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Todos',
          theme: logic.switchValue.value
              ? AppThemes.appThemeData[AppTheme.darkTheme]
              : AppThemes.appThemeData[AppTheme.lightTheme],
          home: const TabScreen(),
          initialBinding: MainBinding(),
        );
      },
    );
  }
}
