import 'package:database/viewmodel/auth_view_model.dart';
import 'package:database/views/auth/login_view.dart';
import 'package:database/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Center(child: Text('Registrati'))),
      body: vm.isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await vm.register(
                        emailController.text,
                        passwordController.text,
                      );
                      if (vm.session != null && context.mounted) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (_) => HomeView()),
                        );
                      }
                    },
                    child: Text('Registrati'),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => LoginView()),
                      );
                    },
                    child: const Text('Hai già un account? Loggati!'),
                  ),
                ],
              ),
            ),
    );
  }
}
