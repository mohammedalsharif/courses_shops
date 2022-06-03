import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:untitled/drawer_app.dart';
import 'package:untitled/model/Courses.dart';
import 'package:untitled/screens/course_details_screen.dart';

import '../main.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with SingleTickerProviderStateMixin {
  TextStyle textStyle = TextStyle(
    color: colorText,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: 'PlayfairDisplay',
  );
  TextStyle blackTextStyle = TextStyle(
    color: Colors.black,
    fontWeight: FontWeight.bold,
    fontFamily: 'PlayfairDisplay',
  );

  TabController? _controller;
  int index = 0;
  List<Courses> coursesList = [];

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerApp(),
        appBar: AppBar(
          title: Text(
            'Course',
            style: blackTextStyle,
          ),
        ),
        body: Padding(
          padding: const EdgeInsetsDirectional.only(
            top: 20,
            start: 10,
            end: 10,
          ),
          child: Column(
            children: [
              Container(
                height: 40.0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(3, 5),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: TabBar(
                    controller: _controller,
                    onTap: (x) {
                      setState(() {
                        index = x;
                      });
                    },
                    tabs: [
                      Text(
                        'ALL COURSES',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          color: index == 0 ? colorText : Colors.black87,
                        ),
                      ),
                      Text(
                        'MY COURSES',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          color: index == 1 ? colorText : Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: TabBarView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      StreamBuilder(
                        stream: readCourses(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Courses>> snapshot) {
                          if (snapshot.hasData) {
                            List<Courses>? courses = snapshot.data;
                            return ListView.builder(
                              itemCount: courses!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  allCoursesItem(index, courses),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            );
                          }
                        },
                      ),
                      StreamBuilder(
                        stream: readCourses(),
                        builder: (BuildContext context, AsyncSnapshot<List<Courses>> snapshot) {
                          if (snapshot.hasData) {
                            List<Courses>? courses = snapshot.data;
                            return ListView.builder(
                              itemCount: courses!.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  allCoursesItem(index, courses),
                            );
                          } else {
                            return Center(
                              child: CircularProgressIndicator(
                                color: Colors.amber,
                              ),
                            );
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stream<List<Courses>> readCourses() => FirebaseFirestore.instance
      .collection("courses")
      .snapshots()
      .map((event) => event.docs.map((e) => Courses.fromJson(e.data())).toList());

  Widget allCoursesItem(int index, List<Courses> courses) => InkWell(
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network( courses[index].imageURL!,
                    loadingBuilder: (context, child, loadingProgress) {
                      if(loadingProgress!=null){
                        return CircularProgressIndicator(color: colorPrimary,);
                      }else{
                        return child;
                      }
                    },
                    height: 100,
                    width: 100,
                    fit: BoxFit.fill,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      courses[index].name!,
                      style: blackTextStyle,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'By ',
                          style: TextStyle(
                            fontFamily: 'PlayfairDisplay',
                            color: Colors.grey
                          ),
                        ),
                        Text(
                          courses[index].teacher!,
                          style: blackTextStyle,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      courses[index].lessons! + ' Lessons',
                      style: textStyle,
                    )
                  ],
                )
              ],
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => CourseDetailsScreen(
              courses: courses[index],
            ),
          ),
        ),
      );

  // Widget myCourseItem(int index, List<Courses> courses) => InkWell(
  //   child: Card(
  //     elevation: 5,
  //     child: Padding(
  //       padding: const EdgeInsets.all(10.0),
  //       child: Row(
  //         children: [
  //           ClipRRect(
  //             child: Image.network(
  //               courses[index].imageURL!,
  //               height: 80.0,
  //               width: 80.0,
  //               fit: BoxFit.fill,
  //             ),
  //             borderRadius: BorderRadius.circular(10.0),
  //           ),
  //           const SizedBox(
  //             width: 10.0,
  //           ),
  //           Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 courses[index].name!,
  //                 style: blackTextStyle,
  //               ),
  //               const SizedBox(
  //                 height: 5.0,
  //               ),
  //               Text(
  //                 courses[index].teacher!,
  //                 style: blackTextStyle,
  //               ),
  //               const SizedBox(
  //                 height: 5.0,
  //               ),
  //               Text(
  //                 courses[index].lessons! + ' Lessons',
  //                 style: textStyle,
  //               )
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //   ),
  //   onTap: () {
  //     Navigator.of(context).push(
  //       MaterialPageRoute(
  //         builder: (context) => CourseDetailsScreen(
  //           courses: courses[index],
  //         ),
  //       ),
  //     );
  //   },
  // );
}
