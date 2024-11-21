import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2nd Page"),
        backgroundColor: Colors.deepOrange,
        elevation: 4,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/firstpage');
            },
            child: Text("Go back")),
      ),
    );
  }
}
