import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:our_market_admin_dashboard/core/components/custom_cicle_progress_indicator.dart';
import 'package:our_market_admin_dashboard/core/components/custom_elevated_button.dart';
import 'package:our_market_admin_dashboard/core/components/custom_text_field.dart';
import 'package:our_market_admin_dashboard/core/functions/navigate_to.dart';
import 'package:our_market_admin_dashboard/core/functions/navigate_without_back.dart';
import 'package:our_market_admin_dashboard/core/functions/show_msg.dart';
import 'package:our_market_admin_dashboard/features/add_admin/cubit/cubit/add_admin_cubit.dart';
import 'package:our_market_admin_dashboard/features/auth/view/login_view.dart';

import '../../../core/functions/build_appBar.dart';

class AddAdminView extends StatefulWidget {
  const AddAdminView({super.key});

  @override
  State<AddAdminView> createState() => _AddAdminViewState();
}

class _AddAdminViewState extends State<AddAdminView> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, "Add Admin"),
      body: BlocProvider(
        create: (context) => AddAdminCubit(),
        child: BlocConsumer<AddAdminCubit, AddAdminState>(
          listener: (context, state) {
            if (state is AddAdminSuccess) {
              naviagteWithoutBack(context, LoginView());
            }
            if (state is AddAdminError) {
              showMsg(context, state.masError);
            }
          },
          builder: (context, state) {
            AddAdminCubit cubit = context.read<AddAdminCubit>();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child:state is AddAdminLoading ? CustomCircleIndicator(): Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      lableText: "Email",
                      controller: _emailController,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomTextField(
                      lableText: "Password",
                      controller: _passwordController,
                      isPassword: true,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomElevatedButton(
                      child: const Text("Add"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.createAnAccount({
                            "email": _emailController.text,
                            "password": _passwordController.text
                          });
                        }
                      },
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
