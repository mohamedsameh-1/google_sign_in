import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleSignOutService {
  static Future<bool> signOutFromGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      googleSignIn.disconnect();
      await FirebaseAuth.instance.signOut();
      return true;
    } on Exception catch (_) {
      return false;
    }
  }
}
