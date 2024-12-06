import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/thirdpage');
            },
            child: const Text("third page")),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Second Page"),
      ),
    );
  }
}
