import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DataSqlPage extends StatefulWidget {
  const DataSqlPage({super.key});

  @override
  State<DataSqlPage> createState() => _DataSqlPageState();
}

class _DataSqlPageState extends State<DataSqlPage> {
  List _tabeldata = [];
  bool _Isloading = true;

  Future _getdata() async {
    try {
      final response = await http.get(Uri.parse(
          "http://192.168.100.197/flutterapi/fitriauas/baru/view.php"));
      if (response.statusCode == 200) {
        print(response.body);
        final data = jsonDecode(response.body);
        setState(() {
          _tabeldata = data;
          _Isloading = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    _getdata();
    print(_tabeldata);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          leading: new Icon(Icons.list),
          title: new Text("Tampil Data Produk"),
          backgroundColor: Color.fromARGB(255, 69, 44, 0),
        ),
        body: _Isloading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView.builder(
                itemCount: _tabeldata.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(_tabeldata[index]['id']),
                      subtitle: Text(_tabeldata[index]['todo']),
                    ),
                  );
                })));
  }
}
