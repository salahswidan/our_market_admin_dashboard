import 'package:flutter/material.dart';
import 'package:our_market_admin_dashboard/core/components/custom_elevated_button.dart';
import 'package:our_market_admin_dashboard/core/components/custom_text_field.dart';

import '../../../core/functions/build_appBar.dart';

class AddAdminView extends StatefulWidget {
  const AddAdminView({super.key});

  @override
  State<AddAdminView> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Add Admin"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextField(lableText: "Name",controller: _nameController,),
            SizedBox(height: 20,),
            CustomTextField(lableText: "Email",controller:_emailController ,),
                                           SizedBox(height: 20,),
         
            CustomTextField(lableText: "Password",controller: _passwordController ,isPassword: true,),
            SizedBox(height: 20,),
            CustomElevatedButton(child: const Text("Add"), onPressed: (){},)
          ],
        ),
      ),
    );
  }
}