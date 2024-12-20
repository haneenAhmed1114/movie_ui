// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movie_app/auth/login.dart';
import 'package:movie_app/auth/widget/custom_button.dart';
import 'package:movie_app/auth/widget/custom_text_form_faild.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/movies/model_view/user_model.dart';
import 'package:movie_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});
  static const String routeName = 'signUp Screen';

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * .1),
                  child: Image.asset(AppAssets.splashIcon),
                ),
                CustomTextFormFaild(
                  controller: nameController,
                  hintText: 'Enter your name',
                  keyboardType: TextInputType.text,
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length <= 3) {
                      return 'Please enter a valid name.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                // Email Input
                CustomTextFormFaild(
                  controller: emailController,
                  hintText: 'Enter your email',
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || !isValidEmail(value)) {
                      return 'Please enter a valid email.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                CustomTextFormFaild(
                  controller: passwordController,
                  hintText: 'Enter your password',
                  //keyboardType: TextInputType.visiblePassword,
                  password: true,
                  validator: (value) {
                    if (value == null || value.length <= 7) {
                      return 'Password must be at least 8 characters.';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),

                Column(
                  children: [
                    Provider.of<UserProvider>(context).loading
                        ? const CircularProgressIndicator(
                            color: AppColors.goldenColor,
                          )
                        : CustomButton(
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                await Provider.of<UserProvider>(context,
                                        listen: false)
                                    .signup(
                                        UserModel(
                                            name: nameController.text,
                                            email: emailController.text),
                                        passwordController.text);
                                if (Provider.of<UserProvider>(context,
                                        listen: false)
                                    .islogin) {
                                  Navigator.of(context)
                                      .pushReplacementNamed(Login.routeName);
                                }
                              }
                            },
                            text: 'signup'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Have Acoount ?',
                          style: TextStyle(color: AppColors.goldenColor)
                        ),
                        TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed(Login.routeName);
                            },
                            child: const Text(
                              'login',
                              style: TextStyle(color: AppColors.goldenColor)
                            )),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isValidEmail(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
