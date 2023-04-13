import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:ndialog/ndialog.dart';
import 'package:story_app_intermediate_final/presentation/routes/app_route.dart';
import 'package:story_app_intermediate_final/presentation/widgets/button_widget.dart';

import 'package:geocoding/geocoding.dart' as geo;

import '../../common.dart';
import '../blocs/location_bloc/location_bloc.dart';
import '../utils/constants.dart';

class PickLocation extends StatefulWidget {
  const PickLocation({super.key});

  @override
  State<PickLocation> createState() => _PickLocationState();
}

class _PickLocationState extends State<PickLocation> {
  final selectLocation = const LatLng(-0.789275, 113.921327);

  late GoogleMapController mapController;

  late final Set<Marker> markers = {};

  geo.Placemark? placemark;

  double? _latitude;
  double? _longitude;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.pickLocationAppBar),
      ),
      body: Center(
        child: Stack(
          children: [
            GoogleMap(
              zoomControlsEnabled: false,
              initialCameraPosition: CameraPosition(
                zoom: 18,
                target: selectLocation,
              ),
              markers: markers,
              onMapCreated: (controller) async {
                final info = await geo.placemarkFromCoordinates(
                  selectLocation.latitude,
                  selectLocation.longitude,
                );

                final place = info[0];
                final street = place.street!;

                // address
                final subLocality = place.subLocality;
                final locality = place.locality;
                final postalCode = place.postalCode;
                final country = place.country;
                final address =
                    '$subLocality, $locality, $postalCode, $country';

                setState(() {
                  placemark = place;
                });

                defineMarker(selectLocation, street, address);

                setState(() {
                  mapController = controller;
                });
              },
              onTap: (LatLng latLng) => onLongPressGoogleMap(latLng),
              onLongPress: (LatLng latLng) => onLongPressGoogleMap(latLng),
            ),
            Positioned(
              top: 16,
              right: 16,
              child: FloatingActionButton(
                child: const Icon(Icons.my_location),
                onPressed: () => onMyLocationButtonPress(),
              ),
            ),
            if (placemark == null)
              const SizedBox()
            else
              Positioned(
                bottom: 96,
                right: 16,
                left: 16,
                child: PlacemarkWidget(
                  placemark: placemark!,
                ),
              ),
            Positioned(
              bottom: 20,
              left: 16,
              right: 16,
              child: _longitude == null
                  ? ButtonWidget(
                      title: AppLocalizations.of(context)!.pickLocationBtn,
                      borderRadius: 12,
                      onPressed: () {
                        NAlertDialog(
                          backgroundColor: kBackground,
                          dialogStyle: DialogStyle(
                            titleDivider: true,
                            titleTextStyle: kHeading6,
                          ),
                          title: Center(
                              child: Text(AppLocalizations.of(context)!
                                  .dialogImportantTitle)),
                          content: Padding(
                            padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                            child: Text(
                              AppLocalizations.of(context)!
                                  .pickLocationDialogContent,
                              style: kSubtitle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          actions: [
                            TextButton(
                                child: const Text("Okay"),
                                onPressed: () => Navigator.pop(context)),
                          ],
                        ).show(context);
                      },
                    )
                  : ButtonWidget(
                      title: AppLocalizations.of(context)!.pickLocationBtn,
                      borderRadius: 12,
                      onPressed: () {
                        context.read<LocationBloc>().add(OnLocationSelected(
                              _longitude as double,
                              _latitude as double,
                            ));
                        router.pop();
                      },
                    ),
            )
          ],
        ),
      ),
    );
  }

  void onLongPressGoogleMap(LatLng latLng) async {
    final info = await geo.placemarkFromCoordinates(
      latLng.latitude,
      latLng.longitude,
    );

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
      _latitude = latLng.latitude;
      _longitude = latLng.longitude;
    });

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void onMyLocationButtonPress() async {
    final Location location = Location();
    late bool serviceEnabled;
    late PermissionStatus permissionGranted;
    late LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        // ignore: avoid_print
        print("Location services is not available");
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        // ignore: avoid_print
        print("Location permission is denied");
        return;
      }
    }

    locationData = await location.getLocation();
    final latLng = LatLng(locationData.latitude!, locationData.longitude!);

    final info =
        await geo.placemarkFromCoordinates(latLng.latitude, latLng.longitude);

    final place = info[0];
    final street = place.street!;
    final address =
        '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

    setState(() {
      placemark = place;
      _latitude = latLng.latitude;
      _longitude = latLng.longitude;
    });

    defineMarker(latLng, street, address);

    mapController.animateCamera(
      CameraUpdate.newLatLng(latLng),
    );
  }

  void defineMarker(LatLng latLng, String street, String address) {
    final marker = Marker(
      markerId: const MarkerId("source"),
      position: latLng,
      infoWindow: InfoWindow(
        title: street,
        snippet: address,
      ),
    );

    setState(() {
      markers.clear();
      markers.add(marker);
    });
  }
}

class PlacemarkWidget extends StatelessWidget {
  const PlacemarkWidget({
    super.key,
    required this.placemark,
  });

  final geo.Placemark placemark;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20,
            offset: Offset.zero,
            color: Colors.grey.withOpacity(0.5),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  placemark.street!,
                  style: kHeading6.copyWith(color: kBackground),
                ),
                const SizedBox(height: 5),
                Text(
                  '${placemark.subLocality}, ${placemark.locality}, ${placemark.postalCode}, ${placemark.country}',
                  style: kBodyText.copyWith(color: kBackground),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
