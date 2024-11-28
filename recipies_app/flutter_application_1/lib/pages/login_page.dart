import 'package:flutter/material.dart';
import 'package:flutter_application_1/services/auth_service.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _loginFormKey = GlobalKey();
  String? username, passward;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Login"),
      ),
      body: SafeArea(child: _buildUI()),
    );
  }

  Widget _buildUI() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 1,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, //column that's why vertical axis
        crossAxisAlignment: CrossAxisAlignment.center, //horizontal axis
        children: [
          _title(),
          _loginForm(),
        ],
      ),
    );
  }

  Widget _title() {
    return const Text(
      "RECEPIE BOOK",
      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
    );
  }

  Widget _loginForm() {
    return SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.90,
        height: MediaQuery.sizeOf(context).height * 0.30,
        child: Form(
            key: _loginFormKey,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFormField(
                  initialValue: "emilys",
                  onSaved: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Enter a username";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Username"),
                ),
                TextFormField(
                  initialValue: "emilyspass",
                  obscureText: true, //hide passward
                  onSaved: (value) {
                    setState(() {
                      passward = value;
                    });
                  },
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return "Enter a valid passward";
                    }
                    return null;
                  },
                  decoration: const InputDecoration(hintText: "Passward"),
                ),
                _loginButton(),
              ],
            )));
  }

  Widget _loginButton() {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.60,
      child: ElevatedButton(
          onPressed: () async {
            if (_loginFormKey.currentState?.validate() ?? false) {
              _loginFormKey.currentState?.save();
              //print("$username - $passward");
              bool result = await AuthService().login(username!, passward!);
            }
          },
          child: const Text("Login")),
    );
  }
}
