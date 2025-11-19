import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rozana_grocery_app/repository/Screens/Home/home_screen.dart';

class Location {
  final String streetAddress;
  final String city;
  final String state;

  Location({
    required this.streetAddress,
    required this.city,
    required this.state,
  });

  String get fullAddress => "$streetAddress, $city, $state";
}

Future<List<Location>> fetchLocations() async {
  await Future.delayed(Duration(seconds: 1));

  return [
    Location(streetAddress: '56 street', city: 'Bhopal', state: 'MP'),
    Location(streetAddress: '56 street', city: 'Bhopal', state: 'MP'),
    Location(streetAddress: 'Sector 12', city: 'Indore', state: 'MP'),
    Location(streetAddress: 'Green Park', city: 'Jaipur', state: 'Rajasthan'),
    Location(streetAddress: 'MG Road', city: 'Udaipur', state: 'Rajasthan'),
  ];
}

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  int? _selectedIndex;
  Location? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Pick Location",
          style: TextStyle(fontSize: 26.sp, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isLandscape = constraints.maxWidth > constraints.maxHeight;
          return
          Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: fetchLocations(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final loc = snapshot.data![index];

                        final bool isSelected = _selectedIndex == index;

                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIndex = index;
                              selectedLocation = loc;
                            });
                          },
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 12),
                            padding: EdgeInsets.symmetric(horizontal: 14),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                width: 2,
                                color: isSelected ? Color(0xFF00A86B) : Colors.grey.shade300,
                              ),
                              color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.transparent,
                            ),
                            child: Row(
                              children: [

                                Expanded(
                                  child: Text(
                                    loc.fullAddress,
                                    style: TextStyle(fontSize: 18.sp),
                                  ),
                                ),
                                isSelected
                                    ? Icon(Icons.check_circle, color: Color(0xFF00A86B), size: 26)
                                    : Icon(Icons.radio_button_unchecked, color: Colors.grey, size: 26),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),

              Center(
                child: GestureDetector(
                  onTap: () {
                    if(_selectedIndex == null){
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Please select a locations')),
                      );



                    }
                  },
                  child: Container(
                    height: isLandscape ? 60.h : 65.h,
                    width: 350.w,
                    margin: EdgeInsets.only(bottom: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.r),
                      color: const Color(0xFF00A86B),
                    ),
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => HomeScreen(
                              address: selectedLocation!.fullAddress,
                              newAddress: selectedLocation!.fullAddress,
                            ),
                          ),
                        );
                      },
                      child: Text(
                        'Set as Default',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: isLandscape ? 12.sp : 20.sp,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },

      ),
    );
  }
}
