import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationService {
  Location location = Location();
  late LocationData _locData;

  Future<Map<String, double?>?> initializeAndGetLocation(
    BuildContext context,
  ) async {
    bool serviceEnable;
    PermissionStatus permissionGranted;

    serviceEnable = await location.serviceEnabled();
    if (!serviceEnable) {
      serviceEnable = await location.requestService();
      if (!serviceEnable) {
        return null;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
    }
    _locData = await location.getLocation();
    return {
      'latitude': _locData.latitude,
      'longitude': _locData.longitude,
    };
  }
}
