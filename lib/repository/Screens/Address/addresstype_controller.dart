import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:latlong2/latlong.dart';

class NewAddressController extends GetxController {
  var loadingLocations = false.obs;

  var latitude = 0.0.obs;
  var longitude = 0.0.obs;

  RxInt selectedTypeIndex = (1).obs;
  var showForm = false.obs;

  RxBool isDefault = false.obs;

  var currentLatLng = Rx<LatLng?>(null);


  void selectType(int index) {
    selectedTypeIndex.value = index;
    showForm.value = true;
  }

  void toggleDefault(bool? value) {
    isDefault.value = value ?? false;
  }

  void updateLocation(double lat, double lng) {
    latitude.value = lat;
    longitude.value = lng;
    currentLatLng.value = LatLng(lat, lng);
  }


  Future<void> getCurrentLocation() async {
    loadingLocations.value = true;

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      loadingLocations.value = false;
      return;
    }

    final pos = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    latitude.value = pos.latitude;
    longitude.value = pos.longitude;
    currentLatLng.value = LatLng(pos.latitude, pos.longitude);

    loadingLocations.value = false;
  }

  var street = "".obs;
  var city = "".obs;
  var state = "".obs;
  var pinCode = "".obs;
  var country = "".obs;


  var streetError = "".obs;
  var cityError = "".obs;
  var stateError = "".obs;
  var pinCodeError = "".obs;
  var countryError = "".obs;

  bool validate() {
    streetError.value = street.value.isEmpty ? "Street address is required" : "";
    cityError.value = city.value.isEmpty ? "City is required" : "";
    stateError.value = state.value.isEmpty ? "State is required" : "";
    pinCodeError.value = pinCode.value.isEmpty ? "Pincode is required" : "";
    countryError.value = country.value.isEmpty ? "Country is required" : "";


    return streetError.value.isEmpty &&
        cityError.value.isEmpty &&
        stateError.value.isEmpty &&
        pinCodeError.value.isEmpty &&
        countryError.value.isEmpty;
  }
}
