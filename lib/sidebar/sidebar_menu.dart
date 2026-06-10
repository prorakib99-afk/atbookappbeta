import 'package:flutter/material.dart';

class SidebarMenu extends StatelessWidget {
  const SidebarMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.deepOrange),
            child: Text(
              "AT BOOK ERP",
              style: TextStyle(color: Colors.white, fontSize: 22),
            ),
          ),

          const ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
          ),

          ExpansionTile(
            leading: const Icon(Icons.account_balance),
            title: const Text("Accounts"),
            children: const [
              ListTile(title: Text("Chart of Accounts")),
              ListTile(title: Text("List Accounts")),
              ListTile(title: Text("Bank Accounts")),
              ListTile(title: Text("Cash Accounts")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.swap_horiz),
            title: const Text("Transactions"),
            children: const [
              ListTile(title: Text("Transfer")),
              ListTile(title: Text("Journal Entry")),
              ListTile(title: Text("Ledger")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.money_off),
            title: const Text("Expenses"),
            children: const [
              ListTile(title: Text("Expense List")),
              ListTile(title: Text("Add Expense")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.attach_money),
            title: const Text("Income / Deposits"),
            children: const [
              ListTile(title: Text("Deposit List")),
              ListTile(title: Text("Add Deposit")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.point_of_sale),
            title: const Text("Sales"),
            children: const [
              ListTile(title: Text("Customers")),
              ListTile(title: Text("Invoices")),
              ListTile(title: Text("Payments")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.shopping_cart),
            title: const Text("Purchases"),
            children: const [
              ListTile(title: Text("Vendors")),
              ListTile(title: Text("Bills")),
              ListTile(title: Text("Payments")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.bar_chart),
            title: const Text("Reports"),
            children: const [
              ListTile(title: Text("Profit & Loss")),
              ListTile(title: Text("Balance Sheet")),
              ListTile(title: Text("Cash Flow")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.people),
            title: const Text("HRM"),
            children: const [
              ListTile(title: Text("Departments")),
              ListTile(title: Text("Employees")),
              ListTile(title: Text("Attendance")),
              ListTile(title: Text("Payroll")),
            ],
          ),

          ExpansionTile(
            leading: const Icon(Icons.settings),
            title: const Text("Settings"),
            children: const [
              ListTile(title: Text("Users")),
              ListTile(title: Text("Roles")),
              ListTile(title: Text("Company")),
            ],
          ),
        ],
      ),
    );
  }
}
