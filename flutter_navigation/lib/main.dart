import 'package:dev/pages/first_page.dart';
import 'package:dev/pages/second_page.dart';
import 'package:dev/pages/third_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      routes: {
        '/secondpage': (context) => const SecondPage(),
        '/firstpage': (context) => const FirstPage(),
        '/thirdpage': (context) => const ThirdPage(),
      },
    );
  }
}
