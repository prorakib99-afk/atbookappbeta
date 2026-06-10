import 'package:dio/dio.dart';
import 'package:atbookappbeta/models/login_request.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../services/api_services.dart';
import '../views/dashboard_screen.dart';
import '../views/login_screen.dart';

class AuthController extends GetxController {
  final ApiService apiService = ApiService();
  final GetStorage box = GetStorage();

  final RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final request = LoginRequest(email: email, password: password);

      final result = await apiService.login(request);

      print("TOKEN => ${result.token}");

      if (result.token.isEmpty) {
        throw Exception("Token not found in response");
      }

      await box.write('access_token', result.token);

      Get.offAll(() => const DashboardScreen());
    } on DioException catch (e) {
      print("DIO ERROR => ${e.response?.data}");

      Get.snackbar(
        "Login Failed",
        e.response?.data.toString() ?? e.message ?? "Network Error",
      );
    } catch (e) {
      print("LOGIN ERROR => $e");

      Get.snackbar("Login Failed", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> logout() async {
    try {
      await box.remove('access_token');

      Get.offAll(() => const LoginScreen());
    } catch (e) {
      Get.snackbar("Logout Failed", e.toString());
    }
  }

  bool get isLoggedIn {
    return box.read('access_token') != null;
  }
}
