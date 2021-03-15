import 'package:clima/services/weather.dart';
import 'location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getlocation();
  }

  void getlocation() async {
    var weatherdata = await Weathermodel().getLocationWeather();

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) {
        return LocationScreen(
          weatherdata,
        );
      }),
    );
  }

  // void getdata() async {
  //   http.Response response = await http.get();

  //   if (response.statusCode == 200) {
  //     String data = response.body;
  //   } else {
  //     print(response.statusCode);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitWave(
          color: Colors.tealAccent,
          size: 70.0,
        ),
      ),
    );
  }
}
