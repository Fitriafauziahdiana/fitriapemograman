import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:skincare_app/model/model_basic_skin.dart';
import 'package:skincare_app/page/consul_page.dart';
import 'package:skincare_app/page/datasql_page.dart';
import 'package:skincare_app/page/home_page.dart';
import 'package:skincare_app/page/menu_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _Page = 0;
  final pages = [
    HomePage(),
    MenuPage(),
    ConsulPage(),
    DataSqlPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: 0,
        backgroundColor: Color.fromARGB(255, 92, 60, 5),
        color: Color.fromARGB(255, 69, 44, 0),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 400),
        onTap: (index) {
          setState(() {
            _Page = index;
          });
        },
        items: const [
          Image(
            image: AssetImage("assets/images/icon6.png"),
            height: 60,
            width: 60,
          ),
          Image(
            image: AssetImage("assets/images/icon7.png"),
            height: 60,
            width: 60,
          ),
          Image(
            image: AssetImage("assets/images/icon8.png"),
            height: 60,
            width: 60,
          ),
          Image(
            image: AssetImage("assets/images/icon9.png"),
            height: 60,
            width: 60,
          ),
        ],
      ),
      body: pages[_Page],
    );
  }
}
