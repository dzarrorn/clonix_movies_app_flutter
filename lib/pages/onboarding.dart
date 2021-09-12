import 'package:flutter/material.dart';

import 'package:netflix_app/pages/signin_page.dart';
import 'package:netflix_app/theme.dart';

class Onboarding extends StatelessWidget {
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
              child: Column(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: Image.asset(
                          'assets/clonix.png',
                          color: redColor,
                          width: 121,
                          height: 34,
                        ),
                      ),
                      SizedBox(
                        height: 350,
                      ),
                      Center(
                        child: Text(
                          'Trying to join Netflix?',
                          style: boldWhite.copyWith(fontSize: 26),
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Center(
                        child: Text(
                          'You can sign up for Netflix in the\napp. We know it’s a hassle. After\nyou’re a member, you can start\nwatching in the app.',
                          style: regulerWhite.copyWith(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(
                        height: 75,
                      ),
                      Center(
                        child: Container(
                          width: MediaQuery.of(context).size.width - 2 * 24,
                          height: 48,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(),
                                ),
                              );
                            },
                            child: Text(
                              'Sign In',
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
                    ],
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
