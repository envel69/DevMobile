import 'package:flutter/material.dart';
import 'package:flutterapp/service/auth.service.dart';
import 'home.page.dart';
import 'login.page.dart';

class MyRegisterPage extends StatefulWidget {
  final String title;

  const MyRegisterPage({super.key, required this.title});
  @override
  _MyRegisterPageState createState() => _MyRegisterPageState();
}

class _MyRegisterPageState extends State<MyRegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final phoneController = TextEditingController();
  final authService = AuthService();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState?.validate() ?? false) {
      if (passwordController.text != confirmPasswordController.text) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Les mots de passe ne correspondent pas')),
        );
        return;
      }

      try {
        await authService.signUp(
          emailController.text,
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
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: 'Email',
                ),
                validator: (value) =>
                    value!.isEmpty ? 'Veuillez entrer votre email' : null,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: 'Mot de passe',
                ),
                obscureText: true,
                validator: (value) => value!.isEmpty
                    ? 'Veuillez entrer votre mot de passe'
                    : null,
              ),
              TextFormField(
                controller: confirmPasswordController,
                decoration: const InputDecoration(
                  hintText: 'Confirmer le mot de passe',
                ),
                obscureText: true,
                validator: (value) => value!.isEmpty
                    ? 'Veuillez confirmer votre mot de passe'
                    : null,
              ),
              TextFormField(
                controller: phoneController,
                decoration: const InputDecoration(
                  hintText: 'Numéro de téléphone',
                ),
                validator: (value) => value!.isEmpty
                    ? 'Veuillez entrer votre numéro de téléphone'
                    : null,
              ),
              ElevatedButton(
                onPressed: _register,
                child: const Text('Inscription'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MyLoginPage(title: 'TinTok')),
                  );
                },
                child: const Text('Tu as déjà un compte? Connecte-toi ici'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
