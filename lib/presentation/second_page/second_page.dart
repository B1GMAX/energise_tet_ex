import 'package:energise_tet_ex/presentation/second_page/controller/controller.dart';
import 'package:energise_tet_ex/presentation/third_page/third_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    final secondController = Get.put(SecondController());
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: GetBuilder<SecondController>(
          builder: (context) => secondController.isLoading
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
                                    'Status - ${secondController.geolocationModel!.status ?? ''}'),
                                Text(
                                    'Longitude - ${secondController.geolocationModel!.lon ?? ''}'),
                                Text(
                                    'Latitude - ${secondController.geolocationModel!.lat ?? ''}'),
                                Text(
                                    'City - ${secondController.geolocationModel!.city ?? ''}'),
                                Text(
                                    'County code - ${secondController.geolocationModel!.countryCode ?? ''}'),
                                Text(
                                    'Country - ${secondController.geolocationModel!.country ?? ''}'),
                                Text(
                                    'Query - ${secondController.geolocationModel!.query ?? ''}'),
                                Text(
                                    'As - ${secondController.geolocationModel!.as ?? ''}'),
                                Text(
                                    'Isp - ${secondController.geolocationModel!.isp ?? ''}'),
                                Text(
                                    'Region - ${secondController.geolocationModel!.region ?? ''}'),
                                Text(
                                    'Region name - ${secondController.geolocationModel!.regionName ?? ''}'),
                                Text(
                                    'Time zone - ${secondController.geolocationModel!.timezone ?? ''}'),
                                Text(
                                    'Zip - ${secondController.geolocationModel!.zip ?? ''}'),
                              ],
                            ),
                          ),
                        const SizedBox(height: 15),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => const ThirdPage());
                            },
                            // secondController.getGeolocationData,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,),
                            child: const Text('Reload'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
