import 'package:flutter/material.dart';
import 'package:puio_mobile/services/constants.dart';
import 'package:puio_mobile/services/networkHelper.dart';

import 'package:dropdown_search/dropdown_search.dart';

import 'dart:convert';

import 'login_page.dart';

class SignUpPage extends StatefulWidget {
  @override
  _NewUserState createState() => _NewUserState();
}

class _NewUserState extends State<SignUpPage> {
  final Map<String, String> details = {};
  List<String> collegeNames = [];
  String selectedCollege;
  String selectedClass;
  bool classFieldEnabled = false;
  List<String> classNames = [];
  List classes = [];
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController collegeController = TextEditingController();
  TextEditingController classController = TextEditingController();

// dummy data
  final Map<String, dynamic> colleges = {
    "schools": [
      {
        "classes": [
          {
            "_id": "6061f70702ec16d07a706792",
            "name": "Classroom1",
            "shortCode": "BSE2020"
          },
          {
            "_id": "6061f70702ec16d07a706792",
            "name": "Classroom2",
            "shortCode": "BSE2020"
          },
          {
            "_id": "6061f70702ec16d07a706792",
            "name": "classroom3",
            "shortCode": "BSE2020"
          }
        ],
        "_id": "606186fd65115a3210d00a53",
        "name": "School of Engineering"
      },
      {
        "classes": [
          {
            "_id": "6061f70702ec16d07a706792",
            "name": "test",
            "shortCode": "BSE2020"
          }
        ],
        "_id": "606186fd65115a3210d00a53",
        "name": "School of Business"
      },
      {
        "classes": [
          {
            "_id": "6061f70702ec16d07a706792",
            "name": "test",
            "shortCode": "BSE2020"
          }
        ],
        "_id": "606186fd65115a3210d00a53",
        "name": "School of Humanities"
      },
    ]
  };

// get list of colleges
  getCollegesNames() async {
    // final parsedJson = await NetworkHelper(collegesURL).getProgramsData();
    final parsedJson = colleges;

    var length = parsedJson['schools'].length;
    for (var i = 0; i < length; i++) {
      var name = parsedJson['schools'][i]['name'];
      collegeNames.add(name);
    }
    print(collegeNames);
  }

// get list of class of selected college
  List getClassesNames(collegeName) {
    classes = colleges['schools']
        .where((school) => school['name'] == collegeName)
        .toList();

    for (var i = 0; i < classes[0]['classes'].length; i++) {
      classNames.add(classes[0]['classes'][i]['name']);
    }
    print(classNames);
    return classNames;
  }

// get id of selected class
  String getClassID(className) {
    var classObject =
        classes[0]['classes'].where((c) => c['name'] == className).toList();
    var id = classObject[0]['_id'].toString();
    print(id);
    return id;
  }

  @override
  void initState() {
    super.initState();
    getCollegesNames();
    getClassesNames('School of Engineering');
    getClassID('Classroom1');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Color(0xff212431), Colors.black]),
        ),
        child: ListView(
          children: <Widget>[
            Column(
              children: <Widget>[
                // TextNew(),
                logoContainer(),

                // Name field
                nameField(),

                // E-mail field,
                emailField(),

                //college dropdown
                collegeField(),

                // class dropdown
                classField(),

                // PasswordInput(),
                passwordField(),

                // button
                submitButton(),

                goToLogin(),

                // UserOld(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget logoContainer() {
    return Padding(
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
    );
  }

  Widget nameField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: nameController,
          cursorColor: Colors.white,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.lightBlueAccent,
            labelText: 'Name',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget emailField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: emailController,
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            fillColor: Colors.lightBlueAccent,
            labelText: 'E-mail',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget collegeField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        color: Colors.red,
        // height: 60,
        width: MediaQuery.of(context).size.width,

        child: Theme(
          data: ThemeData(textTheme: Typography.whiteHelsinki),
          child: DropdownSearch<String>(
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff212431),
            ),
            popupBackgroundColor: Colors.grey,
            hint: 'Select your college',

            mode: Mode.DIALOG,
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey,
            ),
            showAsSuffixIcons: true,
            showClearButton: true,
            dropdownButtonBuilder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_drop_down,
                size: 28,
                color: Colors.white,
              ),
            ),
            showSelectedItem: true,
            items: collegeNames,
            onChanged: (String newValue) {
              setState(() {
                classFieldEnabled = true;
                selectedCollege = newValue;
                print(selectedCollege);
              });
            },
            // selectedItem: dropDownValue,
          ),
        ),
      ),
    );
  }

  Widget classField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: Theme(
          data: ThemeData(textTheme: Typography.whiteHelsinki),
          child: DropdownSearch<String>(
            isFilteredOnline: true,
            enabled: classFieldEnabled,
            dropdownSearchDecoration: InputDecoration(
              filled: true,
              fillColor: Color(0xff212431),
            ),
            popupBackgroundColor: Colors.grey,
            hint: 'Select your college',

            mode: Mode.DIALOG,
            showSearchBox: true,
            searchBoxDecoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF1FAEE),
            ),
            showAsSuffixIcons: true,
            showClearButton: false,
            dropdownButtonBuilder: (_) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.arrow_drop_down,
                size: 28,
                color: Colors.white,
              ),
            ),
            showSelectedItem: true,
            // items: getClassesNames(selectedCollege),
            items: classNames,
            onChanged: (String newValue) {
              setState(() {
                selectedClass = newValue;
                print(selectedClass);
              });
            },
            // selectedItem: dropDownValue,
          ),
        ),
      ),
    );
  }

  Widget passwordField() {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width,
        child: TextFormField(
          controller: passwordController,
          style: TextStyle(
            color: Colors.white,
          ),
          obscureText: true,
          decoration: InputDecoration(
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            labelText: 'Password',
            labelStyle: TextStyle(
              color: Colors.white70,
            ),
          ),
        ),
      ),
    );
  }

  Widget submitButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, right: 50, left: 200),
      child: Container(
        alignment: Alignment.bottomRight,
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Color(0xff92111C),
            blurRadius: 5.0, // has the effect of softening the shadow
            spreadRadius: 1.0, // has the effect of extending the shadow
            offset: Offset(
              5.0, // horizontal, move right 10
              5.0, // vertical, move down 10
            ),
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(30)),
        child: TextButton(
          onPressed: () {
            getClassID(selectedClass);
            details.addAll({
              "Name": nameController.text,
              "Email": emailController.text,
              "Password": passwordController.text,
              "classroom": getClassID(selectedClass),
            });
            Navigator.pop(context);
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
    );
  }

  Widget goToLogin() {
    return Padding(
      padding: const EdgeInsets.only(top: 30, left: 30, bottom: 30),
      child: Container(
        alignment: Alignment.topRight,
        //color: Colors.red,
        height: 40,
        child: Row(
          children: <Widget>[
            Text(
              'Have we met before?',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white70,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LoginPage()));
                },
                child: Text(
                  'Sign in',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
