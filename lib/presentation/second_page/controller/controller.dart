import 'package:energise_tet_ex/core/api_services/api_service.dart';
import 'package:energise_tet_ex/core/models/geolocation_model.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondController extends GetxController with GetTickerProviderStateMixin {
  final _api = ApiService();

  late final Animation<Offset> offsetAnimation;
  late final AnimationController _controller;

  @override
  void onInit() {
    super.onInit();
    getGeolocationData();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 1.5),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.bounceInOut,
    ));
  }

  void resetAnimation() {
    _controller.reset();
    _controller.forward();
  }

  GeolocationModel? geolocationModel;
  LatLng? latLng;

  bool isLoading = true;

  Future<void> getGeolocationData() async {
    isLoading = true;
    update();
    geolocationModel = await _api.getGeolocationData();
    _setCameraPosition();
  }

  void _setCameraPosition() {
    if (geolocationModel != null) {
      latLng = LatLng(geolocationModel!.lat ?? 37.43296265331129,
          geolocationModel!.lon ?? -122.08832357078792);
    }
    isLoading = false;
    update();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}
