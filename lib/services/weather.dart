import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';

const ApiKey = 'b9f97da873dd0f93e563a1651f8ed765';
const openWeatherMapApi = 'https://api.openweathermap.org/data/2.5/weather';

class Weathermodel {
  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getcurrentlocation();

    NetworkHelper networkHelper = NetworkHelper(
        '$openWeatherMapApi?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKey&units=metric');
    var weatherdata = await networkHelper.getdata();

    return weatherdata;
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
