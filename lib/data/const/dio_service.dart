import 'package:dio/dio.dart';
import 'package:test_task_dogbreed/data/const/strings.dart';

class DioInstance {
  static Dio? _dioInstance;

  // Private constructor
  DioInstance._();

  static Dio getDio() {
    // If the Dio instance is not initialized, create one
    if (_dioInstance == null) {
      BaseOptions options = BaseOptions(
        baseUrl: AppStrings.baseURL,
        connectTimeout: const Duration(milliseconds: 5000),
        // Adjust this as needed
        receiveTimeout:
            const Duration(milliseconds: 3000), // Adjust this as needed
      );

      _dioInstance = Dio(options);
    }

    return _dioInstance!;
  }
}
