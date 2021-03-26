import 'package:flutter/material.dart';
import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

const apiKey = '80d4c545eb7e8bd11cae6e821c4ae991';
const openWeatherMapURl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    NetWorkHelper netWorkHelper = NetWorkHelper(
        '$openWeatherMapURl?q=$cityName&appid=$apiKey&unit=metric');

    var weatherData = await netWorkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetWorkHelper netWorkHelper = NetWorkHelper(
        '$openWeatherMapURl?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');

    var weatherData = await netWorkHelper.getData();

    return weatherData;
  }

  AssetImage getWeatherIcon(int condition) {
    if (condition < 501) {
      return AssetImage('images/heavy-rain.png');
    } else if (condition < 504) {
      return AssetImage('images/rain.png');
    } else if (condition < 322) {
      return AssetImage('images/umbrella.png');
    } else if (condition < 601) {
      return AssetImage('images/snowman.png');
    } else if (condition < 512) {
      return AssetImage('images/thermometer.png');
    } else if (condition == 800) {
      return AssetImage('images/sun.png');
    } else if (condition <= 804) {
      return AssetImage('images/cloudy.png');
    } else {
      return AssetImage('images/exclamation-mark.png');
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\s sunny';
    } else if (temp > 20) {
      return 'It\s chill';
    } else if (temp <= 19) {
      return 'It\s cold';
    } else {
      return 'Bring a coat just in case';
    }
  }

  AssetImage getWeatherImage(int condition) {
    if (condition < 300) {
      return AssetImage('images/heavy-rain.png');
    } else if (condition < 400) {
      return AssetImage('images/raining.jpg');
    } else if (condition < 600) {
      return AssetImage('images/raining.jpg');
    } else if (condition < 700) {
      return AssetImage('images/cold.jpg');
    } else if (condition < 800) {
      return AssetImage('images/chill.jpg');
    } else if (condition == 800) {
      return AssetImage('images/cold.jpg');
    } else if (condition <= 804) {
      return AssetImage('images/cloudy.jpg');
    } else {
      return AssetImage('images/exclamation-mark.png');
    }
  }

  Color getColor(int temp) {
    if (temp > 25) {
      return Colors.amber;
    } else if (temp > 20) {
      return Colors.lightBlue;
    } else if (temp <= 19) {
      return Colors.grey;
    } else {
      return Colors.redAccent;
    }
  }
}
