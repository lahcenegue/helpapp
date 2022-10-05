import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatefulWidget {
  final double lan;
  final double lat;
  const MapScreen({
    super.key,
    required this.lan,
    required this.lat,
  });

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<GoogleMapController> _controller = Completer();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تأكيد الموقع'),
        ),
        body: GoogleMap(
            zoomGesturesEnabled: true,
            myLocationEnabled: true,
            compassEnabled: false,
            tiltGesturesEnabled: false,
            markers: {
              Marker(
                markerId: MarkerId(LatLng(widget.lat, widget.lan).toString()),
                position: LatLng(widget.lat, widget.lan),
              ),
            },
            mapType: MapType.normal,
            initialCameraPosition: CameraPosition(
              target: LatLng(widget.lat, widget.lan),
              zoom: 14.4746,
            )),
      ),
    );
  }
}
