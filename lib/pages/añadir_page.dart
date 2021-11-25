import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:Post_Api_Flutter/models/post.model.dart';
import 'package:http/http.dart' as http;

class AnadirPage extends StatefulWidget {
  @override
  _AnadirPageState createState() => _AnadirPageState();
}

class _AnadirPageState extends State<AnadirPage> {
  String titulo = '';
  String descripcion = '';
  List<PostModel> postmodel = [];

  // EL POST MEDIANTE EL FUTURE

  Future<http.Response> createPost(PostModel posts) async {
    final url =
        Uri.parse('https://app-post-bd.herokuapp.com/api/auth/posts/add');

    final response = await http.post(url,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: json.encode(posts.toJson()));

    if (response.statusCode == 200) {
      print(response.body);
    } else {
      print('A network error occurred');
    }

    this.postmodel.add(posts);
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: Text("Añadir Nuevo Post"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
        children: [
          _titulo(),
          Divider(
            color: Colors.green[600],
            thickness: 0.5,
          ),
          _descripcion(),
          Divider(
            color: Colors.green[600],
            thickness: 0.5,
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              child: Icon(Icons.app_registration_rounded),
              onPressed: () async {
                final postObjeto = new PostModel(
                    titulo: this.titulo, descripcion: this.descripcion);
                final dataEnviar = await createPost(postObjeto);
                print(dataEnviar);
                Navigator.pushNamed(context, '/list');
              })
        ],
      ),
    );
  }

  Widget _titulo() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Titulo',
          icon: Icon(Icons.title)),
      onChanged: (value) {
        setState(() {
          this.titulo = value;
        });
      },
    );
  }

  Widget _descripcion() {
    return TextField(
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          labelText: 'Descripcion',
          icon: Icon(Icons.description_rounded)),
      //CAPTURAR EL VALOR DEL INPUT
      onChanged: (value) {
        setState(() {
          this.descripcion = value;
        });
      },
    );
  }
}
