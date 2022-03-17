// ignore_for_file: avoid_print
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/login_screen/cubit/states.dart';


class SocialLoginCubit extends Cubit<SocialLoginStates> {
  SocialLoginCubit() : super(SocialLoginInitialState());
  static SocialLoginCubit get(context) => BlocProvider.of(context);
//  late SocialLoginModel loginModel;
  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLoginLoadingState());
    FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password)
        .then((value) {
          print(value.user!.email);
          print(value.user!.uid);
          emit(SocialLoginSuccessState(value.user!.uid));
    })
        .catchError((error){
          emit(SocialLoginErrorState(error.toString()));
    });

  }

  IconData suffix = Icons.visibility_outlined;
  bool isPassword = true;
  void changeVisibility() {
    isPassword= !isPassword;
    isPassword
        ? suffix = Icons.visibility_outlined
        : suffix = Icons.visibility_off_outlined;
    emit(SocialLoginChangePasswordVisibilityState());
  }
}
