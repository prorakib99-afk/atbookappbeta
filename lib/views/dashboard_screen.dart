import 'package:atbookappbeta/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.put(AuthController());

    return Scaffold(
      appBar: AppBar(title: const Text("Dashboard")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text("Login Success", style: TextStyle(fontSize: 22)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () async {
              await Get.find<AuthController>().logout();
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
