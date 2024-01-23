import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService{

  static FirebaseAuth auth = FirebaseAuth.instance;

  static Future<User?> registerUser(BuildContext context, String fullName, String email, String password)async{
    try{
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
      if(userCredential.user != null){
        log("message");
        await userCredential.user?.updateDisplayName(fullName);
      }
      return userCredential.user;
    }catch(e){
      Future.delayed(Duration.zero).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      });
    }
    return null;
  }

  static Future<User?> loginUser(BuildContext context, String email, String password)async{
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user;
    }catch(e){
      Future.delayed(Duration.zero).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$e")));
      });
    }
    return null;
  }

  // static Future<User?> loginWithGoogle()async{
  //   final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
  //   final GoogleSignInAuthentication gAuth = await gUser!.authentication;
  //   final OAuthCredential credential = GoogleAuthProvider.credential(
  //     accessToken: gAuth.accessToken,
  //     idToken: gAuth.idToken,
  //   );
  //   UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //   return userCredential.user;
  // }





  static Future<void> deleteAccount()async{
    await auth.currentUser?.delete();
  }


  static Future<void> logOut()async{

    await auth.signOut();
  }

  static Future<User?> loginWithGoogle(BuildContext context)async{
    final google = GoogleSignIn();
    GoogleSignInAccount? gAccount = await google.signIn();
    UserCredential? userCredentials;
    if(gAccount != null){
      GoogleSignInAuthentication gAuth = await gAccount.authentication;
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gAuth.accessToken,
        idToken: gAuth.idToken,
      );
      userCredentials = await FirebaseAuth.instance.signInWithCredential(credential);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Failed")));
    }
    return userCredentials?.user;
  }

}