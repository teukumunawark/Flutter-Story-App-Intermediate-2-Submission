import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../application/models/story_create_model.dart';
import '../../common.dart';
import '../blocs/story_bloc/story_bloc_bloc.dart';
import '../routes/app_route.dart';
import '../utils/constants.dart';
import '../utils/image_upload.dart';
import '../widgets/button_loading_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class AddStoriesPage extends StatefulWidget {
  const AddStoriesPage({super.key});

  @override
  State<AddStoriesPage> createState() => _AddStoriesPageState();
}

class _AddStoriesPageState extends State<AddStoriesPage> {
  TextEditingController latController = TextEditingController(text: null);
  TextEditingController lonController = TextEditingController(text: null);
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
    String token = (ModalRoute.of(context)?.settings.arguments as String);
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
            height: height * 0.35,
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
          const SizedBox(height: 20),
          CustomeTextField(
            labelText: 'Latitude',
            prefixIcon: const Icon(Icons.location_on_outlined),
            controller: latController,
          ),
          const SizedBox(height: 10),
          CustomeTextField(
            labelText: 'Longitude',
            prefixIcon: const Icon(Icons.location_on_outlined),
            controller: lonController,
          ),
          const SizedBox(height: 10),
          MultiTextField(controller: desController),
          const SizedBox(height: 25),
          BlocConsumer<StoryBloc, StoryState>(
            listener: (context, state) {
              if (state is StoryHasError) {
                hendleError(context, state.message);
              } else if (state is StoryCreated) {
                router.pushReplacementNamed('home', extra: token);
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
                  submitData(data, token);
                },
              );
            },
          )
        ],
      ),
    );
  }

  void submitData(data, token) {
    StoryCreateModel story = StoryCreateModel(
      description: desController.text,
      lat: double.tryParse(latController.text),
      lon: double.tryParse(lonController.text),
      photo: data.path,
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
