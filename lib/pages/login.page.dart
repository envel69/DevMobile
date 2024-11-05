import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';
import 'package:flutterapp/pages/home.page.dart';
import 'package:flutterapp/pages/register.dart';

class MyLoginPage extends StatefulWidget {
  final String title;

  const MyLoginPage({super.key, required this.title});
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
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
              child: const Text('Connexion'),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyRegisterPage(title: 'TinTok')));
              },
              child: const Text('Tu n\'as pas de compte ? Inscrit-toi ici'),
            ),
          ],
        ),
      ),
    );
  }
}
