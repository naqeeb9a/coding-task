import 'package:coding_task/blocs/auth_bloc/auth_bloc.dart';
import 'package:coding_task/blocs/auth_bloc/auth_state.dart';
import 'package:coding_task/service/locator.dart';
import 'package:coding_task/models/user_model.dart';
import 'package:coding_task/route/route_service.dart';
import 'package:coding_task/views/registration_screen.dart';
import 'package:coding_task/widgets/custom_dialogue_layout.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/widgets.dart';

class ProfileScreen extends StatelessWidget {
  final UserModel userModel = (getIt<AuthBloc>().state as AuthSuccess).user;
  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const Gap(30),
                      CircleAvatar(
                        radius: 42,
                        backgroundColor: Colors.grey.shade300,
                        child: const CircleAvatar(
                          foregroundImage: AssetImage("assets/logo.png"),
                          radius: 40,
                        ),
                      ),
                      const Gap(20),
                      const CustomText(
                        text: "Registered User Details",
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      const Gap(20),
                      const Divider(),
                      const Gap(20),
                      const Gap(20),
                      infoTile("Id", (userModel.id ?? "").toString()),
                      const Gap(10),
                      infoTile("Email", userModel.email ?? ""),
                      const Gap(10),
                      infoTile("Password", userModel.password ?? ""),
                    ],
                  ),
                ),
              ),
              const Gap(16),
              CustomButton(
                text: "Register a new User",
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      content: CustomDialogueLayout(
                          title: "Are you Sure??",
                          message:
                              "If you go forward you will lose the information in this page and won't be able to see it again.",
                          buttonText: "Continue",
                          onPressed: () {
                            RouteService.replace(context, RegistrationScreen());
                          }),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget infoTile(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CustomText(
          text: label,
          fontSize: 14,
        ),
        CustomText(
          text: value,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}
