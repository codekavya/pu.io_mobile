import 'package:flutter/material.dart';
import 'package:puio_mobile/components/text_field_container.dart';
import 'package:puio_mobile/constants.dart';

class RoundedPasswordField extends StatelessWidget {
  final String errorText;
  final ValueChanged<String> onChanged;
  const RoundedPasswordField({
    Key key,
    this.errorText,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: true,
        onChanged: onChanged,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          errorText: errorText,
          hintText: "Password",
          icon: Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: Icon(
            Icons.visibility,
            color: kPrimaryColor,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
