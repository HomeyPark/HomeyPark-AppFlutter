import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class SearchParking extends StatefulWidget {
  const SearchParking({super.key});

  @override
  State<SearchParking> createState() => _SearchParkingState();
}

class _SearchParkingState extends State<SearchParking> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(-12.1035234, -76.9628504);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
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
                    snippet: "Universidad Peruana de Ciencias Aplicadas"))
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
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Ingresa una ubicación",
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(15.0),
                    prefixIcon: Icon(Icons.search),
                  ),
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
                      onPressed: () {},
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
