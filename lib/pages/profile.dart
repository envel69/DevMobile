import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(227, 255, 0, 149),
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Action pour modifier le profil
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/img/ric.jpg'), // Image de profil
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Aymeric',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Utilisateur@example.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 32),
            const Text(
              'À propos de moi',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Je suis un passionné de développement mobile et j\'adore explorer de nouvelles technologies. J\'aime également partager mes connaissances et collaborer sur des projets intéressants.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Text(
              'Mes centres d\'intérêt',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: const [
                Chip(
                  label: Text('Développement'),
                  backgroundColor: Colors.redAccent,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Design UI/UX'),
                  backgroundColor: Colors.blueAccent,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Voyage'),
                  backgroundColor: Colors.green,
                  labelStyle: TextStyle(color: Colors.white),
                ),
                Chip(
                  label: Text('Lecture'),
                  backgroundColor: Colors.purple,
                  labelStyle: TextStyle(color: Colors.white),
                ),
              ],
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                // Action pour déconnexion
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 240, 52, 55),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
              ),
              child: const Text('Se déconnecter'),
            ),
          ],
        ),
      ),
    );
  }
}
