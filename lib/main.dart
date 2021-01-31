import 'package:flutter/material.dart';
import 'package:image_list_view/screens/HomePage/home_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: SplashScreen(
          seconds: 3,
          navigateAfterSeconds: HomePage(),
          imageBackground: AssetImage('assets/images/splash.gif'),
          loaderColor: Colors.white,
        ),
      ),
    );
  }
}

// class AfterSplash extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return HomePage();
//   }
// }
