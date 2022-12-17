import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_api/src/views/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'News Api',
      theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.deepOrangeAccent,
          primarySwatch: Colors.purple),
      home: const HomeScreen(),
    );
  }
}
