import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'controller/auth_controller.dart';
import 'controller/dashboard_controller.dart';

import 'views/dashboard_screen.dart';
import 'views/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();

  // Controllers Initialize
  Get.put(AuthController(), permanent: true);
  Get.put(DashboardController(), permanent: true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final box = GetStorage();
    final token = box.read('access_token');

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ATBOOK ERP',

      theme: ThemeData(useMaterial3: true, primarySwatch: Colors.green),

      home: token != null ? const DashboardScreen() : const LoginScreen(),
    );
  }
}
