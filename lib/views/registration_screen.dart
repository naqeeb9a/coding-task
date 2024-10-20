import 'package:coding_task/service/locator.dart';
import 'package:coding_task/route/route_service.dart';
import 'package:coding_task/views/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../blocs/auth_bloc/auth_bloc.dart';
import '../blocs/auth_bloc/auth_event.dart';
import '../blocs/auth_bloc/auth_state.dart';
import '../widgets/widgets.dart';

class RegistrationScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> validateForm = GlobalKey<FormState>();
  final AuthBloc authBloc = getIt<AuthBloc>();
  RegistrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          bloc: authBloc,
          listener: (context, state) {
            if (state is AuthSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Registration Successful!')));
              RouteService.replace(context, ProfileScreen());
              emailController.clear();
              passwordController.clear();
            } else if (state is AuthFailure) {
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
          },
          builder: (context, state) {
            return Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: validateForm,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Gap(30),
                        Image.asset("assets/logo.png"),
                        const Gap(40),
                        const CustomText(
                          text: "User Registration",
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                        const Gap(20),
                        const Divider(),
                        const Gap(20),
                        CustomTextField(
                          controller: emailController,
                          label: "Email",
                          hintText: "someone@example.com",
                          enabled: state is AuthLoading ? false : true,
                          validator: (email) {
                            if ((email?.isEmpty) == true) {
                              return "Email cannot be empty";
                            }
                            if (email?.contains("@") == false) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                        const Gap(10),
                        CustomTextField(
                          controller: passwordController,
                          label: "Password",
                          obscureText: true,
                          hintText: "********",
                          enabled: state is AuthLoading ? false : true,
                          validator: (password) {
                            if ((password?.isEmpty) == true) {
                              return "Password cannot be empty";
                            }
                            if ((password?.length ?? 0) < 6) {
                              return "Password cannot be less than 6 characters";
                            }
                            return null;
                          },
                        ),
                        const Gap(40),
                        Builder(
                          builder: (context) {
                            if (state is AuthLoading) {
                              return const CircularProgressIndicator(
                                color: Colors.black,
                              );
                            }
                            return CustomButton(
                              text: "Register",
                              onPressed: () {
                                if (validateForm.currentState?.validate() ==
                                    false) {
                                  return;
                                }
                                authBloc.add(
                                  RegisterUserEvent(
                                    emailController.text,
                                    passwordController.text,
                                  ),
                                );
                              },
                            );
                          },
                        ),
                        const Gap(30)
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
