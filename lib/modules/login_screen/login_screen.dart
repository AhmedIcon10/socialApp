// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layouts/social_layout/social_layout.dart';
import 'package:socialapp/modules/login_screen/cubit/cubit.dart';
import 'package:socialapp/modules/login_screen/cubit/states.dart';
import 'package:socialapp/modules/register_screen/register_screen.dart';
import 'package:socialapp/shared/components.dart';
import 'package:socialapp/shared/constants.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';

class SocialLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return  BlocConsumer<SocialLoginCubit,SocialLoginStates>(
      listener: (context, state){
        if (state is SocialLoginErrorState){
          showToast(text: state.error, state: ToastsStates.ERROR);
        }
        if (state is SocialLoginSuccessState){
          CacheHelper.saveData(key: 'uId',
              value: state.uId )
              .then((value) {
                navigateAndFinish(context, SocialLayout());
          });

        }
      },
      builder: (context, state){
        var cubit = SocialLoginCubit.get(context);
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'LOGIN',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: defaultColor,
                        ),
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                        'login now to communicate with friends',
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 40.0,
                      ),
                      customFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          isPassword: false,
                          validate: (value) {
                            if (value.toString().isEmpty) {
                              return 'email address must not be empty';
                            }
                            return null;
                          },
                          label: 'Email address',
                          prefix: Icons.email_outlined),
                      const SizedBox(
                        height: 15.0,
                      ),
                      customFormField(
                          controller: passwordController,
                          isPassword: cubit.isPassword,
                          type: TextInputType.visiblePassword,
                          validate: (value) {
                            if (value.toString().isEmpty) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          label: 'Password',
                          prefix: Icons.lock_outline,
                          suffix: cubit.suffix,
                          onPressed: () {
                            cubit.changeVisibility();
                          }),
                      const SizedBox(
                        height: 30.0,
                      ),
                      defaultButton(
                          buttonText: 'login',
                          isUpperCase: true,
                          textSize: 18,
                          onPressed: () {
                            cubit.userLogin(email: emailController.text, password: passwordController.text);
                          }),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?', style: TextStyle(
                              color:Colors.black,
                              fontWeight: FontWeight.bold
                          ),),
                          defaultTextButton(
                            text: 'register',
                            onPressed: () {
                              navigateTo(context, const RegisterScreen());
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },

    );

  }
}
