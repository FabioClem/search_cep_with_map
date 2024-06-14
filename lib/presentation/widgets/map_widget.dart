import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapWidget extends StatelessWidget {
  final double latitude;
  final double longitude;

  final double zoom;

  final Widget? mark;

  const MapWidget({
    super.key,
    required this.latitude,
    required this.longitude,
    this.zoom = 5.5,
    this.mark,
  });

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: LatLng(
          latitude,
          longitude,
        ),
        initialZoom: zoom,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.example.app',
        ),
        MarkerLayer(
          markers: [
            Marker(
              point: LatLng(
                latitude,
                longitude,
              ),
              child: mark ??
                  const Icon(
                    Icons.location_on,
                    color: Colors.red,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
