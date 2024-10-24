import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:homey_park_mobile_app/views/view_history.dart';
import 'package:homey_park_mobile_app/views/view_reservation.dart';
import 'package:http/http.dart' as http;

class SearchParking extends StatefulWidget {
  const SearchParking({super.key});

  @override
  State<SearchParking> createState() => _SearchParkingState();
}

class _SearchParkingState extends State<SearchParking> {
  late GoogleMapController mapController;
  final searchQueryFieldController = TextEditingController();
  final String? apiKey = dotenv.env['GOOGLE_PLACES_API_KEY'];

  final LatLng _center = const LatLng(-12.1035234, -76.9628504);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  void _onSearch() async {
    var client = http.Client();

    try {
      var response = await client.post(
          Uri.parse("https://places.googleapis.com/v1/places:searchText"),
          headers: {
            "Content-Type": "application/json",
            "X-Goog-Api-Key": apiKey ?? '',
            "X-Goog-FieldMask": "*",
          },
          body: jsonEncode({"textQuery": searchQueryFieldController.text}));

      if (response.statusCode != 200) {
        throw Exception("Error al realizar la búsqueda");
      }

      var data = jsonDecode(response.body);

      var location = data['places'][0]['location'];
      var latitude = location['latitude'];
      var longitude = location['longitude'];
      print('Response body: ${location}');

      mapController
          .animateCamera(CameraUpdate.newLatLng(LatLng(latitude, longitude)));
    } finally {
      client.close();
    }
  }

  void navigateToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewHistory()),
    );
  }

  void navigateToParkingDetail() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ViewReservation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(target: _center, zoom: 16.0),
          zoomControlsEnabled: false,
          markers: {
            Marker(
                markerId: const MarkerId("1"),
                position: _center,
                infoWindow: const InfoWindow(
                    title: "UPC",
                    snippet: "Universidad Peruana de Ciencias Aplicadas"),
                onTap: navigateToParkingDetail),
          },
        ),
        // Cuadro de búsqueda y botones superpuestos
        // Cuadro de búsqueda y botones superpuestos
        Positioned(
          top: 40,
          left: 15,
          right: 15,
          child: Column(
            children: [
              // Barra de búsqueda
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5.0,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: TextField(
                  controller: searchQueryFieldController,
                  decoration: InputDecoration(
                      hintText: "Ingresa una ubicación",
                      border: InputBorder.none,
                      contentPadding: const EdgeInsets.all(15.0),
                      suffixIcon: IconButton(
                          onPressed: _onSearch,
                          icon: const Icon(Icons.search))),
                ),
              ),

              // Botones de "Precio" y "Historial"
              Row(
                children: [
                  Expanded(
                      child: FilledButton(
                    onPressed: () {},
                    child: const Text("Precio"),
                  )),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      onPressed: navigateToHistory,
                      child: const Text("Historial"),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
