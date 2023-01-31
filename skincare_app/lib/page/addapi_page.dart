import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddApiPage extends StatefulWidget {
  final Map? todo;
  const AddApiPage({super.key, this.todo});

  @override
  State<AddApiPage> createState() => _AddApiPageState();
}

class _AddApiPageState extends State<AddApiPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
    final todo = widget.todo;
    if (todo != null) {
      isEdit = true;
      final title = todo['title'];
      final description = todo['description'];
      titleController.text = title;
      descriptionController.text = description;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: Color.fromARGB(255, 69, 44, 0),
        title: Text(
          isEdit ? 'Edit Data' : 'Tambah Data',
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(hintText: 'Title'),
          ),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(hintText: 'Description'),
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(height: 20),
          ElevatedButton(
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll<Color>(
                  Color.fromARGB(255, 69, 44, 0)),
            ),
            onPressed: isEdit ? updateData : submitData,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Text(
                isEdit ? 'Upadate Data' : 'Submit Data',
              ),
            ),
          ),
        ],
      ),
    );
  }

//UPDATE
  Future<void> updateData() async {
    final todo = widget.todo;
    if (todo == null) {
      print('Kamu tidak bisa Melakukan Update Data');
      return;
    }
    final id = todo['_id'];
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.put(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      showSuccesMessage("Data Berhasil di Update");
    } else {
      print("Data Tidak di Tambah");
      showSuccesMessage("Data Tidak di Update");
    }
  }

//SUBMIT
  Future<void> submitData() async {
    final title = titleController.text;
    final description = descriptionController.text;
    final body = {
      "title": title,
      "description": description,
      "is_completed": false,
    };

    final url = 'https://api.nstack.in/v1/todos';
    final uri = Uri.parse(url);
    final response = await http.post(
      uri,
      body: jsonEncode(body),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 201) {
      titleController.text = "";
      descriptionController.text = "";
      print("Data Berhasil di Tambah");
      showSuccesMessage("Data Berhasil di Tambah");
    } else {
      print("Data Tidak di Tambah");
      showSuccesMessage("Data Tidak di Tambah");
    }
  }

  void showSuccesMessage(String message) {
    final snackBar = SnackBar(content: Text(message));
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showErrorMessage(String message) {
    final snackBar = SnackBar(
      content: Text(
        message,
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
