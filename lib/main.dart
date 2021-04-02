import 'package:flutter/material.dart';

import 'package:puio_mobile/src/blocs/provider.dart';
import 'Screens/loading_screen.dart';

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
        home: LoadingScreen(),
      ),
    );
  }
}
