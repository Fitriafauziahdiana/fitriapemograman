import 'package:flutter/material.dart';

class ConsulPage extends StatefulWidget {
  const ConsulPage({super.key});

  @override
  State<ConsulPage> createState() => _ConsulPageState();
}

class _ConsulPageState extends State<ConsulPage> {
  List<String> Kepuasan = [
    "Sangat Baik",
    "Cukup Baik",
    "Baik",
    "Kurang Baik",
    "Tidak Baik"
  ];
  String _Kepuasan = "Sangat Baik";

  String _dds = "";

  TextEditingController controllerNama = new TextEditingController();
  TextEditingController controllerNomor = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerKeluhan = new TextEditingController();

  void _pilihDds(String value) {
    setState(() {
      _dds = value;
    });
  }

  void pilihKepuasan(String value) {
    setState(() {
      _Kepuasan = value;
    });
  }

  void submit() {
    AlertDialog alertDialog = new AlertDialog(
      content: new Container(
        height: 200.0,
        child: new Column(
          children: <Widget>[
            new Text("Nama Lengkap : ${controllerNama.text}"),
            new Text("Nomor Telpon : ${controllerNomor.text}"),
            new Text("Alamat Email : ${controllerEmail.text}"),
            new Text("Keluhan Yang Dialami : ${controllerKeluhan.text}"),
            new TextButton(
              onPressed: () => Navigator.pop(context),
              child: new Text("Oke", style: TextStyle(color: Colors.black)),
            )
          ],
        ),
      ),
    );
    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        leading: BackButton(color: Color.fromARGB(255, 255, 255, 255)),
        title: new Text("Formulir Konsultasi"),
        backgroundColor: Color.fromARGB(255, 69, 44, 0),
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10.0),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerNama,
                  decoration: new InputDecoration(
                      hintText: "Nama Lengkap",
                      labelText: "Nama Lengkap",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerNomor,
                  decoration: new InputDecoration(
                      hintText: "Nomor Telepon",
                      labelText: "Nomor Telepon",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  controller: controllerEmail,
                  decoration: new InputDecoration(
                      hintText: "Alamat Email",
                      labelText: "Alamat Email",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new TextField(
                  maxLines: 10,
                  controller: controllerKeluhan,
                  decoration: new InputDecoration(
                      hintText: "Keluhan Yang Dialami",
                      labelText: "Keluhan Yang Dialami",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new RadioListTile(
                  value: "Data Sudah Sesuai",
                  groupValue: _dds,
                  onChanged: (value) {
                    _pilihDds(value!);
                  },
                  activeColor: Color.fromARGB(255, 69, 44, 0),
                  subtitle: new Text("Pilih Jika Anda Sudah Mengisi Formulir"),
                ),
                new RadioListTile(
                  value: "Data Belum Sesuai",
                  groupValue: _dds,
                  onChanged: (value) {
                    _pilihDds(value!);
                  },
                  activeColor: Color.fromARGB(255, 69, 44, 0),
                  subtitle: new Text("Pilih Jika Anda Belum Mengisi Formulir"),
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                new Row(
                  children: <Widget>[
                    new Text(
                      "Kepuasan   :   ",
                      style: new TextStyle(
                        fontSize: 15,
                        color: Color.fromARGB(255, 1, 1, 0),
                      ),
                    ),
                    new DropdownButton(
                      value: _Kepuasan,
                      items: Kepuasan.map((value) {
                        return new DropdownMenuItem(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (String? value) {
                        pilihKepuasan(value!);
                      },
                    )
                  ],
                ),
                new Padding(
                  padding: new EdgeInsets.only(top: 20.0),
                ),
                TextButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Submit',
                            style: TextStyle(color: Colors.white))));
                  },
                  child: const Text(
                    'Klik Submit Jika Selesai',
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
                ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll<Color>(
                        Color.fromARGB(255, 69, 44, 0)),
                  ),
                  child: const Text('SUBMIT'),
                  onPressed: () {
                    submit();
                    // ...
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
