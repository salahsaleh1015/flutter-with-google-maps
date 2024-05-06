import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomGoogleMapWidget extends StatefulWidget {
  const CustomGoogleMapWidget({super.key});

  @override
  State<CustomGoogleMapWidget> createState() => _CustomGoogleMapWidgetState();
}

class _CustomGoogleMapWidgetState extends State<CustomGoogleMapWidget> {
  late CameraPosition initialCameraPosition;

  @override
  void initState() {
    initialCameraPosition = const CameraPosition(
        target: LatLng(29.979146593257592, 30.942451707562007), zoom: 11.0);
    super.initState();
  }

  late GoogleMapController googleMapController;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          onMapCreated: (controller) {
            googleMapController = controller;
          },
            cameraTargetBounds: CameraTargetBounds(LatLngBounds(
              northeast: const LatLng(30.087337041808762, 30.969917527762526),
              southwest: const LatLng(29.89971209330168, 30.902797928808166),
            )),
            initialCameraPosition: initialCameraPosition),
        Positioned(
            bottom: 16,
            right: 16,
            left: 16,
            child: ElevatedButton(
                onPressed: () {

                }, child: const Text("change location")))
      ],
    );
  }
}

// camera zoom level
// world view 0 -> 3
// country view 4 ->6
// city view 10->12
// street view 13->17
// building view 18-> 20
