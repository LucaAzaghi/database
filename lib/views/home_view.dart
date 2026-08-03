import 'package:database/viewmodel/auth_view_model.dart';
import 'package:database/views/auth/login_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<AuthViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('SupabaseApp')),
        actions: [
          IconButton(onPressed: () async{
            await vm.logout();
            if (context.mounted) {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => LoginView()));
            }
          }, icon: const Icon(Icons.logout))
        ],
      ),
    );
  }
}