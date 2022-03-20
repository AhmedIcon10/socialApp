// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/shared/components.dart';
import 'package:socialapp/shared/constants.dart';
import 'package:socialapp/shared/cubit/app_cubit.dart';
import 'package:socialapp/shared/cubit/app_states.dart';

class EditProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var nameController = TextEditingController();
        var bioController = TextEditingController();
        var phoneController = TextEditingController();
        var cubit = AppCubit.get(context);
        var profileImage = AppCubit.get(context).profileImage;
        var coverImage = AppCubit.get(context).coverImage;
        if (cubit.userModel != null) {
          nameController.text = cubit.userModel!.name ;
          bioController.text = cubit.userModel!.bio ;
        }else{
          nameController.text = "name";
          bioController.text = "bio";
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Edit Profile',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  cubit.updateUser(
                      name: nameController.text,
                      bio: bioController.text,
                      phone: phoneController.text);
                },
                child: Text(
                  'UPDATE',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 160,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(4),
                                    topRight: Radius.circular(4),
                                  ),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: coverImage == null
                                        ? NetworkImage(
                                            'https://img.freepik.com/free-vector/realistic-ramadan-horizontal-banner-template_52683-82453.jpg?t=st=1647631459~exp=1647632059~hmac=01c0d89b9663ffa0f034a5b5938e6f8c08c3cb9f013db69f16a97a31c4e1666a&w=1060',
                                          )
                                        : FileImage(coverImage)
                                            as ImageProvider,
                                  ),
                                ),
                              ),
                              IconButton(
                                onPressed: () {
                                  cubit.getCoverImage();
                                },
                                icon: CircleAvatar(
                                  backgroundColor:
                                      Theme.of(context).disabledColor,
                                  radius: 20,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: defaultColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          alignment: AlignmentDirectional.topCenter,
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 53,
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: CircleAvatar(
                                radius: 50,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor,
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: profileImage == null
                                          ? NetworkImage(
                                              'https://img.freepik.com/free-vector/cute-panda-drink-boba-milk-tea-with-skateboard-cartoon-vector-icon-illustration-animal-drink-icon_138676-4371.jpg?t=st=1647644684~exp=1647645284~hmac=42a1cdc3decebd9cf180e34f772cceaf41f9414d6dcbdef9447a8469a37be90b&w=740')
                                          : FileImage(profileImage)
                                              as ImageProvider,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                cubit.getProfileImage();
                              },
                              icon: CircleAvatar(
                                radius: 15,
                                backgroundColor:
                                    Theme.of(context).disabledColor,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: defaultColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customFormField(
                    controller: nameController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'Name must not be empty';
                      }
                      return null;
                    },
                    label: 'Name',
                    prefix: Icons.person_outline,
                  ),
                  SizedBox(height: 10),
                  customFormField(
                    controller: bioController,
                    type: TextInputType.text,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'Bio must not be empty';
                      }
                      return null;
                    },
                    label: 'Bio',
                    prefix: Icons.error_outline,
                  ),
                  SizedBox(height: 10),
                  customFormField(
                    controller: phoneController,
                    type: TextInputType.phone,
                    validate: (value) {
                      if (value.toString().isEmpty) {
                        return 'Phone must not be empty';
                      }
                      return null;
                    },
                    label: 'Phone',
                    prefix: Icons.phone,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
