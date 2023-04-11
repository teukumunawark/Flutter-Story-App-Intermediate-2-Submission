import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ndialog/ndialog.dart';

import '../blocs/auth_bloc/auth_bloc_bloc.dart';
import '../blocs/story_bloc/story_bloc_bloc.dart';
import '../routes/app_route.dart';
import '../utils/constants.dart';
import '../utils/token_preferences.dart';
import '../widgets/flag_icon_widget.dart';
import '../widgets/stories_card.dart';
import '../../common.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);

    Future.microtask(() async {
      String? token = await getToken();
      // ignore: use_build_context_synchronously
      context.read<StoryBloc>().add(OnGetStoriesEvent(token.toString()));
    });
  }

  Future<void> _onScroll() async {
    final storiesBloc = context.read<StoryBloc>();
    String? token = await getToken();
    if (_scrollController.position.atEdge &&
        _scrollController.position.pixels > 0) {
      if (storiesBloc.pageItems != null) {
        storiesBloc.add(OnGetStoriesEvent(token.toString()));
      }
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final storiesBloc = context.read<StoryBloc>();
    return FutureBuilder<String?>(
        future: getToken(),
        builder: (context, snapshot) {
          final token = snapshot.data;
          return Scaffold(
            key: _scaffoldKey,
            drawer: buildDrawer(context, token, _scaffoldKey),
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.titleAppBar),
              elevation: 0,
              actions: [
                const FlagIconWidget(),
                const SizedBox(width: 10),
                IconButton(
                  onPressed: () {
                    context.read<StoryBloc>().add(
                          ResetStateEvent(),
                        );
                    context.read<StoryBloc>().add(
                          OnGetStoriesEvent(token.toString()),
                        );
                  },
                  icon: const Icon(Icons.refresh),
                )
              ],
            ),
            body: BlocBuilder<StoryBloc, StoryState>(
              builder: (context, state) {
                if (state is StoryLoading && storiesBloc.pageItems == 1) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is StoryHasError) {
                  return Center(
                    child: Text(state.message),
                  );
                } else if (state is StoryLoaded) {
                  final states = state.data;

                  return ListView.builder(
                    controller: _scrollController,
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                        states.length + (storiesBloc.pageItems != null ? 1 : 0),
                    itemBuilder: (context, index) {
                      if (index == states.length &&
                          storiesBloc.pageItems != null) {
                        return const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }

                      final stories = states[index];

                      return StoriesCard(
                          data: stories, token: token.toString());
                    },
                  );
                }
                return const Center(
                  child: Text("something when wrong"),
                );
              },
            ),
          );
        });
  }
}

// Drawer
Widget buildDrawer(BuildContext context, token, scaffoldKey) {
  return Drawer(
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
              router.goNamed('add-stories');
              scaffoldKey.currentState?.closeDrawer();
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
              scaffoldKey.currentState?.closeDrawer();
              NDialog(
                dialogStyle: DialogStyle(titleDivider: true),
                title: Center(
                    child: Text(
                        (AppLocalizations.of(context)!.dialogImportantTitle))),
                content: Padding(
                  padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                  child: Text(
                    AppLocalizations.of(context)!.logoutDialog,
                    textAlign: TextAlign.center,
                  ),
                ),
                actions: [
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.logoutBtnYes),
                      onPressed: () {
                        removeToken();
                        context.read<AuthBloc>().add(OnLogoutEvent());
                        context.read<StoryBloc>().add(ResetStateEvent());
                        router.pushReplacementNamed('login');
                      }),
                  TextButton(
                      child: Text(AppLocalizations.of(context)!.logoutBtnNo),
                      onPressed: () => router.pop(context)),
                ],
              ).show(context);
            },
          ),
        ),
        const SizedBox(height: 10),
      ],
    ),
  );
}
