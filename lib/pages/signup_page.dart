import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:netflix_app/pages/home_page.dart';
import 'package:netflix_app/pages/signin_page.dart';
import 'package:netflix_app/theme.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isEmailValid = true;
  final TextEditingController emailController = TextEditingController(text: '');
  final TextEditingController passwordController =
      TextEditingController(text: '');
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(left: 24, right: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 325,
                    ),
                    Center(
                      child: Image.asset(
                        'assets/clonix.png',
                        color: redColor,
                        width: 150,
                        height: 34,
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Text(
                      'Email',
                      style: regulerWhite.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      controller: emailController,
                      onChanged: (value) {
                        print(value);
                        bool isValid = EmailValidator.validate(value);
                        print(isValid);
                        if (isValid) {
                          setState(() {
                            isEmailValid = true;
                          });
                        } else {
                          setState(() {
                            isEmailValid = false;
                          });
                        }
                      },
                      decoration: InputDecoration(
                        fillColor: oldGreyColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: redColor, width: 1),
                        ),
                        hintText: '',
                      ),
                      style: TextStyle(
                        color: isEmailValid ? Colors.white : redColor,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Password',
                      style: regulerWhite.copyWith(fontSize: 16),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        fillColor: oldGreyColor,
                        filled: true,
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: redColor, width: 1),
                        ),
                        hintText: '',
                      ),
                      style: TextStyle(
                        color: whiteColor,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width - 2 * 24,
                        height: 48,
                        child: TextButton(
                          onPressed: () async {
                            await _firebaseAuth
                                .createUserWithEmailAndPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                )
                                .then(
                                  (value) => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      //! BESOK
                                      builder: (context) => HomePage(),
                                    ),
                                  ),
                                );
                          },
                          child: Text(
                            'Sign Up',
                            style: regulerWhite.copyWith(
                              fontSize: 16,
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: redColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignIn(),
                            ),
                          );
                        },
                        child: Text(
                          'Back to Sign In',
                          style: regulerWhite.copyWith(
                            fontSize: 16,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
