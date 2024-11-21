import 'package:flutter/material.dart';
import 'package:flutter_app_two/pages/first_page.dart';
import 'package:flutter_app_two/pages/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void printFunction() {
    print("Inside print function");
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const FirstPage(),
      routes: {
        '/secondpage': (context) => SecondPage(),
        '/firstpage': (context) => FirstPage(),
      },

      // ------------------------------------------------------------------------
      // body: GestureDetector(
      //   onTap: () {
      //     printFunction();
      //     print("This is i'm tapping here");
      //   },
      //   child:Container(
      //       height: 300,
      //       width: 300,
      //       color: Colors.blue,
      //     child: Center(
      //       child: Text("Submit")
      //     ),
      //     ),
      // ),
    );
  }
}
