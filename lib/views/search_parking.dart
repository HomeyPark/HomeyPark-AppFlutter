import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchParking extends StatefulWidget {
  const SearchParking({super.key});

  @override
  State<SearchParking> createState() => _SearchParkingState();
}

class _SearchParkingState extends State<SearchParking> {
  late GoogleMapController mapController;

  final LatLng _center = LatLng(-12.1035234, -76.9628504);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(target: _center, zoom: 16.0));
  }
}
