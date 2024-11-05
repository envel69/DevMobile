import 'package:flutter/material.dart';
import 'package:flutterapp/pages/login.page.dart';
import 'package:flutterapp/pages/register.dart';

import 'home.page.dart';

class MyRegisterPage extends StatefulWidget {
  final String title;

  const MyRegisterPage({super.key, required this.title});
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Color.fromARGB(227, 255, 0, 149),
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Nom d\'utilisateur',
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Mot de passe',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyHomePage(title: 'TinTok'),
                  ),
                );
              },
              child: const Text('Inscription'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyLoginPage(title: 'TinTok')));
              },
              child: const Text('Tu as déjà un compte? Connecte-toi ici'),
            ),
          ],
        ),
      ),
    );
  }
}
