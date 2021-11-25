import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:Post_Api_Flutter/pages/añadir_page.dart';
import 'package:http/http.dart' as http;

class ListPage extends StatefulWidget {
  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Map<String, dynamic>? data;
  List postsData = [];

  // get Posts

  getData() async {
    final url =
        Uri.parse('https://app-post-bd.herokuapp.com/api/auth/posts/list');

    final response = await http.get(url);

    this.data = json.decode(response.body);
    setState(() {
      this.postsData = data!['response'];
      print("en setstate");
      print(data!['respuesta']);
    });
    print("response body");
    print(response.body);
  }

  /// delete data

  Future<http.Response> deleteData(int id) async {
    final url = Uri.parse(
        'https://app-post-bd.herokuapp.com/api/auth/posts/delete/${id}');

    final response = await http.delete(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );
    getData();
    return response;
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("Start Init in Main");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FORO DE POST 2021"),
        backgroundColor: Colors.green[600],
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
              onSelected: (item) => onselected(context, item),
              itemBuilder: (context) => [
                    PopupMenuItem<int>(
                        value: 0, child: Text("Añadir nuevo post")),
                  ])
        ],
      ),
      body: ListView.builder(
          itemCount: postsData.length,
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: UniqueKey(),
              onDismissed: (direction) {
                setState(() {
                  deleteData(postsData[index]['idpost']);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content:
                          Text('${postsData[index]['titulo']} Eliminado !')));
                });
              },
              child: GestureDetector(
                onTap: () {
                  print("Ha selecionado este registro: ");
                  print("${postsData[index]}");
                  final postobjeto = postsData[index];
                  print(postobjeto);
                  Navigator.pushNamed(context, '/modify',
                      arguments: postobjeto);
                },
                child: Card(
                    elevation: 15,
                    child: ListTile(
                        title: Text("${postsData[index]['titulo']}"),
                        tileColor: Colors.blue[100],
                        subtitle: Text("${postsData[index]['descripcion']}"))),
              ),
            );
          }),
    );
  }

  void onselected(BuildContext context, int item) {
    switch (item) {
      case 0:
        print("Publicando Espere..");
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AnadirPage()));
        break;

      default:
    }
  }
}
