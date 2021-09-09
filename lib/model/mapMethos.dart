import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safar_app/model/constant.dart';

class MapMethods {
  static const initialCameraposition = CameraPosition(
      target: LatLng(35.9100014, 74.3533936), zoom: 11.5, tilt: 50.0);
  Completer<GoogleMapController> controller = Completer();

  LatLng currentPostion = LatLng(0.0, 0.0);
  Marker origin = Marker(
    markerId: const MarkerId("origin"),
  );
  Marker distination = Marker(
    markerId: const MarkerId("Destination"),
  );
  Future<void> goToTheLake() async {
    final GoogleMapController mapController = await controller.future;
    mapController.animateCamera(CameraUpdate.newCameraPosition(kLake));
  }

  CameraPosition kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void getCurrentLocation() async {
    Position position = await GeolocatorPlatform.instance
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
    // setState(() {
    currentPostion = LatLng(position.latitude, position.longitude);
    print("Current Position ========== $currentPostion");
    origin = Marker(
      markerId: const MarkerId("origin"),
      infoWindow: const InfoWindow(title: "Origin"),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
      position: currentPostion,
    );
    kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: currentPostion,
        tilt: 59.440717697143555,
        zoom: 19.151926040649414);
    // });
  }

  void addmarker(LatLng pos) {
    // setState(() {
    print("Destination ==== $pos");
    isChecked = true;

    distination = Marker(
        markerId: const MarkerId("Destination"),
        infoWindow: const InfoWindow(title: "Destination"),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        position: isChecked == true ? pos : LatLng(0.0, 0.0));
  }

  // PolylinePoints polylinePoints = PolylinePoints();
  // Map<PolylineId, Polyline> polylines = {};
  // void _getPolyline(
  //     _originLatitude, _originLongitude, _destLatitude, _destLongitude) async {
  //   List<LatLng> polylineCoordinates = [];

  //   PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
  //     googleAPIkey,
  //     PointLatLng(_originLatitude, _originLongitude),
  //     PointLatLng(_destLatitude, _destLongitude),
  //     travelMode: TravelMode.driving,
  //   );
  //   if (result.points.isNotEmpty) {
  //     result.points.forEach((PointLatLng point) {
  //       polylineCoordinates.add(LatLng(point.latitude, point.longitude));
  //     });
  //   } else {
  //     print("= ===== === === = ${result.errorMessage}");
  //   }
  //   _addPolyLine(polylineCoordinates);
  // }

  // _addPolyLine(List<LatLng> polylineCoordinates) {
  //   PolylineId id = PolylineId("poly");
  //   Polyline polyline = Polyline(
  //     polylineId: id,
  //     color: Colors.red,
  //     points: polylineCoordinates,
  //     width: 8,
  //   );
  //   polylines[id] = polyline;
  // }

//   // Object for PolylinePoints
//   late PolylinePoints polylinePoints;

// // List of coordinates to join
//   List<LatLng> polylineCoordinates = [
//     LatLng(35.9104442, 74.3525603),
//     LatLng(35.90324013731258, 74.35232788324356)
//   ];

// // Map storing polylines created by connecting two points
//   Map<PolylineId, Polyline> polylines = {};
//   createPolylines(
//       double startLatitude,
//       double startLongitude,
//       double destinationLatitude,
//       double destinationLongitude,
//       LatLng pos) async {
//     // Initializing PolylinePoints
//     polylinePoints = PolylinePoints();

//     // Generating the list of coordinates to be used for
//     // drawing the polylines
//     dynamic result = await polylinePoints.getRouteBetweenCoordinates(
//       googleAPIkey, // Google Maps API Key
//       // currentPostion : currentPostion,
//       // distination : pos,

//       PointLatLng(startLatitude, startLongitude),
//       PointLatLng(destinationLatitude, destinationLongitude),
//       travelMode: TravelMode.transit,
//     );

//     // Adding the coordinates to the list

//     if (result.points.isNotEmpty) {
//       result.points.forEach((PointLatLng point) {
//         polylineCoordinates.add(LatLng(point.latitude, point.longitude));
//       });
//     }

//     print(
//         "===== checking contadion ${result.points.isNotEmpty} and values ${result.points}");
//     // Defining an ID
//     PolylineId id = PolylineId('poly');

//     // Initializing Polyline
//     Polyline polyline = Polyline(
//       polylineId: id,
//       color: Colors.red,
//       points: polylineCoordinates,
//       width: 3,
//     );

//     // Adding the polyline to the map
//     polylines[id] = polyline;
//   }
}
