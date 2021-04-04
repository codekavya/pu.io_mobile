import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:puio_mobile/Screens/notices.dart';

class GridDashboard extends StatelessWidget {
  Items item1 =
      new Items(title: "Class Notices", img: "assets/images/puio_logo.png");

  Items item2 = new Items(
    title: "College Notices",
    img: "assets/images/puio_logo.png",
  );
  Items item3 = new Items(
    title: "University Notices",
    img: "assets/images/puio_logo.png",
  );
  Items item4 = new Items(
    title: "Events",
    img: "assets/images/puio_logo.png",
  );
  Items item5 = new Items(
    title: "Chats",
    img: "assets/images/puio_logo.png",
  );
  Items item6 = new Items(
    title: "Gallery",
    img: "assets/images/puio_logo.png",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4, item5, item6];
    // var color = 0xFF455A64;
    var color = 0XFF212431;

    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 11,
          mainAxisSpacing: 11,
          children: myList.map((data) {
            return Container(
              decoration: BoxDecoration(
                  color: Color(color), borderRadius: BorderRadius.circular(10)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          if (data.title == 'notices') return Notices();
                          return null;
                        },
                      ));
                    },
                    child: Image.asset(
                      data.img,
                      width: 42,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    data.title,
                    style: GoogleFonts.openSans(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600)),
                  ),
                  SizedBox(
                    height: 22,
                  ),
                ],
              ),
            );
          }).toList()),
    );
  }
}

class Items {
  String title;

  String img;
  Items({this.title, this.img});
}
