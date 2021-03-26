import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/services/weather.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/utilities/containers.dart';

class LocationScreen extends StatefulWidget {
  final locationWeather;

  const LocationScreen({this.locationWeather});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temperature;
  AssetImage weatherIcon;
  String cityName;
  AssetImage weatherImage;
  String weatherMessage;
  Color weatherColor;

  @override
  void initState() {
    super.initState();
    updateUI(widget.locationWeather);
  }

  void updateUI(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = AssetImage('images/exclamation-mark.png');
        weatherColor = Colors.red;
        weatherMessage = 'Unable to get weather data';
        cityName = '';
        weatherImage = AssetImage('images/exclamation-mark.png');
        return;
      }
      double temp = weatherData['main']['temp'];
      temperature = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      weatherImage = weather.getWeatherImage(condition);
      weatherMessage = weather.getMessage(temperature);
      weatherColor = weather.getColor(temperature);
      cityName = weatherData['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ContainersScreen(
      colour: weatherColor,
      itsText: '$weatherMessage in $cityName',
      pictureRow: weatherIcon,
      temperatureData: temperature,
      onTap: () async {
        var weatherData = await weather.getLocationWeather();
        updateUI(weatherData);
        print(cityName);
      },
      textCity: cityName,
      localCity: Container(
        width: 200,
        height: 40,
        child: TextField(
          style: TextStyle(color: Colors.black),
          decoration: kTextFieldInputDecoration,
          onChanged: (value) {
            cityName = value;
          },
        ),
      ),
      onTapCity: () async {
        var typedName = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return CityScreen();
            },
          ),
        );
        if (typedName != null) {
          var weatherData = await weather.getCityWeather(typedName);
          updateUI(weatherData);
        }
        /* var cityName = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (
              context,
            ) {
              return LocationScreen();
            },
          ),
        );
        if (cityName != null) {
          var weatherData = await weather.getCityWeather(cityName);
          updateUI(weatherData);
        }
        print(cityName); */
      },
      picture: weatherImage,
    ));
  }
}
