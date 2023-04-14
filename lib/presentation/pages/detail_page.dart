import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/story_enitities.dart';
import '../blocs/story_bloc/story_bloc_bloc.dart';
import '../utils/constants.dart';

import 'package:geocoding/geocoding.dart' as geo;

class DetailPage extends StatefulWidget {
  const DetailPage({super.key, required this.id});

  final String id;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  final Set<Marker> markers = {};
  late GoogleMapController mapController;
  geo.Placemark? placemark;

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

      final token = args?['token'];
      context.read<StoriesDetailBloc>().add(OnGetDetailEvent(widget.id, token));
    });
  }

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    final latitude = arguments['lat'] as double?;
    final longitude = arguments['lon'] as double?;
    final LatLng selectedLocation = latitude != null && longitude != null
        ? LatLng(
            latitude,
            longitude,
          )
        : const LatLng(-6.200000, 106.816666);
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black26,
      ),
      body: Stack(
        children: [
          Container(
            height: height * 0.7,
            color: kWhite,
            child: Stack(
              children: [
                latitude != null
                    ? GoogleMap(
                        initialCameraPosition: CameraPosition(
                          zoom: 18,
                          target: selectedLocation,
                        ),
                        markers: markers,
                        zoomControlsEnabled: false,
                        mapToolbarEnabled: false,
                        myLocationButtonEnabled: false,
                        myLocationEnabled: true,
                        onMapCreated: (controller) async {
                          final info = await geo.placemarkFromCoordinates(
                            selectedLocation.latitude,
                            selectedLocation.longitude,
                          );

                          final place = info[0];
                          final street = place.street!;
                          final address =
                              '${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';

                          setState(() {
                            placemark = place;
                          });

                          defineMarker(selectedLocation, street, address);

                          setState(() {
                            mapController = controller;
                          });
                        },
                      )
                    : Container(
                        color: kWhite,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Google Map",
                                style: kHeading4.copyWith(color: kBackground),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "Tidak tersedia pada cerita ini",
                                style: kBodyText.copyWith(color: kBackground),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                placemark == null
                    ? const SizedBox()
                    : Positioned(
                        bottom: 16,
                        right: 16,
                        left: 16,
                        child: PlacemarkWidget(placemark: placemark!),
                      ),
              ],
            ),
          ),
          BlocBuilder<StoriesDetailBloc, StoryState>(
            builder: (context, state) {
              if (state is StoryDetailLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is StoriesDetailLoaded) {
                final data = state.data;
                return DetailView(
                  height: height,
                  data: data,
                );
              }
              return Column(
                children: [
                  Container(
                    height: height * 0.5,
                    color: kWhite,
                  )
                ],
              );
            },
          )
        ],
      ),
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

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.height,
    required this.data,
  }) : super(key: key);

  final double height;
  final StoryResponseEntity data;

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      maxChildSize: 0.7,
      minChildSize: 0.3,
      builder: (context, scrollController) {
        return Container(
          padding: const EdgeInsets.only(
            left: 20,
            top: 10,
            right: 20,
          ),
          decoration: const BoxDecoration(
            color: kBackground,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(35),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.only(top: 16),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: '${data.photoUrl}',
                          height: 100,
                          width: 100,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name!.toUpperCase(),
                              style: kHeading4,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 5),
                            Text(
                              DateFormat('EEEE, MMMM d, y').format(
                                data.createdAt as DateTime,
                              ),
                              style: kBodyText.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  data.lon != null
                      ? Column(
                          children: [
                            const Divider(color: kSecondery, thickness: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Expanded(
                                  child: Text(
                                    data.lat.toString(),
                                    style: kHeading6,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Text(
                                    data.lon.toString(),
                                    style: kHeading6,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                            const Divider(color: kSecondery, thickness: 2),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(height: 15),
                  Text(
                    data.description.toString(),
                    style: kBodyText,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
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
