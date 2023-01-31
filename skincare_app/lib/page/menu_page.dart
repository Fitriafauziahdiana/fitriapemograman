// ignore: unused_import
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:skincare_app/model/model_basic_skin.dart';
import 'package:skincare_app/page/basic_skincare_page.dart';
// ignore: unused_import
import 'package:skincare_app/page/consul_page.dart';
// ignore: unused_import
import 'package:skincare_app/page/home_page.dart';
import 'package:skincare_app/page/makeup_page.dart';
import 'package:skincare_app/page/masker_page.dart';
import 'package:skincare_app/page/sehat_page.dart';
import 'package:skincare_app/page/serum_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(230, 255, 255, 255),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Color.fromARGB(255, 64, 34, 0),
                    ),
                    height: 163,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "    MENU",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "            Education Of",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "            Skin Barrier",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(210),
                      bottomLeft: Radius.circular(90),
                      bottomRight: Radius.circular(30),
                    ),
                    child: Image.asset(
                      'assets/images/long6.jpg',
                      width: 290,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.all(2),
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
                        image: AssetImage("assets/images/icon1.png"),
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Basic Skin Berrier",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
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
                            builder: (context) => const makeup()));
                  },
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/icon2.png"),
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Daily MakeUp",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3,
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
                            builder: (context) => const masker()));
                  },
                  child: Column(
                    children: <Widget>[
                      Image(
                        image: AssetImage("assets/images/icon3.png"),
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Natural Mask",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
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
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "Healty Skin",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 2,
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
                        height: 65,
                        width: 65,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Text(
                        "Best Serum",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
