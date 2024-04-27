import 'package:energise_tet_ex/core/consts.dart';
import 'package:energise_tet_ex/presentation/second_page/controller/controller.dart';
import 'package:energise_tet_ex/presentation/second_page/widgets/geolocation_info_widget.dart';
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
            : LayoutBuilder(
                builder: (_, constraints) {
                  final latLng = secondController.latLng ??
                      const LatLng(
                        defaultLat,
                        defaultLng,
                      );
                  return RefreshIndicator(
                    onRefresh: secondController.getGeolocationData,
                    child: SizedBox(
                      height: constraints.maxHeight,
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 50),
                              height: 200,
                              width: double.infinity,
                              child: GoogleMap(
                                markers: {
                                  Marker(
                                    markerId:
                                        const MarkerId('Coordinate Place'),
                                    position: latLng,
                                  )
                                },
                                initialCameraPosition: CameraPosition(
                                  target: latLng,
                                  zoom: 10,
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                            if (secondController.geolocationModel != null)
                              SlideTransition(
                                position: secondController.offsetAnimation,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      GeolocationInfoWidget(
                                        label: 'status'.tr,
                                        value: secondController
                                            .geolocationModel!.status,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'longitude'.tr,
                                        value: secondController
                                            .geolocationModel!.lon
                                            .toString(),
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'latitude'.tr,
                                        value: secondController
                                            .geolocationModel!.lat
                                            .toString(),
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'city'.tr,
                                        value: secondController
                                            .geolocationModel!.city,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'country_code'.tr,
                                        value: secondController
                                            .geolocationModel!.countryCode,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'country'.tr,
                                        value: secondController
                                            .geolocationModel!.country,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'query'.tr,
                                        value: secondController
                                            .geolocationModel!.query,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'as'.tr,
                                        value: secondController
                                            .geolocationModel!.as,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'isp'.tr,
                                        value: secondController
                                            .geolocationModel!.isp,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'region'.tr,
                                        value: secondController
                                            .geolocationModel!.region,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'region_name'.tr,
                                        value: secondController
                                            .geolocationModel!.regionName,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'time_zone'.tr,
                                        value: secondController
                                            .geolocationModel!.timezone,
                                      ),
                                      GeolocationInfoWidget(
                                        label: 'zip'.tr,
                                        value: secondController
                                            .geolocationModel!.zip,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            const SizedBox(height: 15),
                            ElevatedButton(
                              onPressed: secondController.getGeolocationData,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                              ),
                              child: Text('reload'.tr),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
      },
    );
  }
}
