import 'package:flutter/material.dart';
import '../views/login_page.dart';
import '../views/search_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AppRouter extends StatelessWidget {
  const AppRouter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Phonebook App',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => AuthChecker(),
        '/signin': (context) => AuthScreen(),
        '/phonebook': (context) => SearchListScreen(),
      },
      onUnknownRoute: (settings) => MaterialPageRoute(
        builder: (context) => const Scaffold(
          body: Center(child: Text('Page not found')),
        ),
      ),
    );
  }
}

class AuthChecker extends StatelessWidget {
  AuthChecker({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Supabase.instance.client.auth.currentUser;
    if (user != null) {
      return SearchListScreen();
    } else {
      return AuthScreen();
    }
  }
}
