import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future signUp(String email, String password) async {
    final response = await Supabase.instance.client.auth
        .signUp(email: email, password: password);
    if (response.session == null) {
      throw Exception('Sign up failed');
    }
  }

  Future signIn(String email, String password) async {
    final response = await Supabase.instance.client.auth
        .signInWithPassword(email: email, password: password);
    if (response.session == null) {
      throw Exception('Sign in failed');
    }
  }

  Future signOut() async {
    await Supabase.instance.client.auth.signOut();
  }
}
