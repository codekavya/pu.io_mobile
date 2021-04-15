import 'package:flutter/material.dart';
import 'package:puio_mobile/Screens/dashboard/dashboard.dart';

import 'signup_page.dart';
import 'package:puio_mobile/src/blocs/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({
    Key key,
  }) : super(key: key);
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight, end: Alignment.bottomLeft,
              // colors: [Colors.blueGrey, Colors.lightBlueAccent]
              colors: [Color(0xff212431), Colors.black]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                // TextLogin(),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 0.0),
                  child: Container(
                    height: 200,
                    width: 200,
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100,
                        ),
                        Center(
                            child: Image.asset(
                          'assets/images/puio_logo.png',
                          width: 70,
                          height: 70,
                        )),
                      ],
                    ),
                  ),
                ),

                // InputEmail(),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 50, right: 50),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<Object>(
                        stream: bloc.email,
                        builder: (context, snapshot) {
                          return TextFormField(
                            onChanged: bloc.changeEmail,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              errorText: snapshot.error,
                              border: InputBorder.none,
                              fillColor: Colors.white,
                              labelText: 'Name',
                              labelStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                // PasswordInput(),
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: StreamBuilder<Object>(
                        stream: bloc.password,
                        builder: (context, snapshot) {
                          return TextField(
                            onChanged: bloc.changePassword,
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            obscureText: true,
                            decoration: InputDecoration(
                                enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.white)),
                                errorText: snapshot.error,
                                border: InputBorder.none,
                                labelText: 'Password',
                                labelStyle: TextStyle(color: Colors.white70)),
                          );
                        }),
                  ),
                ),
                // ButtonLogin(),
                Padding(
                  padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
                  child: Container(
                    alignment: Alignment.bottomRight,
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xff92111C),
                          blurRadius:
                              5.0, // has the effect of softening the shadow
                          spreadRadius:
                              1.0, // has the effect of extending the shadow
                          offset: Offset(
                            5.0, // horizontal, move right 10
                            5.0, // vertical, move down 10
                          ),
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: TextButton(
                      onPressed: () async {
                        final token = await bloc.submit();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Dashboard(bloc: token)),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'OK',
                            style: TextStyle(
                              color: Color(0xff92111C),
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Color(0xff92111C),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // FirstTime(),

                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 30),
                  child: Container(
                    alignment: Alignment.topRight,
                    // color: Colors.red,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Text(
                          'Your first time?',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white70,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignUpPage()));
                          },
                          child: Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.right,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
