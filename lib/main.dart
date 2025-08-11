import 'package:cubitbloc/widget/widget_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // add riverpod ProviderScope to the root widget of  the app; A Must
    const ProviderScope(child: App()),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomePage());
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("TODO async Riverpod"), centerTitle: true),
        body: Center(
          child: ListView.builder(
            itemBuilder: (ctx, index) => TodoItem(key: Key(index.toString())),
          ),
        ),
      ),
    );
  }
}
