import 'package:flutter/material.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Dashboard", style: TextStyle(fontSize: 30)),
    );
  }
}

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Users", style: TextStyle(fontSize: 30)));
  }
}

class DepartmentsPage extends StatelessWidget {
  const DepartmentsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Departments", style: TextStyle(fontSize: 30)),
    );
  }
}

class EmployeesPage extends StatelessWidget {
  const EmployeesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Employees", style: TextStyle(fontSize: 30)),
    );
  }
}

class AccountingPage extends StatelessWidget {
  const AccountingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Accounting", style: TextStyle(fontSize: 30)),
    );
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Reports", style: TextStyle(fontSize: 30)));
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Settings", style: TextStyle(fontSize: 30)),
    );
  }
}
