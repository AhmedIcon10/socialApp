import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socialapp/shared/components.dart';
import 'package:socialapp/shared/cubit/app_cubit.dart';
import 'package:socialapp/shared/cubit/app_states.dart';

class SocialLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: Text('News feed'),),
          body: ConditionalBuilder(
            condition: AppCubit.get(context).model! != null,
            builder: (context){
              return Column(
                children: [
                  if(!AppCubit.get(context).model!.isEmailVerified!)
                  Container(
                    color: Colors.amber.withOpacity(.65),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          const Icon(Icons.warning),
                          const SizedBox(width: 10,),
                          const Text('please verify your email'),
                          const Spacer(),
                          defaultTextButton(onPressed: (){
                            FirebaseAuth.instance.currentUser!.sendEmailVerification()
                                .then((value) {
                                  showToast(text: 'check your mail', state: ToastsStates.SUCCESS);
                            })
                                .catchError((error){});
                          }, text: 'Verify'),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            fallback: (context)=> const Center(child: CircularProgressIndicator(),),
          )
        );
      },
    
    
    );
  }
}
