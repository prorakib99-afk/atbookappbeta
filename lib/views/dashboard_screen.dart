import 'package:atbookappbeta/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final AuthController authController = Get.find<AuthController>();

  bool isCollapsed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          /// Sidebar
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: isCollapsed ? 70 : 260,
            color: const Color(0xff1E293B),

            child: Column(
              children: [
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.account_balance, color: Colors.white),

                    if (!isCollapsed)
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "ATBOOK",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),

                const SizedBox(height: 30),

                Expanded(
                  child: ListView(
                    children: [
                      _menuTile(icon: Icons.dashboard, title: "Dashboard"),

                      _menuTile(icon: Icons.people, title: "HRM"),

                      _menuTile(icon: Icons.receipt_long, title: "Accounts"),

                      _menuTile(icon: Icons.shopping_cart, title: "Sales"),

                      _menuTile(icon: Icons.bar_chart, title: "Reports"),

                      _menuTile(icon: Icons.settings, title: "Settings"),
                    ],
                  ),
                ),

                const Divider(color: Colors.white24),

                ListTile(
                  leading: const Icon(Icons.logout, color: Colors.red),

                  title: isCollapsed
                      ? null
                      : const Text(
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

          /// Main Content
          Expanded(
            child: Column(
              children: [
                /// Top Navbar
                Container(
                  height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(blurRadius: 5, color: Colors.black12),
                    ],
                  ),

                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        },
                        icon: const Icon(Icons.menu),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "Dashboard",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const Spacer(),

                      const Icon(Icons.notifications_none),

                      const SizedBox(width: 20),

                      CircleAvatar(child: Text("R")),
                    ],
                  ),
                ),

                /// Dashboard Body
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: GridView.count(
                      crossAxisCount: 4,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      children: const [
                        DashboardCard(title: "Revenue", value: "0"),
                        DashboardCard(title: "Expenses", value: "6500"),
                        DashboardCard(title: "Profit", value: "-6500"),
                        DashboardCard(title: "Customers", value: "0"),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menuTile({required IconData icon, required String title}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: isCollapsed
          ? null
          : Text(title, style: const TextStyle(color: Colors.white)),
      onTap: () {},
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;

  const DashboardCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
