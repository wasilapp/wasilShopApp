import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mangerapp/utils/helper/navigator.dart';
import 'package:mangerapp/utils/ui/common_views.dart';
import 'package:mangerapp/views/auth/signup_screen/signup_screen.dart';
import 'package:search_map_place_updated/search_map_place_updated.dart';
import '../../generated/l10n.dart';
import '../../utils/helper/shared_pref.dart';


class SearchLocationScreen extends StatefulWidget {
  static String address = '';
  static var latitude='31.984398 ';
  static var longitude='35.937957';

  const SearchLocationScreen({super.key});

  @override
  State<SearchLocationScreen> createState() => _SearchLocationScreenState();
}

class _SearchLocationScreenState extends State<SearchLocationScreen> {


  late GoogleMapController mapController;
  Geolocation? geo;
  static LatLng _center = const LatLng(31.984398, 35.937957);
  final Set<Marker> _markers = HashSet();


  @override
  void initState() {
    super.initState();
    addressTFController = TextEditingController();
    address2TFController = TextEditingController();
    cityTFController = TextEditingController();
    pinCodeTFController = TextEditingController();

    gettingLocation();
  }
  Future<void> gettingLocation() async {
    LocationPermission locationPermission = await _setupLocationPermission();

    if (locationPermission != LocationPermission.always &&
        locationPermission != LocationPermission.whileInUse) {
      return;
    }

    Position position;
    try {
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      double zoom = await mapController.getZoomLevel();
      final List<Placemark> placeMarks = await placemarkFromCoordinates(position.latitude, position.longitude);


      cityTFController!.text= placeMarks[0].locality.toString();
      addressTFController!.text= placeMarks[0].street.toString();



      _changeLocation(zoom, LatLng(position.latitude, position.longitude));
    } catch (error) {
      return ;
    }
  }

  _setupLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      return await Geolocator.requestPermission();
    } else if (permission == LocationPermission.deniedForever) {
      Geolocator.openAppSettings();
    }
    return permission;
  }
  @override
  dispose() {
    super.dispose();

    mapController.dispose();
  }

  void addDonationPlace() {}


  //Text Controller
  TextEditingController? addressTFController,
      address2TFController,
      cityTFController,
      pinCodeTFController;

  void _onMapTap(LatLng latLong) {
    mapController
        .getZoomLevel()
        .then((zoom) => {_changeLocation(zoom, latLong)});
  }

  Future<void> _changeLocation(double zoom, LatLng latLng) async {

    double newZoom = zoom > 15 ? zoom : 15;
    final List<Placemark> placemarks = await placemarkFromCoordinates(latLng.latitude,latLng.longitude);


    cityTFController!.text= placemarks[0].locality.toString();
    addressTFController!.text= placemarks[0].street.toString();

    setState(() {
      SearchLocationScreen.address=  addressTFController!.text;
      SearchLocationScreen.latitude=latLng.latitude.toString();
      SearchLocationScreen.longitude=latLng.longitude.toString();
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: newZoom)));
      _markers.clear();
      _markers.add(Marker(
        markerId: const MarkerId('1'),
        position: latLng,
      ));
    });
  }
  Marker marker = const Marker(
    markerId: MarkerId('1'),
    position: LatLng(31.936783, 35.874772),
  );
  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _markers.add(marker);
    });
  }

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        body: Stack(children: [
          Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: SizedBox(
              height: 700,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                markers: _markers,
                onTap: _onMapTap,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
              )
            ),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Container(
                margin: const EdgeInsets.all(30),
                decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child:           SingleChildScrollView(
                  child:
                  SearchMapPlaceWidget(

                    bgColor: Colors.white,
                    iconColor: Colors.black,
                    placeholder: S.of(context).searchLocation,
                    placeType: PlaceType.address,
                    hasClearButton: false,
                    textColor: Colors.black,
                    apiKey: 'AIzaSyC7OA_kF9duRuHHew__jN_HdYh8yq0BCtE',
                    onSelected: (Place place) async {



                      //   _onAddMarkerButtonPressed();
                      geo = await place.geolocation;

                      mapController.animateCamera(
                          CameraUpdate.newLatLng(geo?.coordinates));
                      mapController.animateCamera(
                          CameraUpdate.newLatLngBounds(geo?.bounds, 0));
                      _center = geo!.coordinates;
                      _onMapTap(_center);
                    },
                  )
                ),
              )),
          Align(
            alignment: Alignment.bottomCenter,
            child: CommonViews().createButton(title: S.of(context).confirmYourLocation, onPressed: () {



              SharedPreferenceHelper().save(key: 'address', type: SaveType.stringType, value:SearchLocationScreen.address);
              SharedPreferenceHelper().save(key: 'longitude', type: SaveType.stringType, value:SearchLocationScreen.longitude);
              SharedPreferenceHelper().save(key: 'latitude', type: SaveType.stringType, value:SearchLocationScreen.latitude);

              log(SearchLocationScreen.address);
              MangerNavigator.of(context).pop();

//MangerNavigator.of(context).pop();



            },),
          )

        ]),
      ),
    );
  }
}