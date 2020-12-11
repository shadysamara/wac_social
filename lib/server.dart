import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

FirebaseAuth auth = FirebaseAuth.instance;

Future<UserCredential> signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount googleUser =
      await GoogleSignIn(scopes: []).signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

  // Create a new credential
  final GoogleAuthCredential credential = GoogleAuthProvider.credential(
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user.email);
  String token = await userCredential.user.getIdToken();
  print(token);
  // Once signed in, return the UserCredential
  return userCredential;
}

Future<UserCredential> signInWithFacebook() async {
  try {
    final AccessToken result = await FacebookAuth.instance.login();

    final FacebookAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(result.token);
    UserCredential userCredential = await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
    String token = await userCredential.user.getIdToken();
    print(token);
    return userCredential;
  } catch (e) {
    print(e);
  }
}
