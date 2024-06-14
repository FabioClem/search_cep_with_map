import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seu endereço'),
      ),
      body: FlutterMap(
        options: const MapOptions(
          initialCenter: LatLng(-15.793889, -47.882778),
          initialZoom: 5.5,
        ),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            userAgentPackageName: 'com.example.app',
          ),
          const MarkerLayer(
            markers: [
              Marker(
                point: LatLng(-15.793889, -47.882778),
                child: Icon(
                  Icons.location_on,
                  color: Colors.red,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
