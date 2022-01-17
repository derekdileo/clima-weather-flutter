import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  Future<void> getLocation() async {
    try {
      // Request Permission for Position and Get.
      LocationPermission permission = await Geolocator.requestPermission();
      print('Permission: $permission');
      Position position = (await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low));
      print(position);
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
