import 'package:weather_app/services/location.dart';
import 'package:weather_app/services/networking.dart';

String apiKey = "f7bcc38a86fdd59860222a2b57617e24";

class WeatherModel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
      "https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric",
    );

    var weatherData = await networkHelper.getData();

    return weatherData;
  }

  //'api.openweathermap.org/data/2.5/weather?q=Lagos&appid=f7bcc38a86fdd59860222a2b57617e24&units=metric'

  getCityWeather(String cityName) async {
    try {
      NetworkHelper networkHelper = NetworkHelper(
          'api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

      var weatherData = await networkHelper.getData();
      print('print?');
      print(weatherData);
      print('Did it');
      return weatherData;
    } catch (e) {
      print("error occoured $e");
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
