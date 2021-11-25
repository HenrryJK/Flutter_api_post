import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
              ///////////// FORMULARIO DEL LOGIN

              Container(
                padding: EdgeInsets.symmetric(vertical: 80.0, horizontal: 20.0),
                margin: EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/posts.png",
                        width: 190,
                        fit: BoxFit.contain,
                      ),
                    ),
                    SizedBox(
                      height: 40.0,
                    ),
                    username(),
                    SizedBox(
                      height: 30.0,
                    ),
                    password(),
                    SizedBox(
                      height: 40.0,
                    ),
                    botonLogin(context),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //////////////////////////////

  Widget username() {
    return Container(
        child: TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        labelText: 'Username :',
        suffixIcon: Icon(Icons.account_circle),
      ),
    ));
  }

  /////////////////////////////////

  Widget password() {
    return Container(
        // margin: EdgeInsets.all(10.0),
        child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        // hintText: 'Escriba su usuario',
        labelText: 'Password :',
        suffixIcon: Icon(Icons.keyboard),
      ),
    ));
  }

  Widget botonLogin(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(20.0)),
      child: Container(
        width: 300.0,
        child: TextButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Iniciar Sesion",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/list');
          },
          style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 18),
          ),
        ),
        color: Color.fromRGBO(300, 120, 300, 20),
      ),
    );
  }
}
