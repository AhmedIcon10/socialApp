// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/modules/new_post_screen/new_post_screen.dart';
import 'package:socialapp/modules/notification_screen/notification_screen.dart';
import 'package:socialapp/modules/search_screen/search_screen.dart';
import 'package:socialapp/shared/components.dart';
import 'package:socialapp/shared/cubit/app_cubit.dart';
import 'package:socialapp/shared/cubit/app_states.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return BlocConsumer<AppCubit, AppStates>(
          listener: (context, state){},
          builder: (context, state){
            var cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  onPressed: ()
                  {
                    signOut(context);
                  },
                  icon: Icon(Icons.logout),
                ),
                  title: Text(
                      cubit.appBarTitles[cubit.currentIndex]
                  ),
                actions:
                [
                  IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search),),
                  IconButton(
                    onPressed: ()
                    {
                      navigateTo(context, NotificationScreen());
                    },
                    icon: Icon(Icons.notifications),),

                ],
              ),
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                items:
                [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home),
                      label: 'Feeds'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.chat),
                      label: 'Chat'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.people),
                      label: 'Users'
                  ),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings'
                  ),
                ],
                onTap: (index)
                {
                  cubit.changeBottomNavBar(index);
                },
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                currentIndex: cubit.currentIndex,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                elevation: 2.0,
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                  navigateTo(context, NewPostScreen());
                },
                child: Icon(Icons.post_add),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            );
          },
        );
      },
    
    
    );
  }
}
