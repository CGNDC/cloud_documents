import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import '../view_models/search_view_model.dart';
import '../routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Supabase with your project credentials
  await Supabase.initialize(
    url: 'https://cikgcfmcenwhlleswtha.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImNpa2djZm1jZW53aGxsZXN3dGhhIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDIzNDU1MzQsImV4cCI6MjA1NzkyMTUzNH0.3_qiIYfUH0kOZvMVrskK9JeatjLn-z0IJRsTZ6woz14',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchViewModel()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cloud Documents',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: AppRouter(),
    );
  }
}
