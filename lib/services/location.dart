import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;

  Future<void> getcurrentlocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);

      longitude = position.longitude;
      latitude = position.latitude;
      print(Position());
    } catch (e) {
      print(e);
    }
  }
}
