import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:ndialog/ndialog.dart';

import '../../application/models/auth/auth_model.dart';
import '../../common.dart';
import '../blocs/auth_bloc/auth_bloc_bloc.dart';
import '../routes/app_route.dart';
import '../utils/constants.dart';
import '../utils/token_preferences.dart';
import '../widgets/button_loading_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    Widget headerText() => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.titleLogin,
                style: kHeading2.copyWith(fontSize: 30),
              ),
              Text(
                AppLocalizations.of(context)!.subtitleLogin,
                style: kHeading6.copyWith(fontSize: 15),
              ),
            ],
          ),
        );

    Widget emailInput() => CustomeTextField(
          controller: emailController,
          labelText: 'Email Address',
          prefixIcon: const Icon(Icons.email_rounded),
        );

    Widget passwordInput() => CustomeTextField(
          controller: passwordController,
          labelText: 'Password',
          prefixIcon: const Icon(Icons.lock_rounded),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisible = !isVisible;
              });
            },
            icon: !isVisible
                ? const Icon(Icons.visibility_off_sharp, color: kGrey)
                : const Icon(Icons.visibility, color: kPrimary),
          ),
          obscureText: !isVisible,
        );

    buttonSubmit() => BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              hendleError(context, state.message);
            } else if (state is LoginSuccess) {
              final token = state.data.loginResult!.token;
              saveToken(token.toString());
              ProgressDialog.future(
                context,
                title: const Center(child: Text("Berhasil")),
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
                future: Future.delayed(const Duration(seconds: 5)),
              ).then((value) => router.goNamed('home'));
            } else {
              const ButtonLoading();
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const ButtonLoading();
            } else if (state is AuthError) {
              return ButtonWidget(
                title: AppLocalizations.of(context)!.loginBtn,
                height: 52,
                onPressed: () {
                  hendleLogin(context);
                },
              );
            }
            return ButtonWidget(
              title: AppLocalizations.of(context)!.loginBtn,
              height: 52,
              onPressed: () {
                hendleLogin(context);
              },
            );
          },
        );

    Widget registerTextRoute() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.textLoginRoute,
              style: kHeading6.copyWith(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  context.goNamed('register');
                },
                child: Text(
                  AppLocalizations.of(context)!.registerBtn,
                  style: kHeading6.copyWith(fontSize: 16),
                ))
          ],
        );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              headerText(),
              const SizedBox(height: 40),
              emailInput(),
              const SizedBox(height: 15),
              passwordInput(),
              const SizedBox(height: 35),
              buttonSubmit(),
              const Spacer(),
              registerTextRoute(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void hendleLogin(BuildContext context) {
    UserCreateModel userController = UserCreateModel(
      email: emailController.text,
      password: passwordController.text,
    );

    if (emailController.text.isEmpty) {
      const snackbar = SnackBar(content: Text('Email belum di isi'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (passwordController.text.isEmpty) {
      const snackbar = SnackBar(content: Text('Password belum di isi'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      BlocProvider.of<AuthBloc>(context).add(OnLoginEvent(userController));
    }
  }

  void hendleError(BuildContext context, message) {
    if (message == 'Invalid password') {
      const snackbar = SnackBar(
        content: Text('password salah coba masukan ulang'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        passwordController.text = '';
      });
    } else if (message == 'User not found') {
      const snackbar = SnackBar(
        content: Text('email tidak ditemukan atau anda salah masukan email'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        emailController.text = '';
      });
    } else {
      final snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        emailController.text = '';
        passwordController.text = '';
      });
    }
  }
}
