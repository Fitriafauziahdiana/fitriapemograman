import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:skincare_app/model/model_basic_skin.dart';
import 'package:skincare_app/page/basic_skincare_page.dart';
import 'package:skincare_app/page/makeup_page.dart';
import 'package:skincare_app/page/masker_page.dart';
import 'package:skincare_app/page/sehat_page.dart';
import 'package:skincare_app/page/serum_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Center(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(1),
            child: Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {},
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/logo1.png"),
                      height: 200,
                      width: 200,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Edukasi Perawatan Kulit yang bersumber dari ahli untuk kulit Anda",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const basicskincare()));
                },
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/icon2.png"),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Basic Skin Berrier",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const makeup()));
                },
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/icon3.png"),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Daily MakeUp",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const masker()));
                },
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/icon1.png"),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Natural Mask",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const sehat()));
                },
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/icon4.png"),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Healty Skin",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            margin: EdgeInsets.all(3),
            child: Expanded(
              child: InkWell(
                highlightColor: Colors.transparent,
                splashColor: Colors.transparent,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const serum()));
                },
                child: Column(
                  children: <Widget>[
                    Image(
                      image: AssetImage("assets/images/icon5.png"),
                      height: 80,
                      width: 80,
                    ),
                    SizedBox(
                      height: 1,
                    ),
                    Text(
                      "Best Serum",
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ))),
    );
  }
}
