// import 'package:dio/dio.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:safar_app/model/constant.dart';
// import 'package:safar_app/model/direction.dart';

// class Direction_Repository {
//   static const String _baseURL =
//       "https://maps.googleapis.com/maps/api/directions.json?";
//   // final Dio _dio;
//   Future<Directions> getDirection(LatLng origin, LatLng destinatioon) async {
//     final response = await Dio().get(_baseURL, queryParameters: {
//       'origin': "${origin.latitude}, ${origin.longitude}",
//       'destination': "${destinatioon.latitude}, ${destinatioon.longitude}",
//       'key': googleAPIkey,
//     });
//     // getDirection({ LatLng origin,LatLng destinatioon }) async {

//     //   final response = await Dio().get(_baseURL, queryParameters: {
//     //     'origin': '${}'
//     //   });
//     // }
//     if (response.statusCode == 200) {
//       Direction.fromEach((Map<String, dynamic> map) {
//         if ((map["routes"] as List).isEmpty) return null;
//         final data = Map<String, dynamic>.from(map["routes"][0]);
//         final northeast = data["bounds"]["northeast"];
//         fianl southwest = data["bounds"]["southwest"];
//         final bounds = LatLngBonds(
//             northeast: LatLng(northeast["lat"], northeast["lng"],
//                 southwest: LatLin(southwast["lat"], southwest["lng"])));
//         String distance = "";
//         String duration = "";
//         if ((data["legs"] as list).isEmpty) {
//           final leg = data["legs"][0];
//           distance = leg["distance"]["text"];
//           duration = leg["duration"]["text"];
//         }
//       });
//     }

//     return null;
//   }
// }
