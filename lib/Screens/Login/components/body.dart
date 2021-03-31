import 'package:flutter/material.dart';
import 'package:puio_mobile/Screens/Login/components/background.dart';
import 'package:puio_mobile/Screens/Signup/signup_screen.dart';
import 'package:puio_mobile/components/already_have_an_account_acheck.dart';
import 'package:puio_mobile/components/rounded_button.dart';
import 'package:puio_mobile/components/rounded_input_field.dart';
import 'package:puio_mobile/components/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:puio_mobile/src/blocs/bloc.dart';
import 'package:puio_mobile/src/blocs/provider.dart';

class Body extends StatelessWidget {
  const Body({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of(context);

    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.03),
            StreamBuilder(
              stream: bloc.email,
              builder: (context, snapshot) {
                return RoundedInputField(
                  hintText: "Your Email",
                  onChanged: bloc.changeEmail,
                  errorText: snapshot.error,
                );
              },
            ),
            StreamBuilder(
              stream: bloc.password,
              builder: (context, snapshot) {
                return RoundedPasswordField(
                  onChanged: bloc.changePassword,
                  errorText: snapshot.error,
                );
              },
            ),
            StreamBuilder<Object>(
                stream: bloc.submitValid,
                builder: (context, snapshot) {
                  return RoundedButton(
                      text: "LOGIN",
                      press: snapshot.hasData ? bloc.submit : null);
                }),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
