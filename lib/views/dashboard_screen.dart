import 'package:atbookappbeta/controller/auth_controller.dart';
import 'package:atbookappbeta/controller/dashboard_controller.dart';
import 'package:atbookappbeta/pages/dashboard_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dashboardController = Get.find<DashboardController>();
    final authController = Get.find<AuthController>();

    final pages = [
      const DashboardPage(),
      const UsersPage(),
      const DepartmentsPage(),
      const EmployeesPage(),
      const AccountingPage(),
      const ReportsPage(),
      const SettingsPage(),
    ];

    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 250,
            color: Colors.blueGrey.shade900,
            child: Column(
              children: [
                const SizedBox(height: 40),

                const Text(
                  "ATBOOK ERP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 30),

                menuItem(Icons.dashboard, "Dashboard", 0, dashboardController),

                menuItem(Icons.people, "Users", 1, dashboardController),

                menuItem(
                  Icons.apartment,
                  "Departments",
                  2,
                  dashboardController,
                ),

                menuItem(Icons.badge, "Employees", 3, dashboardController),

                menuItem(
                  Icons.account_balance_wallet,
                  "Accounting",
                  4,
                  dashboardController,
                ),

                menuItem(Icons.bar_chart, "Reports", 5, dashboardController),

                menuItem(Icons.settings, "Settings", 6, dashboardController),

                const Spacer(),

                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),
                  title: const Text(
                    "Logout",
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () async {
                    await authController.logout();
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),

          Expanded(
            child: Column(
              children: [
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.white,
                  child: Row(
                    children: [
                      const Text(
                        "Dashboard Panel",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      CircleAvatar(child: Text("R")),
                    ],
                  ),
                ),

                Expanded(
                  child: Obx(
                    () => pages[dashboardController.selectedIndex.value],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget menuItem(
    IconData icon,
    String title,
    int index,
    DashboardController controller,
  ) {
    return Obx(
      () => ListTile(
        tileColor: controller.selectedIndex.value == index
            ? Colors.blue
            : Colors.transparent,
        leading: Icon(icon, color: Colors.white),
        title: Text(title, style: const TextStyle(color: Colors.white)),
        onTap: () {
          controller.changePage(index);
        },
      ),
    );
  }
}
