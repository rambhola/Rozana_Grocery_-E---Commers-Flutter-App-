import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class NewAddressController extends GetxController{
    Rx<LatLng> currentLatLng = LatLng(28.5693, 77.1521).obs;

    RxInt selectedTypeIndex = 1.obs;

    RxBool isDefault = false.obs;




  void selectType(int index){
    selectedTypeIndex.value = index;
  }

  void toggleDefault(bool? value){
    isDefault.value = value ?? false;
  }

  void updateLocation(double lat,double lng){
    currentLatLng.value = LatLng(lat, lat);
  }
    Future<void> fetchCurrentLocation() async {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      updateLocation(position.latitude, position.longitude);
    }


}