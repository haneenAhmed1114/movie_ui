// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:movie_app/auth/sign_up.dart';
import 'package:movie_app/auth/widget/custom_button.dart';
import 'package:movie_app/auth/widget/custom_text_form_faild.dart';
import 'package:movie_app/common/app_assets.dart';
import 'package:movie_app/common/app_colors.dart';
import 'package:movie_app/common/widgets/custom_loading_widget.dart';
import 'package:movie_app/home_screen/home_screen.dart';
import 'package:movie_app/provider/user_provider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  static const String routeName='login Screen';
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController=TextEditingController();
   final passwordController=TextEditingController();
   GlobalKey <FormState>formKey=GlobalKey();
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
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.1),
              child:  Image.asset(AppAssets.splashIcon),
            ),
            CustomTextFormFaild(controller: emailController,hintText: 'enter your email ',
            keyboardType: TextInputType.emailAddress,
            validator: (p0) {
              if(p0 ==null||p0.isEmpty){
                return 'Valid email';
              }
              return null;
            },
            ),
             CustomTextFormFaild(controller: passwordController,hintText: 'enter your pass ',
            keyboardType: TextInputType.visiblePassword,
            password: true,
            validator: (p0) {
              if(p0 ==null||p0.isEmpty||p0.length<=7){
                return 'Valid password';
              }
              return null;
            },
            ),
              const SizedBox(
                    height: 10,
                  ),
                  Column(children: [
                    Provider.of<UserProvider>(context).loading?const CustomLoadingWidget():
                    CustomButton(onPressed: () async {
                      if(formKey.currentState!.validate()){
                    await Provider.of<UserProvider>(context,listen: false).login(emailController.text, passwordController.text);
                      if(Provider.of<UserProvider>(context,
                                          listen: false)
                                      .islogin){
                                        Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
          
                                      }
                      }
                    
                    
                  }, text: 'Login'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                       const Text("Don't Have an account ?",style: TextStyle(color: AppColors.goldenColor),),
                      TextButton(onPressed: () {
                        Navigator.of(context).pushReplacementNamed(SignUp.routeName);
                      }
                      , child: const Text('Register',style: TextStyle(color:  AppColors.goldenColor),))
                    ],
                  )
                  ],)
                  
            
          ],
                ),
        ),),
      ),
    ) ;
  }
  //   bool isValidEmail(String email) {
  //   return RegExp(
  //           r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
  //       .hasMatch(email);
  // }
}
