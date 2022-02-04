import 'package:geolocator/geolocator.dart';

class Location {
  late double longitude;
  late double latitude;
  //Location({required this.latitude, required this.longitude});

  Future<void> getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    longitude = position.longitude;
    latitude = position.latitude;
  }
}
