import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:safar_app/view/screens/homeScreen.dart';
import 'package:safar_app/view/screens/signinScreen.dart';

class FirebaseMethds {
  FirebaseAuth auth = FirebaseAuth.instance;
  signIn({email, password, context}) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      print("working Login Mwethod");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print("No user Found for the email");
      } else if (e.code == 'wrong-password') {
        final snackBar = SnackBar(content: Text('wrong-password'));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }

  signUp({email, password, context}) async {
    try {
      await auth.createUserWithEmailAndPassword(
          email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {}
    }
  }
}
