import 'package:flutter/material.dart';

import '../main.dart';
import '../model/Courses.dart';

class CourseDetailsScreen extends StatelessWidget {
  final Courses courses;

  const CourseDetailsScreen({Key? key, required this.courses})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Course Details',
          style: blackTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 15.0,
            start: 15.0,
            end: 10.0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  courses.name!,
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Text('By ', style: blackTextStyle),
                          Text(courses.teacher!,
                              style:
                                  blackTextStyle.copyWith(color: Colors.grey)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Text(
                            '36 Reviews',
                            style: blackTextStyle,
                          ),
                          Text(
                            '(View All)',
                            style: textStyle,
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Start on',
                          style: blackTextStyle,
                        ),
                        Text(
                          ' 05 Feb 2020 |  ',
                          style: blackTextStyle.copyWith(color: Colors.grey),
                        ),
                        Text(
                          courses.lessons! + ' Lessions',
                          style: blackTextStyle,
                        )
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  '75.00 KWD',
                  style: textStyle.copyWith(fontSize: 35),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'About this Course',
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Text(
                  'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here content here\', making it look like readable English',
                  style:
                      blackTextStyle.copyWith(color: Colors.grey, fontSize: 16),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Course',
                  style: blackTextStyle.copyWith(fontSize: 20),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                ListView.builder(
                  itemCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => courseDetailsItem(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget courseDetailsItem(BuildContext context) => Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            children: [
              Text(
                'Lesson on',
                style: TextStyle(
                  color: colorText,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'PlayfairDisplay',
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Text(
                'Introduction',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay'),
              ),
              const Spacer(),
              Card(
                elevation: 10,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                child: Icon(
                  Icons.play_circle_filled_outlined,
                  color: colorPrimary,
                  size: 40.0,
                ),
              ),
            ],
          ),
        ),
      );
}
