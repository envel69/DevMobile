import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  final supaAuth = Supabase.instance.client.auth;

  User? get user => supaAuth.currentUser;

  Future<void> signUp(String email, String password, String username) async {
    final response = await supaAuth.signUp(email: email, password: password);

    if (response.user != null) {
      final userId = response.user!.id;

      final insertResponse =
          await Supabase.instance.client.from('Users').insert({
        'uuid_id': userId,
        'email': email,
        'username': username,
        'created_at': DateTime.now().toIso8601String(),
      });

      if (insertResponse.error != null) {
        throw Exception(
            'Erreur lors de l\'insertion dans Users : ${insertResponse.error!.message}');
      }
    } else {
      throw Exception('Échec de l\'inscription');
    }
  }

  Future<void> signIn(String email, String password) async {
    await supaAuth.signInWithPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    await supaAuth.signOut();
  }
}
