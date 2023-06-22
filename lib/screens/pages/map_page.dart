import 'package:cloud_firestore/cloud_firestore.dart';
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
  void initState() {
    super.initState();
    getData();
  }

  List<Marker> myMarkers = [];

  bool hasLoaded = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasLoaded
          ? Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: FlutterMap(
                options: MapOptions(
                  center: LatLng(8.477217, 124.645920),
                  zoom: 16.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: myMarkers,
                  ),
                ],
              ))
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }

  getJeepney(lat, long) {
    print(lat);
    print(long);
    FirebaseFirestore.instance
        .collection('Users')
        .where('usertype', isEqualTo: 'Driver')
        .get()
        .then((QuerySnapshot querySnapshot) async {
      for (var doc in querySnapshot.docs) {
        setState(() {
          myMarkers.add(Marker(
            point: LatLng(lat, long),
            builder: (context) {
              return Image.asset(
                'assets/images/car.png',
                width: 80,
                height: 80,
              );
            },
          ));
          hasLoaded = true;
        });
      }
    });
  }

  getData() {
    FirebaseFirestore.instance
        .collection('Coordinates')
        .doc('coordinates')
        .get()
        .then((DocumentSnapshot querySnapshot) async {
      getJeepney(querySnapshot['lat'], querySnapshot['long']);
    });
  }
}
