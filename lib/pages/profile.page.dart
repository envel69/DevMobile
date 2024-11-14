import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late Future<Map<String, dynamic>> _userFuture;

  @override
  void initState() {
    super.initState();
    // On récupère l'utilisateur connecté et ses informations de la table Users
    final userId = Supabase.instance.client.auth.currentUser?.id;
    if (userId != null) {
      _userFuture = Supabase.instance.client
          .from('Users')
          .select()
          .eq('uuid_id', userId) // On filtre par l'ID de l'utilisateur connecté
          .single(); // Nous nous attendons à une seule entrée
    } else {
      _userFuture = Future.value({});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _userFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          }
          if (!snapshot.hasData) {
            return const Center(child: Text('Aucune donnée disponible.'));
          }

          final user = snapshot.data!; // Nous avons une seule entrée ici
          final createdAt = user['created_at'];

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Username: ${user['username']}',
                    style: Theme.of(context).textTheme.headline6),
                const SizedBox(height: 10),
                Text('Email: ${user['email']}',
                    style: Theme.of(context).textTheme.bodyText1),
                const SizedBox(height: 10),
                Text('Compte créé le: $createdAt',
                    style: Theme.of(context).textTheme.bodyText2),
              ],
            ),
          );
        },
      ),
    );
  }
}
