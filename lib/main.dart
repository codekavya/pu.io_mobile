import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// MaterialApp(
//       title: 'PUIO MOBILE',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: MyHomePage(title: 'pu.io mobile'),
//     );

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'PU.IO MOBILE',
        home: MyHomePage(title: 'PU.IO MOBILE'),
        theme: ThemeData.dark().copyWith(
          primaryColor: Color(0xFFA51C30),
          scaffoldBackgroundColor: Color(0xFFE9E7E8),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text('Let\'s do this',
                  style: TextStyle(
                    color: Color(0xff72012C),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
