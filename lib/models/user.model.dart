import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/pages/register.page.dart';
import 'package:flutterapp/service/auth.service.dart';

class UserModel {
  final String email;
  final String password;
  final String profilePicture;
  final String phone;

  UserModel({
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.phone,
  });

  static void dispose() {}
}

class UserService {
  final _future = Supabase.instance.client.from('Users').select();

  Future<void> createUser(UserModel user) async {
    final response = await Supabase.instance.client.from('Users').upsert([
      {
        'email': user.email,
        'password': user.password,
        'profilePicture': user.profilePicture,
        'phone': user.phone,
      }
    ]);
  }
}
