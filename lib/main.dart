import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/layouts/social_layout/social_layout.dart';
import 'package:socialapp/modules/login_screen/cubit/cubit.dart';
import 'package:socialapp/modules/register_screen/cubit/cubit.dart';
import 'package:socialapp/shared/bloc_observer.dart';
import 'package:socialapp/shared/cubit/app_cubit.dart';
import 'package:socialapp/shared/cubit/app_states.dart';
import 'modules/login_screen/login_screen.dart';
import 'shared/network/local/cache_helper.dart';

void main() async {
  BlocOverrides.runZoned(
        () async{
          WidgetsFlutterBinding.ensureInitialized();
          await CacheHelper.init();
          await Firebase.initializeApp();
          Widget widget;
          var uId = CacheHelper.getData(key: 'uId');
          // ignore: avoid_print
          print('the uId is $uId');
          if (uId != null)
          {
            widget = SocialLayout();
          }
          else {
            widget = SocialLoginScreen();
          }
          runApp(MyApp(
            startWidget: widget,
          ));
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
}


class MyApp extends StatelessWidget {
  final Widget? startWidget;
  const MyApp({
    Key? key,
    this.startWidget,
  }) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=> AppCubit()..getUserData()),
        BlocProvider(create: (context)=> SocialLoginCubit()),
        BlocProvider(create: (context)=> SocialRegisterCubit()),
      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state){},
        builder: (context, state){
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        },
      ),
    );
  }
}
