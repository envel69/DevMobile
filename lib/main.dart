import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home.page.dart';
import 'package:flutterapp/pages/login.page.dart';
import 'package:flutterapp/pages/profile.dart';
// import 'package:flutterapp/pages/video_background.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:video_player_web/video_player_web.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load();

  await Supabase.initialize(
    url: dotenv.env['URL']!,
    anonKey: dotenv.env['ANONKEY']!,
  );
  print('Supabase initialized');
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyLoginPage(title: 'TinTok'),
    );
  }
}
