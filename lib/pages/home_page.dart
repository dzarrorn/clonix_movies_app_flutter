import 'package:flutter/material.dart';
import 'package:netflix_app/models/asian_model.dart';
import 'package:netflix_app/models/popular_model.dart';
import 'package:netflix_app/models/soon_model.dart';
import 'package:netflix_app/models/theaters_model.dart';
import 'package:netflix_app/pages/signin_page.dart';
import 'package:netflix_app/providers/asian_provider.dart';
import 'package:netflix_app/providers/popular_provider.dart';
import 'package:netflix_app/providers/soon_provider.dart';
import 'package:netflix_app/providers/theaters_provider.dart';

import 'package:netflix_app/theme.dart';
import 'package:netflix_app/widgets/landscape_card.dart';
import 'package:netflix_app/widgets/potrait_card.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomePage extends StatelessWidget {
  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    var soonProvider = Provider.of<SoonProvider>(context);
    var theatersProvider = Provider.of<TheatersProvider>(context);
    var popularProvider = Provider.of<PopularProvider>(context);
    var asianProvider = Provider.of<AsianProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: blackColor,
        body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 24,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/clonix.png',
                            width: 97,
                            height: 38,
                          ),
                          InkWell(
                            onTap: () {
                              signOut().then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                left: 24,
                              ),
                              child: Text(
                                'Sign Out',
                                style: regulerWhite.copyWith(
                                  fontSize: 16,
                                  decoration: TextDecoration.underline,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        'Watch much easier',
                        style: regulerGrey.copyWith(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                //! NOTE: COMING SOON
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Coming Soon',
                    style: mediumWhite.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<SoonModel>>(
                    future: soonProvider.getSoon(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        int index = -1;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data.map((soon) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 24 : 0,
                                ),
                                child: LandscapeCard(
                                  imageUrl: soon.image,
                                  title: soon.title,
                                  sub: soon.genres,
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
                SizedBox(
                  height: 30,
                ),
                //! NOTE: MOST POPULAR MOVIES
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Most Popular Movies',
                    style: mediumWhite.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<PopularModel>>(
                    future: popularProvider.getPopular(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        int index = -1;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data.map((soon) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 24 : 0,
                                ),
                                child: PotraitCard(
                                  imageUrl: soon.image,
                                  title: soon.title,
                                  sub: soon.year,
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
                SizedBox(
                  height: 30,
                ),
                //! NOTE: THEATERS
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Theaters',
                    style: mediumWhite.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<TheatersModel>>(
                    future: theatersProvider.getTheaters(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        int index = -1;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data.map((soon) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 24 : 0,
                                ),
                                child: PotraitCard(
                                  imageUrl: soon.image,
                                  title: soon.title,
                                  sub: soon.genres,
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
                SizedBox(
                  height: 30,
                ),
                //! NOTE: ASIAN
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child: Text(
                    'Asian Movies',
                    style: mediumWhite.copyWith(
                      fontSize: 20,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder<List<AsianModel>>(
                    future: asianProvider.getAsian(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        int index = -1;
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: snapshot.data.map((soon) {
                              index++;
                              return Container(
                                margin: EdgeInsets.only(
                                  left: index == 0 ? 24 : 0,
                                ),
                                child: PotraitCard(
                                  imageUrl: soon.image,
                                  title: soon.title,
                                  sub: soon.year,
                                ),
                              );
                            }).toList(),
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
