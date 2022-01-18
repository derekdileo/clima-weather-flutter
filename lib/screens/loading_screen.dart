import 'package:flutter/material.dart';
import 'package:clima_weather_flutter/services/location.dart';
import 'package:clima_weather_flutter/services/networking.dart';

const String apiKey = '1d931b610ea125c7e78c075d7bfbe4a5';
const String weatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  double latitude = 0.0;
  double longitude = 0.0;

  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;

    var url =
        Uri.parse('$weatherMapURL?lat=$latitude&lon=$longitude&appid=$apiKey');

    NetworkHelper networkHelper = NetworkHelper(url);

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
