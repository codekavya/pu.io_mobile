import 'package:flutter/material.dart';
import 'Screens/Welcome/welcome_screen.dart';
import 'package:puio_mobile/src/blocs/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PU.IO MOBILE',
        home: WelcomeScreen(),
      ),
    );
  }
}
