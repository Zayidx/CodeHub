import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override

  /// The root widget of the app.
  ///
  /// This is a simple [Scaffold] with an [AppBar] and a [Center] containing a
  /// [Text].
  ///
  /// The [AppBar] has a title widget that displays the text "My App".
  ///
  /// The [Center] displays the text "Welcome to my app!".
  ///
  /// This widget is the root of the app's widget tree.
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My App'),
      ),
      body: const Center(
        child: Text('Welcome to my app!'),
      ),
    );
  }
}
