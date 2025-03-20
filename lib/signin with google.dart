import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:gooo/nn.dart';

class GoogleSignInScreen extends StatefulWidget {
  @override
  _GoogleSignInScreenState createState() => _GoogleSignInScreenState();
}

class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "247675729135-tfh4mgnkirrcb1kh0c8hup05ckglbom5.apps.googleusercontent.com");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      return userCredential.user;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully Logged In!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  nn()),
      );
    } catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  Future<void> _signOut() async {
    await _googleSignIn.signOut();
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Google Sign-In')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () async {
                User? user = await _signInWithGoogle();
                if (user != null) {
                  // Navigate to home screen or show a success message
                  print("Signed in as ${user.displayName}");
                }
              },
              child: Text('Sign in with Google'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _signOut,
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
