import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/components/custom_search_field.dart';
import 'package:our_market_admin_dashboard/core/functions/build_appBar.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          buildCustomAppBar(context, "Login As An Admin", isBackButton: false),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomField(
              controller: emailController,
              lableText: "Email",
            ),
            SizedBox(
              height: 20,
            ),
            CustomField(
              controller: passwordController,
              lableText: "Password",
            ),
          ],
        ),
      ),
    );
  }
}
