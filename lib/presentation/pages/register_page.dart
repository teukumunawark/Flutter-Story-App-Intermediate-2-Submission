import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../application/models/user_create_model.dart';
import '../../common.dart';
import '../blocs/auth_bloc/auth_bloc_bloc.dart';
import '../utils/constants.dart';
import '../widgets/button_loading_widget.dart';
import '../widgets/button_widget.dart';
import '../widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final usernameController = TextEditingController(text: '');
  final emailController = TextEditingController(text: '');
  final passwordController = TextEditingController(text: '');
  final confirmController = TextEditingController(text: '');
  bool isVisible = false;
  bool isVisibleConfirm = false;

  @override
  Widget build(BuildContext context) {
    Widget headerText() => Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.titleRegister,
                style: kHeading2.copyWith(fontSize: 30),
              ),
              Text(
                AppLocalizations.of(context)!.subtitleRegister,
                style: kHeading6.copyWith(fontSize: 15),
              ),
            ],
          ),
        );

    Widget usernameInput() => CustomeTextField(
          controller: usernameController,
          labelText: "Username",
          prefixIcon: const Icon(Icons.person_rounded),
        );

    Widget emailInput() => CustomeTextField(
          controller: emailController,
          labelText: "Email",
          prefixIcon: const Icon(Icons.email_rounded),
        );

    Widget passwordInput() => CustomeTextField(
          controller: passwordController,
          labelText: "Password",
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

    Widget confirmPasswordInput() => CustomeTextField(
          controller: confirmController,
          labelText: "Confirm password",
          prefixIcon: const Icon(Icons.lock_rounded),
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                isVisibleConfirm = !isVisibleConfirm;
              });
            },
            icon: !isVisibleConfirm
                ? const Icon(Icons.visibility_off_sharp, color: kGrey)
                : const Icon(Icons.visibility, color: kPrimary),
          ),
          obscureText: !isVisibleConfirm,
        );

    buttonSubmit() => BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthError) {
              hendleError(context, state.message);
            } else if (state is RegisterSuccess) {
              context.pushReplacementNamed('login');
            } else {
              const ButtonLoading();
            }
          },
          builder: (context, state) {
            if (state is AuthLoading) {
              return const ButtonLoading();
            } else if (state is AuthError) {
              return ButtonWidget(
                title: AppLocalizations.of(context)!.registerBtn,
                height: 52,
                onPressed: () {
                  hendleRegister(context);
                },
              );
            } else if (state is AuthInitial) {
              return ButtonWidget(
                title: AppLocalizations.of(context)!.registerBtn,
                height: 52,
                onPressed: () {
                  hendleRegister(context);
                },
              );
            }
            return const Center(
              child: Text('Something is wrong'),
            );
          },
        );

    Widget loginTextRoute() => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.textRegisterRoute,
              style: kHeading6.copyWith(fontSize: 16),
            ),
            TextButton(
                onPressed: () {
                  context.goNamed('login');
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
              usernameInput(),
              const SizedBox(height: 15),
              emailInput(),
              const SizedBox(height: 15),
              passwordInput(),
              const SizedBox(height: 15),
              confirmPasswordInput(),
              const SizedBox(height: 35),
              buttonSubmit(),
              const Spacer(),
              loginTextRoute(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  void hendleRegister(BuildContext context) {
    UserCreateModel userController = UserCreateModel(
      name: usernameController.text,
      email: emailController.text,
      password: passwordController.text,
    );

    if (usernameController.text.isEmpty) {
      const snackbar = SnackBar(content: Text('Nama belum di isi'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (emailController.text.isEmpty) {
      const snackbar = SnackBar(content: Text('Email belum di isi'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (passwordController.text.isEmpty) {
      const snackbar = SnackBar(content: Text('Password belum di isi'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else if (passwordController.text != confirmController.text) {
      const snackbar = SnackBar(content: Text('Password Tidak Cocok'));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      BlocProvider.of<AuthBloc>(context).add(OnRegisterEvent(userController));
    }
  }

  void hendleError(BuildContext context, message) {
    if (message == 'Email is already taken') {
      const snackbar = SnackBar(
        content: Text('email sudah terdaftar'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        emailController.text = '';
      });
    } else {
      final snackbar = SnackBar(content: Text(message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      setState(() {
        usernameController.text = '';
        emailController.text = '';
        confirmController.text = '';
        passwordController.text = '';
      });
    }
  }
}
