import 'package:flutter/material.dart';
import 'package:malina_online_shop/presentation/pages/main_page.dart';

void main() {

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(
              fontFamily: 'MainFont',
            ),
      ),
      home: const MainPage(),
    );
  }
}
