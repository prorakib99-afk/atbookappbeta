class ApiEndpoints {
  ApiEndpoints._();

  // Auth
  static const String login = "/api/auth/login";
  static const String me = "/api/auth/me";
  static const String acceptinvitation = "/api/auth/accept-invitation";

  //Organization
  static const String organizations = "/api/organizations";
  static const String organizationDetails = "/api/organizations/{id}";

  // Dashboard
  static const String dashboard = "/api/dashboard";

  // User Management
  static const String users = "/api/users";
  static const String roles = "/api/roles";

  // HRM
  static const String departments = "/api/hrm/departments";
  static const String employees = "/api/hrm/employees";
  static const String attendance = "/api/hrm/attendance";
  static const String payroll = "/api/hrm/payroll";

  // Accounting
  static const String chartOfAccounts = "/api/accounting/chart-of-accounts";

  static const String bankAccounts = "/api/accounting/bank-accounts";

  static const String expenses = "/api/accounting/expenses";

  static const String deposits = "/api/accounting/deposits";

  // Sales
  static const String customers = "/api/sales/customers";

  static const String invoices = "/api/sales/invoices";

  // Reports
  static const String reports = "/api/reports";

  // Notifications
  static const String notifications = "/api/notifications";
}
