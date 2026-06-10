import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/auth_controller.dart';
import '../controller/dashboard_controller.dart';
import '../pages/dashboard_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final DashboardController dashboardController =
        Get.find<DashboardController>();

    final AuthController authController = Get.find<AuthController>();

    final pages = [
      const DashboardPage(),

      const Center(
        child: Text(
          "Users",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      const Center(
        child: Text(
          "Departments",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      const Center(
        child: Text(
          "Employees",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      const Center(
        child: Text(
          "Accounting",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      const Center(
        child: Text(
          "Reports",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      const Center(
        child: Text(
          "Settings",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    ];

    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.orange),
              child: Center(
                child: Text(
                  "AT BOOK ERP",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text("Dashboard"),
              onTap: () {
                dashboardController.changePage(0);
                Get.back();
              },
            ),

            ExpansionTile(
              leading: const Icon(Icons.account_balance),
              title: const Text("Accounts"),
              children: const [
                ListTile(title: Text("Chart Of Accounts")),
                ListTile(title: Text("List Accounts")),
                ListTile(title: Text("Bank Accounts")),
                ListTile(title: Text("Cash Accounts")),
              ],
            ),

            ExpansionTile(
              leading: const Icon(Icons.swap_horiz),
              title: const Text("Transactions"),
              children: const [ListTile(title: Text("Transaction List"))],
            ),

            ExpansionTile(
              leading: const Icon(Icons.money_off),
              title: const Text("Expenses"),
              children: const [ListTile(title: Text("Expense List"))],
            ),

            ExpansionTile(
              leading: const Icon(Icons.attach_money),
              title: const Text("Income / Deposits"),
              children: const [ListTile(title: Text("Deposits"))],
            ),

            ExpansionTile(
              leading: const Icon(Icons.shopping_cart),
              title: const Text("Sales"),
              children: const [
                ListTile(title: Text("Customers")),
                ListTile(title: Text("Invoices")),
              ],
            ),

            ExpansionTile(
              leading: const Icon(Icons.receipt_long),
              title: const Text("Purchases"),
              children: const [ListTile(title: Text("Purchase List"))],
            ),

            ListTile(
              leading: const Icon(Icons.bar_chart),
              title: const Text("Reports"),
              onTap: () {
                dashboardController.changePage(5);
                Get.back();
              },
            ),
            ExpansionTile(
              leading: const Icon(Icons.badge),
              title: const Text("HRM"),
              children: [
                ListTile(
                  title: const Text("Departments"),
                  onTap: () {
                    dashboardController.changePage(2);
                    Get.back();
                  },
                ),

                ListTile(
                  title: const Text("Employees"),
                  onTap: () {
                    dashboardController.changePage(3);
                    Get.back();
                  },
                ),
              ],
            ),

            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text("Settings"),
              onTap: () {
                dashboardController.changePage(6);
                Get.back();
              },
            ),

            const Divider(),

            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text("Logout"),
              onTap: () async {
                await authController.logout();
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [BoxShadow(blurRadius: 4, color: Colors.black12)],
              ),
              child: Builder(
                builder: (context) {
                  return Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.menu),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      ),

                      const SizedBox(width: 5),

                      const Expanded(
                        child: Text(
                          "AT BOOK ERP",
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.notifications_none),
                      ),

                      const SizedBox(width: 5),

                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircleAvatar(
                              radius: 15,
                              child: Text("MR", style: TextStyle(fontSize: 12)),
                            ),

                            SizedBox(width: 4),

                            Icon(Icons.keyboard_arrow_down, size: 18),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),

            Expanded(
              child: Container(
                color: Colors.grey.shade100,
                child: Obx(
                  () => pages[dashboardController.selectedIndex.value],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
