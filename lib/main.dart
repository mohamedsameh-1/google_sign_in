import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:sign_in_with_google_flutter/google_sign_in_view.dart';
import 'package:sign_in_with_google_flutter/home_view.dart';
import 'package:sign_in_with_google_flutter/service/google_sign_in_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final user = GoogleAuthService.auth.currentUser;
    return MaterialApp(home: user != null ? HomeView() : LoginScreen());
  }
}
