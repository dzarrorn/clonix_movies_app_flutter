import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app/pages/splash_page.dart';
import 'package:netflix_app/providers/asian_provider.dart';
import 'package:netflix_app/providers/popular_provider.dart';
import 'package:netflix_app/providers/soon_provider.dart';
import 'package:netflix_app/providers/theaters_provider.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SoonProvider>(
          create: (context) => SoonProvider(),
        ),
        ChangeNotifierProvider<TheatersProvider>(
          create: (context) => TheatersProvider(),
        ),
        ChangeNotifierProvider<PopularProvider>(
          create: (context) => PopularProvider(),
        ),
        ChangeNotifierProvider<AsianProvider>(
          create: (context) => AsianProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => SplashPage(),
        },
      ),
    );
  }
}
