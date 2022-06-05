import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/screens/forgot_password_screen.dart';
import 'package:untitled/screens/home_screen.dart';
import 'package:untitled/screens/register_screen.dart';
import 'package:untitled/services/auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLoading = false;
  TextEditingController controller3 = new TextEditingController();
  TextEditingController controller4 = new TextEditingController();
  var formKye = GlobalKey<FormState>();
  AuthFireBase _authFireBase = AuthFireBase();
  late String _email;
  late String _password;
  final storage = new FlutterSecureStorage();

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
                    return "Please Enter Email Address";
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
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                bottom: 20,
                right: 20,
              ),
              child: GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ForgotPasswordScreen(),
                  ),
                ),
                child: Text(
                  "Forgot Password ?",
                  style: GoogleFonts.playfairDisplay(
                    textStyle: const TextStyle(
                      color: Color(0xFFC99200),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30),
                child: MaterialButton(
                  height: 60,
                  minWidth: double.infinity,
                  onPressed: () async {
                    if (formKye.currentState!.validate()) {
                      setState(() {
                        isLoading = true;
                      });
                      MyUser? user = await _authFireBase
                          .loginWithEmailAndPassword(_email, _password);
                      if (user != null) {
                        await storage.write(key: "uid", value: user.uid);
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                        );
                      }
                    }
                    setState(() {
                      isLoading = false;
                    });
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: isLoading
                      ? CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : Text(
                          "LOGIN",
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
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account?"),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Text(
                    " Register Now",
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
