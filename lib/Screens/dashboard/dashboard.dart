import 'package:flutter/material.dart';
import 'package:puio_mobile/services/constants.dart';
import 'package:puio_mobile/services/networkHelper.dart';
import 'package:puio_mobile/src/blocs/bloc.dart';

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
    return Center(
      child: Container(
        child: Text('Dashboard Page'),
      ),
    );
  }
}
