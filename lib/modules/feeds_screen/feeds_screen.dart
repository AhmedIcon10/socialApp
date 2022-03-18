// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:socialapp/shared/constants.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children:
          [
            Card(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(
                image: NetworkImage(
                'https://img.freepik.com/free-vector/realistic-ramadan-horizontal-banner-template_52683-82453.jpg?t=st=1647631459~exp=1647632059~hmac=01c0d89b9663ffa0f034a5b5938e6f8c08c3cb9f013db69f16a97a31c4e1666a&w=1060'
              ),
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            ListView.separated(
              shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=>buildPostItem(context),
                separatorBuilder: (context, index)=>SizedBox(height: 10,),
                itemCount: 5),
          ],
        ),
      ),
    );
  }
}
Widget buildPostItem(context)=>Card(
  child:
  Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children:
      [
        Row(
          children:
          [
            CircleAvatar(
              backgroundImage:
              NetworkImage(
                  'https://img.freepik.com/free-vector/realistic-ramadan-horizontal-banner-template_52683-82453.jpg?t=st=1647631459~exp=1647632059~hmac=01c0d89b9663ffa0f034a5b5938e6f8c08c3cb9f013db69f16a97a31c4e1666a&w=1060'
              ),
              radius: 25,

            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  Row(
                    children:
                    [
                      Text(
                        'Ahmed Reda',
                        style: TextStyle(
                          fontSize: 17,
                          height: 1.3,
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      CircleAvatar(
                        radius: 10,
                        child: Icon(
                          Icons.check_circle,
                          color: defaultColor,
                          size: 18,
                        ),
                        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ],
                  ),
                  Text('march 18,2022 at 9:00 pm',
                    style: Theme.of(context).textTheme.caption!.copyWith(height: 1.3),
                  ),
                ],
              ),
            ),
            Spacer(),
            IconButton(
              onPressed: ()
              {

              },
              icon: Icon(
                  Icons.more_horiz
              ),),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 1,
          color: Colors.grey,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book'),
        SizedBox(
          height: 10,
        ),
        Container(
          width: double.infinity,
          height: 180,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                'https://img.freepik.com/free-vector/realistic-ramadan-horizontal-banner-template_52683-82453.jpg?t=st=1647631459~exp=1647632059~hmac=01c0d89b9663ffa0f034a5b5938e6f8c08c3cb9f013db69f16a97a31c4e1666a&w=1060',
              ),

            ),
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          width: double.infinity,
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            children:
            [
              Container(
                height: 25,
                child: MaterialButton(onPressed: ()
                {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  child: Text(
                    '#software engineering',
                    style: TextStyle(
                      color: defaultColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(onPressed: ()
                {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  child: Text(
                    '#software engineering',
                    style: TextStyle(
                      color: defaultColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(onPressed: ()
                {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  child: Text(
                    '#software engineering',
                    style: TextStyle(
                      color: defaultColor,
                    ),
                  ),
                ),
              ),
              Container(
                height: 25,
                child: MaterialButton(onPressed: ()
                {},
                  color: Theme.of(context).scaffoldBackgroundColor,
                  minWidth: 1,
                  padding: EdgeInsets.zero,
                  elevation: 0,
                  child: Text(
                    '#software engineering',
                    style: TextStyle(
                      color: defaultColor,
                    ),
                  ),
                ),
              ),


            ],
          ),
        ),
        Row(
          children:
          [
            InkWell(
              onTap: (){},
              child: Row(
                children:
                [
                  Icon(
                    Icons.check,
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('1200')
                ],
              ),
            ),
            Spacer(),
            InkWell(
              onTap: (){},
              child: Row(
                children:
                [
                  Icon(
                    Icons.comment,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('400')
                ],
              ),
            ),
          ],
        ),
        Row(
          children:
          [
            CircleAvatar(
              backgroundImage:
              NetworkImage(
                  'https://img.freepik.com/free-vector/realistic-ramadan-horizontal-banner-template_52683-82453.jpg?t=st=1647631459~exp=1647632059~hmac=01c0d89b9663ffa0f034a5b5938e6f8c08c3cb9f013db69f16a97a31c4e1666a&w=1060'
              ),
              radius: 20,

            ),
            SizedBox(
              width: 10,
            ),
            Expanded(child: Text('write a comment...')),
            SizedBox(
              width: 5,
            ),
            Spacer(),
            IconButton(onPressed: ()
            {

            },
                icon:Icon(Icons.check))
          ],
        ),


      ],
    ),
  ),
);