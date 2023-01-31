import 'dart:convert';
import 'package:skincare_app/model/model_masker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class masker extends StatefulWidget {
  const masker({Key? key}) : super(key: key);

  @override
  _maskerState createState() => _maskerState();
}

class _maskerState extends State<masker> {
  Future<List<ModelMasker>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/masker.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelMasker.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Color.fromARGB(255, 131, 78, 0),
                ),
                height: 163,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "    Natural",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "    Mask",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "          Rekomendasi Masker",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
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
                  topLeft: Radius.circular(110),
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(30),
                ),
                child: Image.asset(
                  'assets/images/long3.jpg',
                  width: 260,
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Expanded(
            child: Container(
          child: FutureBuilder(
              future: ReadJsonData(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(
                    child: Text("${data.error}"),
                  );
                } else if (data.hasData) {
                  var items = data.data as List<ModelMasker>;
                  return ListView.builder(
                      // ignore: unnecessary_null_comparison
                      itemCount: items == null ? 0 : items.length,
                      itemBuilder: (context, index) {
                        return Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          elevation: 5,
                          margin: EdgeInsets.all(15),
                          child: Theme(
                              data: Theme.of(context)
                                  .copyWith(dividerColor: Colors.transparent),
                              child: ExpansionTile(
                                title: Text(
                                  items[index].name.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Expanded(
                                            child: Container(
                                          padding: EdgeInsets.only(bottom: 10),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                    items[index]
                                                        .text
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                  items[index]
                                                      .penjelasan
                                                      .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontStyle:
                                                          FontStyle.normal),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: 8, right: 8),
                                                child: Text(
                                                  items[index]
                                                      .lanjutan
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ))
                                      ],
                                    ),
                                  )
                                ],
                              )),
                        );
                      });
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ))
      ])),
    );
  }
}
