import 'package:flutter/material.dart';
import 'package:flutterapp/pages/profile.page.dart';
import 'package:flutterapp/pages/video_background.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({super.key, required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final DraggableScrollableController sheetController =
      DraggableScrollableController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Image.asset('assets/img/Lyon.jpg'),
          ],
        ),
      ),
      body: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<_DSSState> _scaffoldKey = GlobalKey<_DSSState>();
    bool isNavigating =
        false; // Variable locale pour vérifier si la navigation est en cours

    return Stack(
      children: [
        // const VideoPlayerWidget(),

        GestureDetector(
          onVerticalDragUpdate: (details) {
            if (details.delta.dy <= -10) {
              print('Affichage des commentaires');
              _scaffoldKey.currentState!._controller.animateTo(0.8,
                  duration: Duration(milliseconds: 500), curve: Curves.easeIn);
            } else if (details.delta.dy >= 10) {
              print('profil');

              // Vérifier si une navigation est déjà en cours
              if (!isNavigating) {
                isNavigating = true; // Marquer la navigation comme en cours

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                ).then((_) {
                  // Lorsque la page Profil est fermée, réinitialiser le flag de navigation
                  isNavigating = false;
                });
              }
            }
          },
          onHorizontalDragUpdate: (dtl) {
            if (dtl.delta.dx <= -10) {
              print('dislike');
            } else if (dtl.delta.dx >= 10) {
              print('like');
            }
          },
        ),
        DSS(
          key: _scaffoldKey,
        ), // Intégration de DSS
      ],
    );
  }
}

class DSS extends StatefulWidget {
  const DSS({super.key});

  @override
  State<DSS> createState() => _DSSState();
}

class _DSSState extends State<DSS> {
  final DraggableScrollableController _controller =
      DraggableScrollableController();
  final TextEditingController _commentController = TextEditingController();
  List<Map<String, String>> _comments =
      []; // Liste pour stocker les commentaires

  final List<double> snapSize = [0, 0.5, 0.8];

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      controller: _controller,
      initialChildSize: 0,
      minChildSize: 0,
      maxChildSize: 0.8,
      snap: true,
      snapSizes: snapSize,
      builder: (BuildContext context, ScrollController scrollController) {
        return Container(
          color: Color.fromARGB(226, 30, 40, 172),
          child: Column(
            children: [
              // Champ de texte pour saisir un commentaire
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    labelText: 'Écrivez un commentaire...',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ),
              // Bouton pour envoyer un commentaire
              ElevatedButton(
                onPressed: () {
                  if (_commentController.text.isNotEmpty) {
                    final newComment = {
                      'username': 'User123', // Simuler un nom d'utilisateur
                      'comment': _commentController.text,
                    };

                    setState(() {
                      _comments.add(newComment);
                    });

                    _commentController
                        .clear(); // Réinitialiser le champ de texte
                  }
                },
                child: Text('Publier le commentaire'),
              ),
              SizedBox(height: 10),
              // Affichage des commentaires
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: _comments.length,
                  itemBuilder: (context, index) {
                    final comment = _comments[index];
                    return ListTile(
                      title: Text(comment['username']!),
                      subtitle: Text(comment['comment']!),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
