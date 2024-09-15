import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  List<dynamic> users = [];

  // Método para consumir as informações da API
  Future<void> fetchUsers() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        users = json.decode(response.body);
      });
    } else {
      print('Falha na requisição: ${response.statusCode}.');
    }
  }

  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lista de Usuários',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Usuários'),
        ),
        body: users.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: users.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = users[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: index % 2 == 0
                          ? Colors.lightGreen[100]
                          : Colors.lightBlue[100],
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        user['name'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text(
                                'Nome: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user['username']),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Email: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user['email']),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Cidade: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user['address']['city']),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Telefone: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user['phone']),
                            ],
                          ),
                          Row(
                            children: [
                              const Text(
                                'Empresa: ',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(user['company']['name']),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
