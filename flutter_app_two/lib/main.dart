import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key
  });

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: GestureDetector(
          onTap: () {
            print("This is i'm tapping here");
          },
          child:Container(
              height: 300,
              width: 300,
              color: Colors.blue,
            child: Center(
              child: Text("Submit")
            ),
            ),
        ),
        ),
    );
  }
}
