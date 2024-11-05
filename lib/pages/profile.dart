import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _future = Supabase.instance.client.from('Users').select();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final Users = snapshot.data!;
          return ListView.builder(
            itemCount: Users.length,
            itemBuilder: ((context, index) {
              final user = Users[index];
              return ListTile(
                title: Text(user['username']),
              );
            }),
          );
        },
      ),
    );
  }
}

// ignore: unused_element
