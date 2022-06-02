import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/services/auth.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController controller = new TextEditingController();
  TextEditingController controller2 = new TextEditingController();
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  var formKye = GlobalKey<FormState>();
  AuthFireBase _authFireBase = AuthFireBase();
  late String _email;
  late String _password;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: formKye,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 10,
                left: 20,
                top: 20,
              ),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  hintText: "First Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter First Name";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 20,
              ),
              child: TextFormField(
                controller: controller2,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.account_circle_outlined),
                  hintText: "Last Name",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Last Name";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 20,
              ),
              padding: EdgeInsets.all(6),
              child: TextFormField(
                controller: controller3,
                onChanged: (value) {
                  _email = value;
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(Icons.mail),
                  hintText: "Email Address",
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Last Name";
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(
                right: 20,
                left: 20,
                top: 20,
              ),
              padding: EdgeInsets.all(6),
              child: TextFormField(
                onChanged: (value) => _password = value,
                controller: controller4,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black45, width: 2.0),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  prefixIcon: Icon(
                    Icons.lock,
                  ),
                  hintText: "Password",
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please Enter Password";
                  } else if (value.length < 6) {
                    return "Password must be more than 6 letters";
                  }
                },
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(
                  right: 30,
                  left: 30,
                  top: 20,
                ),
                child: MaterialButton(
                  height: 60,
                  minWidth: double.infinity,
                  onPressed: () async {
                    if (formKye.currentState!.validate()) {
                      setState(() {
                        isLoading=true;
                      });
                      MyUser? createUser = await _authFireBase
                          .registerWithEmailAndPassword(_email, _password);
                      if (createUser != null) {
                        _authFireBase.saveUserDate(createUser.uid, controller.text, controller2.text,_email);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      }
                    }
                    setState(() {
                      isLoading=false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child:  isLoading?  CircularProgressIndicator(
                    color: Colors.white,
                  ):Text(
                    "REGISTER",
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  color: const Color(0xFFECB7BF),
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  ),
                  child: Text(
                    " Login Now",
                    style: GoogleFonts.playfairDisplay(
                      textStyle: const TextStyle(
                        color: Color(0xFFC99200),
                        fontSize: 16,
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
