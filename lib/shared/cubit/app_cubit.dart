// ignore_for_file: avoid_print

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:socialapp/models/social_user_model.dart';
import 'package:socialapp/modules/chat_screen/chat_screen.dart';
import 'package:socialapp/modules/feeds_screen/feeds_screen.dart';
import 'package:socialapp/modules/settings_screen/settings_screen.dart';
import 'package:socialapp/modules/users_screen/users_screen.dart';
import 'package:socialapp/shared/cubit/app_states.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialAppState());
  static AppCubit get(context)=> BlocProvider.of(context);
   SocialUserModel? userModel ;
  var uId = CacheHelper.getData(key: 'uId');
  void getUserData()
  {

    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get()
        .then((value) {
          userModel = SocialUserModel.fromJson(value.data());
          print(value.data());
      emit(GetUserSuccessState());
    })
        .catchError((error){
          print("GetUserLoadingState : " + error.toString());
          emit(GetUserErrorState(error.toString()));
    });
  }

  int currentIndex = 0;
  void changeBottomNavBar(int index)
  {
    currentIndex = index;
    emit(ChangeBottomNavBarState());
  }
  List<Widget> screens =
  [
   FeedsScreen(),
   ChatScreen(),
   UsersScreen(),
   SettingsScreen()
  ];

  List<String> appBarTitles =
      [
        'Feeds Screen',
        'Chat Screen',
        'Users Screen',
        'Settings Screen',
      ];
  File? profileImage;
  File? coverImage;
  String? profileImageUrl;
  String? coverImageUrl ;
  final picker = ImagePicker();
  Future getProfileImage()async
  {
    final pickedImage =  await picker.pickImage(source:ImageSource.camera);
    if(pickedImage != null){
      profileImage = File(pickedImage.path);
      emit(SocialProfileImagePickedSuccessState());
    }
    else {
      print( 'No image selected');
      emit(SocialProfileImagePickedErrorState());
    }
  }

  Future getCoverImage()async
  {
    final pickedImage =  await picker.pickImage(source:ImageSource.camera);
    if(pickedImage != null){
      coverImage = File(pickedImage.path);
      emit(SocialCoverImagePickedSuccessState());
    }
    else {
      print( 'No image selected');
      emit(SocialCoverImagePickedErrorState());
    }
  }
  void uploadProfileImage()
  {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
        'users/ ${Uri.file(profileImage!.path).pathSegments.last}'
    ).putFile(profileImage!)
        .then((value)
    {
          value
          .ref
          .getDownloadURL()
          .then((value)
      {
        emit(SocialUploadProfileImageSuccessState());
        print(value);
        profileImageUrl = value;
      })
          .catchError((error)
      {
        emit(SocialUploadProfileImageErrorState());

      });
    }).
    catchError((error)
        {
          emit(SocialUploadProfileImageErrorState());

        }
        );
  }

  void uploadCoverImage()
  {
    firebase_storage.FirebaseStorage.instance
        .ref()
        .child(
        'users/ ${Uri.file(coverImage!.path).pathSegments.last}'
    ).putFile(coverImage!)
        .then((value)
    {
          value
          .ref
          .getDownloadURL()
          .then((value)
      {
        emit(SocialUploadCoverImageSuccessState());
        print(value);
        coverImageUrl = value;
      })
          .catchError((error)
      {
        emit(SocialUploadCoverImageErrorState());
      });
    }).catchError((error)
        {
          emit(SocialUploadCoverImageErrorState());

        }
        );
  }
  
  void updateUser({
  required String name,
  required String bio,
  required String phone,
})
  {
    if(coverImage != null){
      uploadCoverImage();
    }
    else if (profileImage != null){
      uploadProfileImage();
    }
    else{
      SocialUserModel model = SocialUserModel(
          name: name,
          bio: bio,
          phone: phone,
          image: profileImageUrl,
          cover: coverImageUrl,
          email: userModel!.email,
          isEmailVerified: false,
          uId: uId,

      );
      FirebaseFirestore.instance.collection('users')
          .doc(uId)
          .update(model.toMap())
          .then((value)
      {
        getUserData();
      }).catchError((error)
      {
        emit(SocialUserUpdateErrorState());
      });
    }

    

  }
}