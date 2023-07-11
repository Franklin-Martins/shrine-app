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
                Text('SHRINE', style: Theme.of(context).textTheme.headlineSmall,),
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
            const SizedBox(height: 12.0,),
            TextField(
              controller: _passwordController,
              obscureText: true,
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
                  style: TextButton.styleFrom(
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0))
                    ),
                    foregroundColor: Theme.of(context).colorScheme.secondary
                  ),
                  child: const Text('CANCEL'),
                ),
                ElevatedButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    elevation: 8.0,
                    shape: const BeveledRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(7.0)),
                    ),
                  ),
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