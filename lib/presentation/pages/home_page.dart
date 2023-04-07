import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../common.dart';
import '../../domain/entities/story_enitities.dart';
import '../blocs/auth_bloc/auth_bloc_bloc.dart';
import '../blocs/story_bloc/story_bloc_bloc.dart';
import '../routes/app_route.dart';
import '../utils/constants.dart';
import '../utils/token_preferences.dart';
import '../widgets/stories_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    Future.microtask(() {
      String token = (ModalRoute.of(context)?.settings.arguments as String);
      context.read<StoryBloc>().add(OnGetStoriesEvent(token));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String token = (ModalRoute.of(context)?.settings.arguments as String);
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: kBackground),
              accountName: Text('',
                  style: kHeading5.copyWith(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  )),
              accountEmail: Text('',
                  style: kHeading5.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
                top: 10,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.add_box_rounded,
                  size: 30,
                ),
                title: Text(
                  AppLocalizations.of(context)!.storiesTextBtn,
                  style: kHeading6,
                ),
                onTap: () {
                  context.pushNamed('add-stories', extra: token);
                  _scaffoldKey.currentState?.closeDrawer();
                },
              ),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: ListTile(
                trailing: const Icon(
                  Icons.login_outlined,
                  size: 30,
                ),
                title: Text(
                  AppLocalizations.of(context)!.logoutBtn,
                  style: kHeading6,
                ),
                onTap: () {
                  removeToken();
                  context.read<AuthBloc>().add(OnLogoutEvent());
                  _scaffoldKey.currentState?.closeDrawer();
                  context.pushReplacementNamed('login');
                },
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.titleAppBar),
        elevation: 0,
        actions: [
          IconButton(
              onPressed: () {
                router.pushReplacementNamed('home', extra: token);
              },
              icon: const Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: BlocBuilder<StoryBloc, StoryState>(
          builder: (context, state) {
            if (state is StoryLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StoryHasError) {
              return Center(
                child: Text(state.message),
              );
            } else if (state is StoryLoaded) {
              return StoriesView(
                stories: state.data,
                token: token.toString(),
              );
            }
            return const Center(
              child: Text("something when wrong"),
            );
          },
        ),
      ),
    );
  }
}

class StoriesView extends StatelessWidget {
  const StoriesView({
    Key? key,
    required this.stories,
    required this.token,
  }) : super(key: key);

  final List<StoryResponseEntity> stories;
  final String token;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, index) {
        final data = stories[index];

        return StoriesCard(data: data, token: token);
      },
      itemCount: stories.length,
    );
  }
}
