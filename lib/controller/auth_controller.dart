import 'package:atbookappbeta/models/login_request.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../services/api_services.dart';
import '../views/dashboard_screen.dart';

class AuthController extends GetxController {
  final ApiService apiService = ApiService();
  final GetStorage box = GetStorage();

  RxBool isLoading = false.obs;

  Future<void> login(String email, String password) async {
    try {
      isLoading.value = true;

      final request = LoginRequest(email: email, password: password);

      final result = await apiService.login(request);

      await box.write('access_token', result.token);

      Get.offAll(() => const DashboardScreen());
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
