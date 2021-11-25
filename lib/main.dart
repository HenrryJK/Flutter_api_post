import 'package:flutter/material.dart';
import 'package:Post_Api_Flutter/pages/modify_page.dart';
import 'package:Post_Api_Flutter/pages/list_page.dart';
import 'package:Post_Api_Flutter/pages/login_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/list': (_) => ListPage(),
        '/login': (_) => LoginPage(),
        '/modify': (_) => ModifyPage(),
      },
      home: LoginPage(),
    );
  }
}
