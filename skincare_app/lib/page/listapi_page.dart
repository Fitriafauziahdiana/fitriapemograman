import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skincare_app/page/addapi_page.dart';
import 'package:http/http.dart' as http;

class ApilistPage extends StatefulWidget {
  const ApilistPage({super.key});

  @override
  State<ApilistPage> createState() => _ApilistPageState();
}

class _ApilistPageState extends State<ApilistPage> {
  bool isLoading = true;
  List items = [];

  @override
  void initState() {
    super.initState();
    fetchTodo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color.fromARGB(255, 255, 255, 255)),
        backgroundColor: Color.fromARGB(255, 69, 44, 0),
        title: Text('Makeup Tutorial'),
      ),
      body: Visibility(
        visible: isLoading,
        child: Center(child: CircularProgressIndicator()),
        replacement: RefreshIndicator(
          onRefresh: fetchTodo,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index] as Map;
              final id = item['_id'] as String;
              return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(item['title']),
                subtitle: Text(item['description']),
                trailing: PopupMenuButton(
                  onSelected: ((value) {
                    if (value == 'edit') {
                      navigateToEditPage(item);
                    } else if (value == 'delete') {
                      deleteById(id);
                    }
                  }),
                  itemBuilder: (context) {
                    return [
                      PopupMenuItem(
                        child: Text('Edit'),
                        value: 'edit',
                      ),
                      PopupMenuItem(
                        child: Text('Delete'),
                        value: 'delete',
                      ),
                    ];
                  },
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: navigateToAaddPage,
          label: Text('Add Tutorial'),
          backgroundColor: Color.fromARGB(
            255,
            69,
            44,
            0,
          )),
    );
  }

  void navigateToEditPage(Map item) {
    final route = MaterialPageRoute(
      builder: (context) => AddApiPage(todo: item),
    );
    Navigator.push(context, route);
  }

  Future<void> navigateToAaddPage() async {
    final route = MaterialPageRoute(
      builder: (context) => AddApiPage(),
    );
    await Navigator.push(context, route);
    setState(() {
      isLoading = true;
    });
    fetchTodo();
  }

  Future<void> deleteById(String id) async {
    final url = 'https://api.nstack.in/v1/todos/$id';
    final uri = Uri.parse(url);
    final response = await http.delete(uri);
    if (response.statusCode == 200) {
      final filtered = items.where((element) => element['_id'] != id).toList();
      setState(() {
        items = filtered;
      });
    } else {
      showSuccesMessage('Data Tidak di Hapus');
    }
  }

  Future<void> fetchTodo() async {
    final url = 'https://api.nstack.in/v1/todos?page=1&limit=10';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as Map;
      final result = json['items'] as List;
      setState(() {
        items = result;
      });
    }
    setState(() {
      isLoading = false;
    });
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
      backgroundColor: Color.fromARGB(255, 79, 40, 0),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}



/// MENIT 44.46