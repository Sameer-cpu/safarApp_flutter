import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:safar_app/model/constant.dart';
import 'package:safar_app/model/jsons/cardjson.dart';
import 'package:safar_app/model/mapMethos.dart';
import 'package:safar_app/view/components/button.dart';
import 'package:safar_app/view/components/cards.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MapMethods _mapMethods = MapMethods();
  String bottomSheettype = "firstScreen";
  bool cardCheck = true;
  bool isCashed = false;
  Widget crd = Container();
  Widget carCards() {
    List<Widget> addCards = [];

    for (var item in differCarCards) {
      addCards.add(InkWell(
        onTap: () {},
        child: SelectedCards(
          path: item.path,
          title: item.title,
          subTitle: item.subTitle,
          timeText: item.timeText,
          onTab: () {
            setState(() {
              cardCheck = !cardCheck;
              crd = SpecificSelectedCard(
                path: item.path,
                title: item.title,
                subTitle: item.subTitle,
                timeText: item.timeText,
              );
            });
          },
        ),
      ));
    }
    return isCashed == false
        ? Container(
            padding: EdgeInsets.all(20.0),
            alignment: Alignment.center,
            child: ListView(
              children: [
                cardCheck == true
                    ? Container(
                        height: 190,
                        child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: addCards),
                      )
                    : crd,
                SizedBox(
                  height: 30.0,
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  margin:
                      EdgeInsets.symmetric(vertical: 22.0, horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Estimated trip time",
                        style: TextStyle(color: Color(0xFF97ADB6)),
                      ),
                      Text(
                        "24 Min",
                        style: ktimingStyling,
                      ),
                    ],
                  ),
                ),
                Button(
                  color: primeryColor,
                  title: "Book Ride",
                  onPressed: () {
                    setState(() {
                      if (cardCheck == false) {
                        crd = Text("thired sdfsdfsd fsdf");
                        isCashed = true;
                      }
                    });
                  },
                )
              ],
            ))
        : Container(
            alignment: Alignment.center,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Select payment",
                  style: TextStyle(fontSize: fontSize_1),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
                  child: Card(
                    child: Container(
                      padding: EdgeInsets.all(21.0),
                      child: Row(children: [
                        Icon(Icons.payment_rounded),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          "Cash",
                          style: TextStyle(fontSize: fontSize_2),
                        ),
                        Spacer(),
                        Icon(
                          Icons.chevron_right_outlined,
                          color: Color(0xFF97ADB6),
                        )
                      ]),
                    ),
                  ),
                )
              ],
            ));
  }

  @override
  void initState() {
    super.initState();
    _mapMethods.getCurrentLocation();
    BitmapDescriptor.defaultMarkerWithHue(90);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: primeryColor,
        onPressed: () {
          if (isChecked == false) {
            _mapMethods.goToTheLake();
          } else {
            isChecked = !isChecked;
            cardCheck = true;
            isCashed = false;
          }
          setState(() {});
        },
        tooltip: isChecked == false ? "To the lake!" : "Remove",
        child: Icon(isChecked == false
            ? Icons.location_searching_rounded
            : Icons.remove_circle_outline),
      ),
      bottomSheet: isChecked == true
          ? Container(height: size.height / 2, child: carCards())
          : Container(
              child: Text(""),
            ),
      body: SafeArea(
        child: GoogleMap(
          myLocationButtonEnabled: false,
          zoomControlsEnabled: false,
          initialCameraPosition: MapMethods.initialCameraposition,
          markers: {_mapMethods.origin, _mapMethods.distination},
          onLongPress: (pos) {
            setState(() {
              _mapMethods.addmarker(pos);
            });
          },
          onMapCreated: (GoogleMapController controller) {
            _mapMethods.controller.complete(controller);
          },
          // polylines: Set<Polyline>.of(_mapMethods.polylines.values),
          polylines: {
            Polyline(
                polylineId: const PolylineId('overview_polylines'),
                color: Colors.red,
                width: 5,
                points: [
                  LatLng(35.9099933, 74.3534242),
                  LatLng(35.98550781436189, 74.32479936629534),
                  LatLng(35.979146800685896, 74.3706688284874),
                  LatLng(36.03801093532202, 74.3500929325819),
                ])
          },
        ),
      ),
    );
  }
}
