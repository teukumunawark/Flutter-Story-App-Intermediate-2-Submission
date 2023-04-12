import 'dart:io';

import 'package:ndialog/ndialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:story_app_intermediate_final/presentation/utils/token_preferences.dart';

import '../../common.dart';
import '../blocs/location_bloc/location_bloc.dart';
import '../utils/constants.dart';
import '../routes/app_route.dart';
import '../utils/image_upload.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';
import '../widgets/button_loading_widget.dart';
import '../blocs/story_bloc/story_bloc_bloc.dart';
import '../../application/models/story/story_model.dart';

class AddStoriesPage extends StatefulWidget {
  const AddStoriesPage({super.key});

  @override
  State<AddStoriesPage> createState() => _AddStoriesPageState();
}

class _AddStoriesPageState extends State<AddStoriesPage> {
  TextEditingController desController = TextEditingController(text: '');

  final ImageUpload imageUpload = ImageUpload();

  @override
  void dispose() {
    imageUpload.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return FutureBuilder<String?>(
        future: getToken(),
        builder: (context, snapshot) {
          final token = snapshot.data;
          return Scaffold(
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.storiesTextBtn),
            ),
            body: StreamBuilder<XFile>(
                stream: imageUpload.imageStream,
                builder: (context, AsyncSnapshot<XFile> snapshot) {
                  if (snapshot.hasData) {
                    final data = snapshot.data;
                    return buildStoriesView(height, data, token);
                  }
                  return buildStoriesView(height, null, token);
                }),
          );
        });
  }

  Padding buildStoriesView(double height, XFile? data, String? token) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(height: 20),
          Container(
            height: height * 0.32,
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: kWhite,
              borderRadius: BorderRadius.circular(12),
              image: data != null
                  ? DecorationImage(
                      image: FileImage(File(data.path)),
                      fit: BoxFit.cover,
                    )
                  : const DecorationImage(
                      image: AssetImage('assets/upload.jpg'),
                      filterQuality: FilterQuality.low,
                      scale: 2,
                    ),
            ),
            child: Stack(
              children: [
                Positioned(
                  right: 70,
                  bottom: 10,
                  child: ButtonWidget(
                    width: 150,
                    height: 50,
                    borderRadius: 6,
                    title: 'Gallery',
                    onPressed: () {
                      imageUpload.pickImage(ImageSource.gallery);
                    },
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 10,
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: kBackground,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt_outlined,
                        size: 30,
                      ),
                      onPressed: () {
                        imageUpload.pickImage(ImageSource.camera);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 10),
          const CoordinateView(),
          const SizedBox(height: 10),
          MultiTextField(controller: desController),
          const SizedBox(height: 25),
          BlocConsumer<StoryBloc, StoryState>(
            listener: (context, state) {
              if (state is StoryHasError) {
                hendleError(context, state.message);
              } else if (state is StoryCreated) {
                ProgressDialog.future(context,
                    title: const Center(child: Text("Berhasil upload")),
                    message: const Padding(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Text(
                        "  Mohon Tunggu Sebentar 🙂",
                      ),
                    ),
                    blur: 10,
                    dialogStyle: DialogStyle(
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    future: Future.delayed(
                      const Duration(seconds: 5),
                      () => context.read<LocationBloc>().add(OnClearLocation()),
                    )).then((value) {
                  context.read<StoryBloc>().add(ResetStateEvent());
                  router.pushReplacementNamed('home');
                });
              } else {
                const ButtonLoading();
              }
            },
            builder: (context, state) {
              if (state is StoryLoading) {
                return const ButtonLoading();
              }
              return ButtonWidget(
                title: AppLocalizations.of(context)!.postBtn,
                borderRadius: 8,
                onPressed: () {
                  submitData(context, data, token);
                },
              );
            },
          )
        ],
      ),
    );
  }

  void submitData(BuildContext context, data, token) {
    final locationState = BlocProvider.of<LocationBloc>(context).state;
    double? latitude, longitude;

    if (locationState is LocationSelected) {
      latitude = locationState.latitude;
      longitude = locationState.longitude;
    } else {
      const snackbar = SnackBar(
        content: Text("Kesalah saat mengambil data lokasi"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }

    StoryCreateModel story = StoryCreateModel(
      lat: latitude,
      lon: longitude,
      photo: data.path,
      description: desController.text,
    );

    context.read<StoryBloc>().add(OnCreateStoryEvent(story, token));
  }

  void hendleError(BuildContext context, message) {
    if (message == '"description" is not allowed to be empty') {
      const snackbar = SnackBar(
        content: Text("Descripsi Tidak boleh kosong"),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
    final snackbar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}

class CoordinateView extends StatelessWidget {
  const CoordinateView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: BlocBuilder<LocationBloc, LocationState>(
            builder: (context, state) {
              if (state is LocationSelected) {
                return Column(
                  children: [
                    CoordinateWidget(coord: state.latitude.toString()),
                    const SizedBox(height: 10),
                    CoordinateWidget(coord: state.longitude.toString()),
                  ],
                );
              }
              return Column(
                children: const [
                  CoordinateWidget(coord: 'Latitude'),
                  SizedBox(height: 10),
                  CoordinateWidget(coord: 'Longitude'),
                ],
              );
            },
          ),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            router.pushNamed('pick-location');
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kSecondery,
            padding: const EdgeInsets.symmetric(vertical: 35, horizontal: 30),
          ),
          child: const Icon(
            Icons.add_location_alt,
            size: 35,
            color: kWhite,
          ),
        )
      ],
    );
  }
}

class CoordinateWidget extends StatelessWidget {
  const CoordinateWidget({
    super.key,
    required this.coord,
  });

  final String coord;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 15, right: 15),
      width: double.maxFinite,
      alignment: Alignment.centerLeft,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(width: 1, color: kSecondery),
      ),
      child: Text(
        coord,
        style: kHeading6.copyWith(fontSize: 15),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
