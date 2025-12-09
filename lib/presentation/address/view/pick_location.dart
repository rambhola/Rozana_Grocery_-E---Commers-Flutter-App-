import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'new_address.dart';

class Location {
  final String streetAddress;
  final String city;
  final String state;

  Location({
    required this.state,
    required this.city,
    required this.streetAddress,
  });

  String get fullAddress => "$streetAddress, $city, $state";
}

class PickLocation extends StatefulWidget {
  final Location? manualLocation;

  const PickLocation({super.key, this.manualLocation});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  int? _selectedIndex;
  Location? selectedLocation;
  Location? savedLocation;
  List<Location> saveLocations = [];

  @override
  void initState() {
    super.initState();

    savedLocation = widget.manualLocation;
    if (savedLocation != null) {
      saveLocations.add(savedLocation!);
      _selectedIndex = 0;
      selectedLocation = savedLocation;
    }
  }

  // Open New Address Page
  Future<void> openNewAddress() async {
    final newLocation = await Get.to(() => NewAddress());

    if (newLocation != null && newLocation is Location) {
      setState(() {
        saveLocations.add(newLocation); //
        _selectedIndex = saveLocations.length - 1;
        selectedLocation = newLocation;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool hasAddress = saveLocations.isNotEmpty;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick Location",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: openNewAddress,
        backgroundColor: const Color(0xFF00A86B),
        child: const Icon(Icons.add, color: Colors.white),
      ),

      body: Column(
        children: [
          Expanded(
            child: hasAddress
                ? ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: saveLocations.length,
              itemBuilder: (context, index) {
                final loc = saveLocations[index];
                final bool isSelected = _selectedIndex == index;

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      selectedLocation = loc;
                    });
                  },
                  onLongPress: openNewAddress,
                  child: Container(
                    height: 80,
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 12),
                    padding: EdgeInsets.symmetric(horizontal: 14),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        width: 2,
                        color: isSelected
                            ? const Color(0xFF00A86B)
                            : Colors.grey.shade300,
                      ),
                      color: isSelected
                          ? Colors.green.withOpacity(0.1)
                          : Colors.transparent,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            loc.fullAddress,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        isSelected
                            ? const Icon(
                          Icons.check_circle,
                          color: Color(0xFF00A86B),
                          size: 26,
                        )
                            : const Icon(
                          Icons.radio_button_unchecked,
                          color: Colors.grey,
                          size: 26,
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
                : Center(
              child: Text(
                "No address added.\nTap + to add a new one.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18.sp, color: Colors.grey),
              ),
            ),
          ),

          // Set as Default Button
          if (hasAddress)
            Container(
              height: 65.h,
              width: 350.w,
              margin: EdgeInsets.only(bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.r),
                color: const Color(0xFF00A86B),
              ),
              child: TextButton(
                onPressed: () {
                  if (selectedLocation == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please select a location')),
                    );
                    return;
                  }

                  // Send the selected location back to HomeScreen
                  Get.back(result: selectedLocation!);
                },
                child: Text(
                  'Set as Default',
                  style: TextStyle(color: Colors.white, fontSize: 20.sp),
                ),
              ),

            ),
        ],
      ),
    );
  }
}
