// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, sized_box_for_whitespace

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children:
        [
          Container(
            height: 200,
            child: Stack(
              alignment: AlignmentDirectional.bottomCenter,
              children:
              [
                Align(
                  child: Container(
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          'https://img.freepik.com/free-vector/realistic-ramadan-horizontal-banner-template_52683-82453.jpg?t=st=1647631459~exp=1647632059~hmac=01c0d89b9663ffa0f034a5b5938e6f8c08c3cb9f013db69f16a97a31c4e1666a&w=1060',
                        ),

                      ),
                    ),
                  ),
                  alignment: AlignmentDirectional.topCenter,
                ),
                CircleAvatar(
                  radius: 53,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  child: CircleAvatar(
                    radius: 50,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Theme.of(context).scaffoldBackgroundColor,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-vector/cute-panda-drink-boba-milk-tea-with-skateboard-cartoon-vector-icon-illustration-animal-drink-icon_138676-4371.jpg?t=st=1647644684~exp=1647645284~hmac=42a1cdc3decebd9cf180e34f772cceaf41f9414d6dcbdef9447a8469a37be90b&w=740'
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            'Ahmed Reda',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,

            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'write your bio ...',
            style: Theme.of(context).textTheme.caption,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children:
            [
              Expanded(
                child: InkWell(
                  child: Column(
                    children:
                    [
                      Text(
                          '200',
                          style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                          'Posts',
                          style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Column(
                    children:
                    [
                      Text(
                          '300',
                          style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                          'Photos',
                          style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Column(
                    children:
                    [
                      Text(
                          '1k',
                          style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                          'Followers',
                          style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
              Expanded(
                child: InkWell(
                  child: Column(
                    children:
                    [
                      Text(
                          '75',
                          style: Theme.of(context).textTheme.subtitle2,
                      ),
                      Text(
                          'Followings',
                          style: Theme.of(context).textTheme.caption,
                      ),
                    ],
                  ),
                  onTap: (){},
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children:
            [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 40,
                  child: OutlinedButton(
                    onPressed: ()
                    {

                    },
                    child: Text(
                      'Add photos',
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                height: 40,
                child: OutlinedButton(
                  onPressed: ()
                  {

                  },
                  child: Icon(Icons.edit)
                ),
              ),
            ],
          ),

        ],
      ),
    );
  }
}
