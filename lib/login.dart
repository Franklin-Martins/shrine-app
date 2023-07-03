import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 80),
            Column(
              children: [
                Image.asset('assets/diamond.png'),
                const Text('SHRINE')
              ],
            ),
            const SizedBox(height: 120.0,),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                label: Text('username'),
                filled: true
              ),
            ),
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                label: Text('password'),
                filled: true,
              ),
            ),
            OverflowBar(
              alignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: (){
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  child: const Text('CANCEL')
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text('NEXT')
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}