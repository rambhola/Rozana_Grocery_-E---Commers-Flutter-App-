import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../Home/home_screen.dart';
import '../Profile/profile_screen.dart';
import 'new_address.dart';

class ManageAddress extends StatefulWidget {
  const ManageAddress({super.key});

  @override
  State<ManageAddress> createState() => _ManageAddressState();
}

class _ManageAddressState extends State<ManageAddress> {
  List<Map<String, dynamic>> _suggestions = [];
  bool _isSearching = false;

  final TextEditingController searchController = TextEditingController();

  // Map controller
  final MapController _mapController = MapController();

  // Current camera position (fallback: India)
  LatLng _currentCenter = const LatLng(20.5937, 78.9629);

  // Markers list
  final List<Marker> _markers = [];

  // Saved addresses
  final List<Map<String, dynamic>> _savedAddresses = [];

  // Loading flag
  bool _loadingLocation = false;

  // When user taps on map
  void _onMapTap(LatLng latlng) async {
    final newMarker = Marker(
      point: latlng,
      width: 40,
      height: 40,
      child: const Icon(Icons.location_on, size: 40, color: Colors.red),
    );

    setState(() {
      _markers.clear();
      _markers.add(newMarker);
    });

    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/reverse?format=jsonv2&lat=${latlng.latitude}&lon=${latlng.longitude}',
    );

    try {
      final res = await http.get(url, headers: {'User-Agent': 'FlutterApp'});
      if (res.statusCode == 200) {
        final data = json.decode(res.body);
        final address = data['display_name'] ?? 'Unknown address';
        _showAddressBottomSheet(latlng, address);
      }
    } catch (e) {
      debugPrint('Reverse geocoding failed: $e');
    }
  }

  // Show address in a bottom sheet
  void _showAddressBottomSheet(LatLng latlng, String address) {
    showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(address, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {

                setState(() {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(
                        address: address, newAddress: '',
                      ),
                    ),
                  );
                });

               // Optionally save the address later if needed
                setState(() {
                  _savedAddresses.add({
                    'address': address,
                    'lat': latlng.latitude,
                    'lng': latlng.longitude,
                  });
                });
              },
              child: const Text("Save Address"),
            ),
            const SizedBox(width: 10),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Cancel"),
            ),
          ],
        )
        ],
        ),
      ),
    );
  }

  // Move map to current location
  Future<void> _goToCurrentLocation() async {
    setState(() => _loadingLocation = true);

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      setState(() => _loadingLocation = false);
      return;
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final latlng = LatLng(pos.latitude, pos.longitude);

    setState(() {
      _currentCenter = latlng;
      _markers.clear();
      _markers.add(
        Marker(
          point: latlng,
          width: 40,
          height: 40,
          child: const Icon(Icons.my_location, size: 40, color: Colors.blue),
        ),
      );
    });

    _mapController.move(latlng, 16.0);
    setState(() => _loadingLocation = false);
  }

  // Function to Search Location

  Future<void> searchLocation(String query) async {
    if (query.isEmpty) return;

    final url = Uri.parse(
      'https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1',
    );
    try {
      final response = await http.get(
        url,
        headers: {'User-Agent': 'FlutterApp'},
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);

        if (data.isNotEmpty) {
          final lat = double.parse(data[0]['lat']);
          final lon = double.parse(data[0]['lon']);
          final latLng = LatLng(lat, lon);

          setState(() {
            _currentCenter = latLng;
            _markers.clear();
            _markers.add(
              Marker(
                point: latLng,
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.location_on,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            );
          });

          _mapController.move(latLng, 14.0);
        } else {
          ScaffoldMessenger.of(
            context ,
          ).showSnackBar(const SnackBar(content: Text("Location not found")));
        }
      }
    } catch (e) {
      debugPrint("Search failed: $e");
    }
  }

  void _goToSearchedLocation(Map<String, dynamic> suggestion) {
    final lat = double.parse(suggestion['lat']);
    final lon = double.parse(suggestion['lon']);
    final latlng = LatLng(lat, lon);

    setState(() {
      _currentCenter = latlng;
      _suggestions.clear();
      _markers.clear();
      _markers.add(
        Marker(
          point: latlng,
          width: 40,
          height: 40,
          child: const Icon(
            Icons.location_on,
            size: 40,
            color: Colors.red,
          ),
        ),
      );
    });

    _mapController.move(latlng, 15.0);
  }

  Future<List<Map<String, dynamic>>> _fetchSuggestions(String query) async {
    if (query.isEmpty) return [];
    final url = Uri.parse(
        'https://nominatim.openstreetmap.org/search?q=$query&format=json&addressdetails=1&limit=5');

    try {
      final res = await http.get(url, headers: {'User-Agent': 'FlutterApp'});
      if (res.statusCode == 200) {
        final List data = json.decode(res.body);
        return data.map((e) {
          return {
            'display_name': e['display_name'],
            'lat': e['lat'],
            'lon': e['lon'],
          };
        }).toList();
      } else {
        return [];
      }
    } catch (e) {
      debugPrint('Error fetching suggestions: $e');
      return [];
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () => Get.to(() => const ProfileScreen()),
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xFF00A86B),
                size: 30,
              ),
            ),
          ),
        ),
        title: Text(
          "Manage Address",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),

      // Main body
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;

          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 8.h),

                // Search bar
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Column(
                    children: [
                      Container(
                        height: 55.h,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: TextField(
                          controller: searchController,
                          onChanged: (value) async {
                            setState(() => _isSearching = true);
                            final results = await _fetchSuggestions(value);
                            setState(() {
                              _suggestions = results;
                              _isSearching = false;
                            });
                          },
                          decoration: const InputDecoration(
                            hintText: 'Search location...',
                            prefixIcon: Icon(Icons.search, size: 28),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 14),
                          ),
                        ),
                      ),

                      // Suggestions dropdown
                      if (_suggestions.isNotEmpty)
                        Container(
                          margin: EdgeInsets.only(top: 5.h),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8.r),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: _suggestions.length,
                            itemBuilder: (context, index) {
                              final suggestion = _suggestions[index];
                              return ListTile(
                                leading: const Icon(Icons.location_on, color: Colors.green),
                                title: Text(
                                  suggestion['display_name'],
                                  style: const TextStyle(fontSize: 14),
                                ),
                                onTap: () {
                                  FocusScope.of(context).unfocus();
                                  _goToSearchedLocation(suggestion);
                                },
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ),



                // Current location button
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Container(
                    height: isLandscape ? 85.h : 60.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.r),
                      border: Border.all(
                        width: 2.w,
                        color: const Color(0xFF00A86B),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.location_searching,
                          color: Color(0xFF00A86B),
                        ),
                        SizedBox(width: 8.w),
                        TextButton(
                          onPressed: _goToCurrentLocation,
                          child: Text(
                            "Use my Current Location",
                            style: TextStyle(
                              color: const Color(0xFF00A86B),
                              fontSize: isLandscape ? 11.sp : 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                // Add new address
                Padding(
                  padding: EdgeInsets.all(10.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(NewAddress());
                    },
                    child: Container(
                      height: isLandscape ? 85.h : 60.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10.r),
                        border: Border.all(
                          width: 2.w,
                          color: const Color(0xFF00A86B),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.add_location_alt,
                            color: Color(0xFF00A86B),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            "Add New Address",
                            style: TextStyle(
                              color: const Color(0xFF00A86B),
                              fontSize: isLandscape ? 11.sp : 17.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                // Map section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SizedBox(
                    height: 400,
                    width: double.infinity,
                    child: FlutterMap(
                      mapController: _mapController,
                      options: MapOptions(
                        initialCenter: _currentCenter,
                        initialZoom: 13.0,
                        onTap: (tapPosition, point) => _onMapTap(point),
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                          subdomains: const ['a', 'b', 'c'],
                        ),
                        MarkerLayer(markers: _markers),
                      ],
                    ),
                  ),
                ),

                SizedBox(height: 10.h),

                // Saved addresses
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 18.w,
                    vertical: 5.w,
                  ),
                  child: Text(
                    "Saved Address",
                    style: TextStyle(
                      fontSize: isLandscape ? 14.sp : 23.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                // Show saved addresses
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: _savedAddresses.map((addr) {
                      return ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          color: Colors.green,
                        ),
                        title: Text(addr['address']),
                        subtitle: Text(
                          "Lat: ${addr['lat']}, Lng: ${addr['lng']}",
                          style: const TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
