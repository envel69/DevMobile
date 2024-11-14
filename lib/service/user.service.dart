import 'package:supabase_flutter/supabase_flutter.dart';

class UserService {
  final _future = Supabase.instance.client.from('Users').select();
}
