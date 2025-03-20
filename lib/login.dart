import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:gooo/nn.dart';
import 'package:gooo/signin.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GoogleSignIn _googleSignIn = GoogleSignIn(clientId: "247675729135-tfh4mgnkirrcb1kh0c8hup05ckglbom5.apps.googleusercontent.com");
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _logIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully Logged In!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  nn()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${e.message}')),
      );
    }
  }
  Future<User?> _signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
      final OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential = await _auth.signInWithCredential(credential);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully Logged In!')),
      );
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  nn()),
      );

      return userCredential.user;

    }
    catch (e) {
      print("Error signing in with Google: $e");
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: _emailController, decoration: InputDecoration(
                  border:OutlineInputBorder(),labelText: 'Email')),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(controller: _passwordController, obscureText: true, decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password')),
            ),
            ElevatedButton(onPressed: _logIn, child: Text('Log In')),
            TextButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  SignUpScreen()),
              );
            }, child: Text("create a account")),
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
          ],
        ),
      ),
    );
  }
}