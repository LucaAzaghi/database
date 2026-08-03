import 'package:database/core/supbase_client.dart';
import 'package:database/viewmodel/auth_view_model.dart';
import 'package:database/views/auth/login_view.dart';
import 'package:database/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SupbaseClientManager.init();
  await SupbaseClientManager.client.auth.signUp(
    email: 'carlo.verdi@gmail.com',
    password: 'provadatabase',
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, auth, _) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: .fromSeed(
                seedColor: Colors.lightGreen,
                brightness: Brightness.dark,
              ),
            ),
            home: auth.session != null ? HomeView() : LoginView(),
          );
        },
      ),
    );
  }
}
