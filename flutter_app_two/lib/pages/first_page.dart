import 'package:flutter/material.dart';
import 'package:flutter_app_two/pages/second_page.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("1st Page"),
        backgroundColor: Colors.red,
        elevation: 4,
        centerTitle: true,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => const SecondPage(),
              //   ),
              // );
              //instead of this we can also do
              Navigator.pushNamed(context, '/secondpage');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Button background color
              foregroundColor: Colors.white, // Text color
              textStyle: const TextStyle(
                fontSize: 25, // Text size
                fontWeight: FontWeight.bold, // Text weight
                //fontStyle: FontStyle.italic, // Italic style
              ),
            ),
            child: const Text("Go to second page")),
      ),
    );
  }
}
