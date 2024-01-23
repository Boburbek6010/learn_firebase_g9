import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:learn_firebase_g9/pages/home_page.dart';
import 'package:learn_firebase_g9/pages/login_page.dart';
import 'package:learn_firebase_g9/services/auth_service.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Widget _startPage(){
  //   return StreamBuilder<User?>(
  //     stream: AuthService.auth.authStateChanges(),
  //     builder: (context, snapshot) {
  //       log("message");
  //       if (snapshot.hasData) {
  //         log(snapshot.data.toString());
  //         return const HomePage();
  //       } else {
  //         return const LoginPage();
  //       }
  //     },
  //   );
  // }



  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthService.auth.authStateChanges(),
      builder: (context, snapshot) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: snapshot.hasData ?const HomePage() :const LoginPage(),
        );
      }
    );
  }
}
