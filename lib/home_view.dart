import 'package:flutter/material.dart';
import 'package:sign_in_with_google_flutter/google_sign_in_view.dart';
import 'package:sign_in_with_google_flutter/service/google_sign_in_service.dart';
import 'package:sign_in_with_google_flutter/service/google_sign_out_service.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var userName = GoogleAuthService.auth.currentUser?.displayName ?? "";
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello, $userName"),
        actions: [
          IconButton(
            onPressed: () {
              GoogleSignOutService.signOutFromGoogle();
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
                (route) => false,
              );
            },
            icon: Icon(Icons.logout_rounded),
          ),
        ],
      ),
      body: Center(
        child: Text(
          "Logged in successfully 🎉",
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
