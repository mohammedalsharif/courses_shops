import 'package:flutter/material.dart';
import 'package:untitled/drawer_app.dart';
import 'package:untitled/screens/course_details_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  _CoursesScreenState createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  int index = 0;

  @override
  void initState() {
    _controller = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontFamily: 'PlayfairDisplay',
    );
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerApp(),
        appBar: AppBar(
          title: Text(
            'Course',
            style: textStyle,
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
                          color: index == 0 ? Colors.orange : Colors.black87,
                        ),
                      ),
                      Text(
                        'MY COURSES',
                        style: TextStyle(
                          fontFamily: 'PlayfairDisplay',
                          color: index == 1 ? Colors.orange : Colors.black87,
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
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) => allCoursesItem(),
                      ),
                      ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) => myCourseItem(),
                      ),
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

  Widget allCoursesItem() => InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
                    height: 80.0,
                    width: 80.0,
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
                      'Blology&The Sientifie Method',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'By',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '30 Jon 2020',
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '16 lesons',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2!
                          .copyWith(color: Colors.orange),
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
            builder: (context) => const CourseDetailsScreen(),
          ),
        ),
      );

  Widget myCourseItem() => InkWell(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                ClipRRect(
                  child: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png',
                    height: 80.0,
                    width: 80.0,
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
                      'Blology&The Sientifie Method',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Row(
                      children: [
                        Text(
                          'Start on',
                          style: Theme.of(context).textTheme.caption,
                        ),
                        const SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          '30 Jon 2020',
                          style: Theme.of(context).textTheme.bodyText2,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Text(
                      '03 of 4 Leveasons',
                      style: Theme.of(context).textTheme.bodyText2,
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
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CourseDetailsScreen(),
            ),
          );
        },
      );
}
