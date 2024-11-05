import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthService {
  Future<void> signUpNewUser() async {
  final AuthResponse response = await Supabase.auth.signUp(
    email: 'example@email.com',
    password: 'example-password'
  );
}

