import 'package:flutter/material.dart';
import 'package:clima_weather_flutter/services/location.dart';
import 'package:clima_weather_flutter/services/networking.dart';
import 'package:clima_weather_flutter/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const String apiKey = '1d931b610ea125c7e78c075d7bfbe4a5';
const String weatherMapURL = 'https://api.openweathermap.org/data/2.5/weather';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  Future<void> getLocationData() async {
    // Instantiate Location object
    Location location = Location();

    // Gather lat / long via getCurrentLocation()
    await location.getCurrentLocation();

    // Generate a Uri for API call
    var url = Uri.parse(
        '$weatherMapURL?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=imperial');

    // Instantiate NetworkHelper object with Uri
    NetworkHelper networkHelper = NetworkHelper(url);

    // Gather jsonDecoded weatherData
    var weatherData = await networkHelper.getData();

    // Build Location Screen, pass weatherData to its constructor.
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
