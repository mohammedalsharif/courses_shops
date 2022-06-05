import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController controller3 = new TextEditingController();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const SizedBox(
              height: 100,
            ),
            Center(
              child: Image.asset("assets/forgot.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Forgot your Password ?",
                      style: GoogleFonts.playfairDisplay(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: 250,
                        child: Text(
                          "Enter your registered email address below to receive your password reset instructions!",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.playfairDisplay(
                            textStyle: const TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(6),
              child:Container(
                margin:  EdgeInsets.only(
                  right: 20,
                  left: 20,
                  top: 20,
                ),
                padding: EdgeInsets.all(6),
                child: TextFormField(
                  controller: controller3,
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
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(right: 30, left: 30 ,top: 30),
                child: MaterialButton(
                  height: 60,
                  minWidth: double.infinity,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Text(
                    "SEND",
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
              height: 120,
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
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
