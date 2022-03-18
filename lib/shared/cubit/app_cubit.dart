import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/models/social_user_model.dart';
import 'package:socialapp/modules/chat_screen/chat_screen.dart';
import 'package:socialapp/modules/feeds_screen/feeds_screen.dart';
import 'package:socialapp/modules/settings_screen/settings_screen.dart';
import 'package:socialapp/modules/users_screen/users_screen.dart';
import 'package:socialapp/shared/cubit/app_states.dart';
import 'package:socialapp/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(InitialAppState());
  static AppCubit get(context)=> BlocProvider.of(context);
  SocialUserModel? model;
  var uId = CacheHelper.getData(key: 'uId');
  void getUserData()
  {

    emit(GetUserLoadingState());
    FirebaseFirestore.instance.collection('users').doc(uId).get()
        .then((value) {
          model = SocialUserModel.fromJson(value.data());
          print(value.data());
      emit(GetUserSuccessState());
    })
        .catchError((error){
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
}