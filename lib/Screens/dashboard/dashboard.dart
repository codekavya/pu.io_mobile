import 'package:flutter/material.dart';
import 'package:puio_mobile/services/constants.dart';
import 'package:puio_mobile/services/networkHelper.dart';
import 'package:puio_mobile/src/blocs/bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'gridDashboard.dart';

class Dashboard extends StatefulWidget {
  Dashboard({@required this.bloc});
  final Bloc bloc;

  @override
  _DashboardState createState() => _DashboardState(this.bloc);
}

class _DashboardState extends State<Dashboard> {
  _DashboardState(Bloc bloc) {
    this._bloc = bloc;
  }
  Bloc _bloc;
  String token;
  Future noticesData;
  Future schoolsAndCollegesData;
  Future programsData;
  Future facultiesData;

  getData() async {
    token = await _bloc.submit();
    noticesData = NetworkHelper(noticesURL, token).getData();
    print(noticesData);
    programsData = NetworkHelper(noticesURL, token).getData();
    facultiesData = NetworkHelper(noticesURL, token).getData();
    schoolsAndCollegesData = NetworkHelper(noticesURL, token).getData();
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF1FAEE),
      body: Column(
        children: <Widget>[
          SizedBox(
            height: 70,
          ),
          Padding(
            padding: EdgeInsets.only(
              left: 16,
              right: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "DASHBOARD",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0XFF212431),
                              fontSize: 18,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Hello,User",
                      style: GoogleFonts.openSans(
                          textStyle: TextStyle(
                              color: Color(0xffa29aac),
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
                IconButton(
                  alignment: Alignment.topCenter,
                  icon: Image.asset(
                    "assets/images/puio_logo.png",
                    width: 42,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
          GridDashboard()
        ],
      ),
    );
  }
}
