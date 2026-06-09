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

      final response = await apiService.login(email, password);

      print("STATUS => ${response.statusCode}");
      print("DATA => ${response.data}");

      if (response.statusCode == 200 || response.statusCode == 201) {
        String? token;

        // বিভিন্ন common token key check
        if (response.data['access_token'] != null) {
          token = response.data['access_token'];
        } else if (response.data['token'] != null) {
          token = response.data['token'];
        }

        if (token == null || token.isEmpty) {
          Get.snackbar("Error", "Token not found in response");
          return;
        }

        await box.write('access_token', token);

        Get.snackbar("Success", "Login Successful");

        Get.offAll(() => const DashboardScreen());
      }
    } on DioException catch (e) {
      print(e.response?.data);

      Get.snackbar(
        "Error",
        e.response?.data.toString() ?? e.message ?? "Login Failed",
      );
    } catch (e) {
      print(e);

      Get.snackbar("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void logout() {
    box.remove('access_token');

    Get.offAllNamed('/login');
  }
}
