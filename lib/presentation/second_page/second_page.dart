import 'package:energise_tet_ex/presentation/second_page/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final secondController = Get.put(SecondController());
    return GetBuilder<SecondController>(
      didChangeDependencies: (controller) {
        secondController.resetAnimation();
      },
      builder: (context) {
        return secondController.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: secondController.getGeolocationData,
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 55),
                        height: 200,
                        width: double.infinity,
                        child: GoogleMap(
                          markers: {
                            Marker(
                              markerId: const MarkerId('Coordinate Place'),
                              position: secondController.latLng != null
                                  ? secondController.latLng!
                                  : const LatLng(
                                      37.43296265331129,
                                      -122.08832357078792,
                                    ),
                            )
                          },
                          initialCameraPosition: CameraPosition(
                            target: secondController.latLng != null
                                ? secondController.latLng!
                                : const LatLng(
                                    37.43296265331129,
                                    -122.08832357078792,
                                  ),
                            zoom: 10,
                          ),
                        ),
                      ),
                      const SizedBox(height: 15),
                      if (secondController.geolocationModel != null)
                        SlideTransition(
                          position: secondController.offsetAnimation,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                  '${'status'.tr} - ${secondController.geolocationModel!.status ?? ''}'),
                              Text(
                                  '${'longitude'.tr} - ${secondController.geolocationModel!.lon ?? ''}'),
                              Text(
                                  '${'latitude'.tr} - ${secondController.geolocationModel!.lat ?? ''}'),
                              Text(
                                  '${'city'.tr} - ${secondController.geolocationModel!.city ?? ''}'),
                              Text(
                                  '${'country_code'.tr} - ${secondController.geolocationModel!.countryCode ?? ''}'),
                              Text(
                                  '${'country'.tr} - ${secondController.geolocationModel!.country ?? ''}'),
                              Text(
                                  '${'query'.tr} - ${secondController.geolocationModel!.query ?? ''}'),
                              Text(
                                  '${'as'.tr} - ${secondController.geolocationModel!.as ?? ''}'),
                              Text(
                                  '${'isp'.tr} - ${secondController.geolocationModel!.isp ?? ''}'),
                              Text(
                                  '${'region'.tr} - ${secondController.geolocationModel!.region ?? ''}'),
                              Text(
                                  '${'region_name'.tr} - ${secondController.geolocationModel!.regionName ?? ''}'),
                              Text(
                                  '${'time_zone'.tr} - ${secondController.geolocationModel!.timezone ?? ''}'),
                              Text(
                                  '${'zip'.tr} - ${secondController.geolocationModel!.zip ?? ''}'),
                            ],
                          ),
                        ),
                      const SizedBox(height: 15),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: secondController.getGeolocationData,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green,
                          ),
                          child: Text('reload'.tr),
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
