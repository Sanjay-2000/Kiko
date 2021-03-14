// import 'dart:io';
import 'location_screen.dart';
import 'package:clima/services/location.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/networking.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

const ApiKey = 'b9f97da873dd0f93e563a1651f8ed765';

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
    Location location = Location();
    await location.getcurrentlocation();

    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$ApiKey&units=metric');
    var weatherdata = await networkHelper.getdata();

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
