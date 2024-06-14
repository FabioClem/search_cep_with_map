import 'package:url_launcher/url_launcher.dart';

class Laucher {
  static Future<void> openUrlMap(double lat, double long) async {
    Uri googleMapsUrl =
        Uri.parse('https://www.google.com/maps/search/?api=1&query=$lat,$long');
    _openUrlMap(googleMapsUrl);
  }

  static Future<void> _openUrlMap(Uri uri) async {
    await launchUrl(uri);
  }
}
