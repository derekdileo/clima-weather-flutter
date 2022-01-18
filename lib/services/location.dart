import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class Location {
  double latitude = 0.0;
  double longitude = 0.0;

  Future<void> getCurrentLocation() async {
    try {
      // Request Permission for Position and Get.
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = (await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low));
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

// double temperature = decodedData['main']['temp'];
// int condition = decodedData['weather'][0]['id'];
// String cityName = decodedData['name'];
// String weatherDescription = decodedData['weather'][0]['description'];
