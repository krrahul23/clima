import 'package:geolocator/geolocator.dart';

class Location {
  double latitude;
  double longitude;
  Future<void> getCurrentLocation() async {
    try {
      var g = await checkPermission();
      if (g == LocationPermission.denied) {
        return;
      } else if (g == LocationPermission.deniedForever) {
        print('denied Forever');
        return;
      }
      bool isLocationServiceEnable = await isLocationServiceEnabled();
      if (isLocationServiceEnable == false) {
        return;
      }
      Position position = await getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}

// if (await isLocationServiceEnabled() != true) {
//       print('ERROR');
//       return;
//     }
//     try {
//       Position position =
//           await getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
//       longitude = position.longitude;
//       latitude = position.latitude;
//     } catch (e) {
//       print(e);
//     }
