import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../domain/entities/story_enitities.dart';
import '../blocs/story_bloc/story_bloc_bloc.dart';
import '../utils/constants.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    Future.microtask(() {
      List extra = (ModalRoute.of(context)?.settings.arguments as List);
      final id = extra[0];
      final token = extra[1];
      context.read<StoriesDetailBloc>().add(OnGetDetailEvent(id, token));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black26,
      ),
      body: BlocBuilder<StoriesDetailBloc, StoryState>(
        builder: (context, state) {
          if (state is StoryDetailLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is StoriesDetailLoaded) {
            final data = state.data;
            return DetailView(height: height, data: data);
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
      ),
    );
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
    return Stack(
      children: [
        CachedNetworkImage(
          imageUrl: '${data.photoUrl}',
          height: height * 0.6,
          width: double.infinity,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
        const SizedBox(height: 10),
        DraggableScrollableSheet(
          initialChildSize: 0.5,
          maxChildSize: 0.7,
          minChildSize: 0.4,
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
                      Text(
                        data.name!.toUpperCase(),
                        style: kHeading4,
                      ),
                      const SizedBox(height: 10),
                      Text(
                        DateFormat('EEEE, MMMM d, y').format(
                          data.createdAt as DateTime,
                        ),
                        style: kBodyText.copyWith(
                            fontWeight: FontWeight.w600, fontSize: 14),
                      ),
                      data.lon != null
                          ? Column(
                              children: [
                                const Divider(color: kSecondery, thickness: 2),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      data.lat.toString(),
                                      style: kHeading6,
                                    ),
                                    Text(
                                      data.lon.toString(),
                                      style: kHeading6,
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
        )
      ],
    );
  }
}
