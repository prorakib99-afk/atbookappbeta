import 'package:atbookappbeta/models/login_request.dart';
import 'package:atbookappbeta/models/login_response.dart';
import 'package:dio/dio.dart';
import 'package:get_storage/get_storage.dart';

class ApiService {
  final GetStorage box = GetStorage();

  late final Dio dio =
      Dio(
          BaseOptions(
            baseUrl: 'https://backend.altamam.cloud',
            headers: {'Content-Type': 'application/json'},
          ),
        )
        ..interceptors.add(
          InterceptorsWrapper(
            onRequest: (options, handler) {
              final token = box.read('access_token');

              if (token != null) {
                options.headers['Authorization'] = 'Bearer $token';
              }

              handler.next(options);
            },
          ),
        );

  Future<LoginResponse> login(LoginRequest request) async {
    final response = await dio.post('/api/auth/login', data: request.toJson());

    return LoginResponse.fromJson(response.data);
  }
}
