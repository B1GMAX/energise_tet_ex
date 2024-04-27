import 'package:dio/dio.dart';
import 'package:energise_tet_ex/core/models/geolocation_model.dart';
import 'package:get/get.dart';

class ApiService {
  final _dio = Dio();

  Future<GeolocationModel?> getGeolocationData() async {
    final response =
        await _dio.get('http://ip-api.com/json/?lang=${Get.deviceLocale}');
    if (response.statusCode == 200) {
      try {
        return GeolocationModel.fromJson(response.data);
      } catch (e) {
        Get.snackbar('Something went wrong!', 'Something went wrong!');
      }
    }
    return null;
  }
}
