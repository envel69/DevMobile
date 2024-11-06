import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.page.dart';
import 'package:flutterapp/pages/register.dart';
import 'package:flutterapp/service/auth.service.dart';

class MyLoginPage extends StatefulWidget {
  final String title;

  const MyLoginPage({super.key, required this.title});
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  final _formKey = GlobalKey<FormState>();
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final authService = AuthService();

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> _login() async {
    if (_formKey.currentState?.validate() ?? false) {
      try {
        await authService.signIn(
          usernameController.text,
          passwordController.text,
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyHomePage(title: 'TinTok')),
        );
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString())),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: usernameController,
                decoration: const InputDecoration(
                  hintText: 'Nom d\'utilisateur',
                ),
                // validator: (value) =>
                //     value!.isEmpty ? 'Entrez votre nom d\'utilisateur' : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Mot de passe',
                ),
                obscureText: true,
                // validator: (value) =>
                //     value!.isEmpty ? 'Entrez votre mot de passe' : null,
              ),
              ElevatedButton(
                onPressed: _login,
                child: const Text('Connexion'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              MyRegisterPage(title: 'TinTok')));
                },
                child: const Text('Tu n\'as pas de compte ? Inscrit-toi ici'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
