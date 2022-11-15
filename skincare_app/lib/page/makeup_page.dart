import 'dart:convert';
import 'package:skincare_app/model/model_makeup.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as rootBundle;

class makeup extends StatefulWidget {
  const makeup({Key? key}) : super(key: key);

  @override
  _makeupState createState() => _makeupState();
}

class _makeupState extends State<makeup> {
  Future<List<ModelMakeup>> ReadJsonData() async {
    final jsonData =
        await rootBundle.rootBundle.loadString('assets/data/makeup.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => ModelMakeup.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 131, 78, 0),
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
                  color: Colors.white,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
                height: 163,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "  Daily",
                      style: TextStyle(
                          color: Color.fromARGB(255, 131, 78, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "  MakeUp",
                      style: TextStyle(
                          color: Color.fromARGB(255, 131, 78, 0),
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "      Tips Makeup Sederhana",
                      style: TextStyle(
                          color: Color.fromARGB(255, 131, 78, 0),
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
                  'assets/images/long2.jpg',
                  width: 262,
                  height: 174,
                  fit: BoxFit.fitWidth,
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
                  var items = data.data as List<ModelMakeup>;
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
                                                      fontSize: 14,
                                                      fontStyle:
                                                          FontStyle.italic),
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
                                                    fontSize: 12,
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
