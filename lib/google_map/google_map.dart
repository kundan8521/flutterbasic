import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'dart:async';
import 'package:flutter/services.dart' show rootBundle;

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  GoogleMapController? mapController;
  final LatLng _center = LatLng(25.612677, 85.158875);
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  LatLng _lastMapPosition = LatLng(25.612677, 85.158875);
  MapType _currentMapType = MapType.normal;
  TextEditingController _searchController = TextEditingController();
  String _mapStyle = '';
  BitmapDescriptor? truckIcon;

  List<LatLng> polylineCoordinates = [
    LatLng(25.612677, 85.158875),
    LatLng(25.615000, 85.160000),
    LatLng(25.618000, 85.162000),
  ];

  @override
  void initState() {
    super.initState();
    _loadMapStyle();
    _loadTruckIcon();
    _addPolyline();
    Future.delayed(Duration(seconds: 1), _addInitialAndTruckMarkers);
  }

  Future<void> _loadMapStyle() async {
    _mapStyle = await rootBundle.loadString('assets/map_style.json');
  }

  Future<void> _loadTruckIcon() async {
    truckIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(size: Size(48, 48)),
      'assets/images/truck_image.png',
    );
  }

  void _addInitialAndTruckMarkers() {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId('start'),
          position: polylineCoordinates.first,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(title: "Pickup: Gandhi Maidan"),
        ),
      );

      if (truckIcon != null) {
        _markers.add(
          Marker(
            markerId: MarkerId('truck'),
            position: polylineCoordinates.last,
            icon: truckIcon!,
            infoWindow: InfoWindow(title: "Truck (Destination)"),
          ),
        );
      }
    });
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    mapController?.setMapStyle(_mapStyle);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  void _onAddMarkerButtonPressed() async {
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(_lastMapPosition.toString()),
          position: _lastMapPosition,
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
          infoWindow: InfoWindow(title: "Custom Marker"),
        ),
      );
    });
  }

  void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal ? MapType.hybrid : MapType.normal;
    });
  }

  void _searchAndNavigate() async {
    List<Location> locations = await locationFromAddress(_searchController.text);
    if (locations.isNotEmpty) {
      Location location = locations.first;
      mapController?.animateCamera(CameraUpdate.newLatLngZoom(
        LatLng(location.latitude, location.longitude),
        14.0,
      ));

      setState(() {
        _markers.add(
          Marker(
            markerId: MarkerId('searched'),
            position: LatLng(location.latitude, location.longitude),
            icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
            infoWindow: InfoWindow(
              title: _searchController.text,
              snippet: "Searched Location",
            ),
          ),
        );
      });
    }
  }

  void _addPolyline() {
    setState(() {
      _polylines.add(
        Polyline(
          polylineId: PolylineId("route"),
          points: polylineCoordinates,
          width: 5,
          color: Colors.blueAccent,
          startCap: Cap.squareCap,
          endCap: Cap.squareCap,
          jointType: JointType.round,
          patterns: [PatternItem.dash(20), PatternItem.gap(10)],
        ),
      );
    });
  }

  Widget _buildFloatingActionButton(IconData icon, VoidCallback onPressed) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.white,
      elevation: 4,
      child: Icon(icon, color: Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 13.0,
            ),
            myLocationEnabled: true,
            mapType: _currentMapType,
            markers: _markers,
            polylines: _polylines,
            onCameraMove: _onCameraMove,
            zoomControlsEnabled: false,
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
                    ),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: "Search location...",
                        prefixIcon: Icon(Icons.search, color: Colors.green),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      ),
                      onSubmitted: (value) => _searchAndNavigate(),
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFloatingActionButton(Icons.my_location, () {
                        mapController?.animateCamera(
                            CameraUpdate.newLatLngZoom(_center, 14));
                      }),
                      _buildFloatingActionButton(Icons.map, _onMapTypeButtonPressed),
                      _buildFloatingActionButton(Icons.add_location, _onAddMarkerButtonPressed),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Pickup: Gandhi Maidan", style: TextStyle(fontWeight: FontWeight.bold)),
                  SizedBox(height: 6),
                  Text("Destination: Patna Junction"),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
