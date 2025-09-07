import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:souqak/core/theming/colors.dart';
import 'package:souqak/core/theming/styles.dart';
import 'package:souqak/core/routing/app_router.dart';
import 'package:souqak/features/auth/logic/auth_cubit.dart';
import 'package:souqak/features/home/ui/widgets/custom_button.dart';
import 'package:souqak/features/auth/ui/widgets/custom_text_form_field.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      BlocProvider.of<AuthCubit>(
        context,
      ).login(_emailController.text, _passwordController.text);

      // print("Email: ${_emailController.text}");
      // print("Password: ${_passwordController.text}");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.blackColor,

        iconTheme: IconThemeData(color: Colors.white, size: 20),
        title: Text('Login', style: TextStyles.font24WhiteBold),
      ),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("successfully login✅")),
            );
            GoRouter.of(context).push(AppRouter.kHomeView);
          } else if (state is AuthFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    controller: _emailController,
                    hintText: "Email",
                    fillColor: AppColors.textFieldColor,
                    hintStyle: TextStyle(color: AppColors.hintColor),
                  ),
                  SizedBox(height: 20),

                  CustomTextFormField(
                    controller: _passwordController,
                    hintText: "Password",
                    obscureText: true,
                    fillColor: AppColors.textFieldColor,
                    hintStyle: TextStyle(color: AppColors.hintColor),
                  ),
                  SizedBox(height: 20),

                  CustomButton(
                    backgroundColor: AppColors.buttonColor,
                    text: "Log in",
                    onPressed: _submit,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
