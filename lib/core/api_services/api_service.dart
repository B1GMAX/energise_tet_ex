import 'package:dio/dio.dart';
import 'package:energise_tet_ex/core/models/geolocation_model.dart';
import 'package:get/get.dart';

class ApiService {
  final _dio = Dio();

  Future<GeolocationModel?> getGeolocationData() async {
    final response =
        await _dio.get('http://ip-api.com/json/');
    if (response.statusCode == 200) {
      try {
        print('response.data - ${response.data}');
        return GeolocationModel.fromJson(response.data);
      } catch (e, s) {
        print('error - $e; stack - $s');
        Get.snackbar('Something went wrong!', 'Something went wrong!');
      }
    }
    return null;
  }
}
