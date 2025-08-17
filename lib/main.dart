import 'package:appwrite/appwrite.dart';
import 'package:cubitbloc/config/environment.dart';
import 'package:cubitbloc/route/app_router.dart';
import 'package:cubitbloc/ui/page/page_todo_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // TODO: 8/12/25 make local hosted appwrite server functional
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client()
      .setEndpoint(Environment.appwritePublicEndpoint)
      .setProject(Environment.appwriteProjectId);
  Account account = Account(client);

  runApp(
    // add riverpod ProviderScope to the root widget of  the app; A Must
    const ProviderScope(child: App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final MyAppRouter _router = MyAppRouter();
    return MaterialApp.router(
      routerConfig: _router.router
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}
