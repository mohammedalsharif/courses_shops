import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:untitled/main.dart';
import 'package:untitled/screens/cart_screen.dart';
import 'package:untitled/screens/courses_screen.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/login_screen.dart';
import 'package:untitled/screens/products_screen.dart';
import 'package:untitled/services/auth.dart';

class DrawerApp extends StatefulWidget {
  const DrawerApp({Key? key}) : super(key: key);

  @override
  State<DrawerApp> createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  AuthFireBase authFireBase = AuthFireBase();
  final storage = new FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: ListView(
          children: [
            Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: Column(
                  children: [
                    Center(
                      child: Image.asset(
                        'assets/perspndrawer.png',
                        height: 150,
                        width: 200,
                      ),
                    ),
                    Center(
                      child: Text(
                       "Rechelle D. Michael",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'PlayfairDisplay',
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              margin: const EdgeInsets.only(top: 10),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.home_filled,
                  color: colorPrimary,
                ),
                title: const Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CoursesScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.my_library_books_rounded,
                  color: colorPrimary,
                ),
                title: const Text(
                  "Course",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.insert_drive_file_sharp,
                  color: colorPrimary,
                ),
                title: const Text(
                  "News",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ProductsScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.shopping_bag,
                  color: colorPrimary,
                ),
                title: const Text(
                  "Products",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: colorPrimary,
                ),
                title: const Text(
                  "Cart",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.person_pin,
                  color: colorPrimary,
                ),
                title: const Text(
                  "My Profile",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                leading: Icon(
                  Icons.settings,
                  color: colorPrimary,
                ),
                title: const Text(
                  "Settings",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xF1DCDCE2),
                  ),
                ),
              ),
              child: ListTile(
                onTap: () {
                  authFireBase.logout();
                  storage.delete(key: "uid");
                  Navigator.pop(context);
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                leading: Icon(
                  Icons.logout,
                  color: colorPrimary,
                ),
                title: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'PlayfairDisplay',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
