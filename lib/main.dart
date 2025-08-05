import 'package:cubitbloc/simple_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    // add riverpod ProviderScope to the root widget of  the app; A Must
      const ProviderScope(child: App(),)
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}


class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Riverpod!",),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              Text(
                ref.watch(riverPodCountState).toString(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              ElevatedButton.icon(
                  onPressed: () {
                    ref.read(riverPodCountState.notifier).state++;
                  },
                icon: const Icon(Icons.add),
                label: const Text("Add"),
              ),

              SizedBox(height: 8,),

              ElevatedButton.icon(
                onPressed: () {
                  ref.read(riverPodCountState.notifier).state--;
                },
                icon: const Icon(Icons.remove),
                label: const Text("Remove"),
              ),
              
            ],
          ),
        ),
      ),
    );
  }
}
