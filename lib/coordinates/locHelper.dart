const GoogleAPI = 'AIzaSyBrJ7q4z1fY8HK4awyY_s1xbHrvZhkWCys';

class LocHelper {
  static String generateLoc({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=14&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GoogleAPI';
  }
}
