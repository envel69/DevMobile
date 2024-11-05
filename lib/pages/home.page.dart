import 'package:flutter/material.dart';
import 'package:flutterapp/pages/profile.dart';
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
        backgroundColor: Color.fromARGB(227, 255, 0, 149),
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
      body: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<_DSSState> _scaffoldKey = GlobalKey<_DSSState>();

    return Stack(
      children: [
        // const VideoPlayerWidget(),

        GestureDetector(onVerticalDragUpdate: (details) {
          if (details.delta.dy <= -10) {
            print('Affichage des commentaires');
            _scaffoldKey.currentState!._controller.animateTo(0.8,
                duration: Duration(milliseconds: 500), curve: Curves.easeIn);
          } else if (details.delta.dy >= 10) {
            print('profil');

            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          }
        }, onHorizontalDragUpdate: (dtl) {
          if (dtl.delta.dx <= -10) {
            print('dislike');
          } else if (dtl.delta.dx >= 10) {
            print('like');
          }
        }),
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
          color: Color.fromARGB(227, 255, 0, 149),
          child: ListView.builder(
            controller: scrollController,
            itemCount: 10,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text('Commentaire ${index + 1}'),
              );
            },
          ),
        );
      },
    );
  }
}
