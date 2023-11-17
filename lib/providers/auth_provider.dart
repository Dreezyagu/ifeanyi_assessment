import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProvider extends StateNotifier<StateEnum> {
  AuthProvider(super.state);

  void signInWithGoogle(
      {Function(User)? onSuccess, Function(String)? onError}) async {
    state = StateEnum.loading;

    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final cred = await FirebaseAuth.instance.signInWithCredential(credential);
      if (cred.user != null) {
        state = StateEnum.success;
        if (onSuccess != null) {
          onSuccess(cred.user!);
        }
      } else {
        state = StateEnum.error;
        if (onError != null) {
          onError("Unable to sign in");
        }
      }
    } catch (e) {
      state = StateEnum.error;
      if (onError != null) {
        onError("Unable to sign in");
      }
    }
  }

  void signInWithGithub(
      {Function(User)? onSuccess, Function(String)? onError}) async {
    state = StateEnum.loading;

    try {
      GithubAuthProvider githubProvider = GithubAuthProvider();

      final cred =
          await FirebaseAuth.instance.signInWithProvider(githubProvider);
      if (cred.credential != null) {
        state = StateEnum.success;
        if (onSuccess != null) {
          onSuccess(cred.user!);
        }
      } else {
        state = StateEnum.error;
        if (onError != null) {
          onError("Unable to sign in");
        }
      }
    } catch (e) {
      state = StateEnum.error;
      if (onError != null) {
        onError("Unable to sign in");
      }
    }
  }

  void signInWithEmail(String email, password,
      {Function(User)? onSuccess, Function(String)? onError}) async {
    state = StateEnum.loading;

    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        state = StateEnum.error;
        if (onError != null) {
          onError("User not found");
        }
      } else if (e.code == 'wrong-password') {
        state = StateEnum.error;
        if (onError != null) {
          onError("Wrong password");
        }
      }
    }

    if (credential?.user != null) {
      state = StateEnum.success;
      if (onSuccess != null) {
        onSuccess(credential!.user!);
      }
    } else {
      state = StateEnum.error;
      if (onError != null) {
        onError("Unable to sign in");
      }
    }
  }

  void signUpWithEmail(String email, password,
      {Function(User)? onSuccess, Function(String)? onError}) async {
    state = StateEnum.loading;

    UserCredential? credential;
    try {
      credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        state = StateEnum.error;
        if (onError != null) {
          onError("Weak password");
        }
      } else if (e.code == 'email-already-in-use') {
        state = StateEnum.error;
        if (onError != null) {
          onError("Email already in use");
        }
      }
    } catch (e) {
      state = StateEnum.error;
      if (onError != null) {
        onError("Unable to sign");
      }
    }

    if (credential?.credential != null) {
      state = StateEnum.success;
      if (onSuccess != null) {
        onSuccess(credential!.user!);
      }
    } else {
      state = StateEnum.error;
    }
  }
}

final authProvider = StateNotifierProvider<AuthProvider, StateEnum>((ref) {
  return AuthProvider(StateEnum.initial);
});

enum StateEnum { initial, loading, success, error }


// SHA 1: D6:A2:F4:14:87:BE:AD:F8:F4:5E:78:8A:4A:2E:36:4C:91:C2:EE:4B
// SHA 256: 80:F4:2B:16:B6:81:8A:4A:11:49:7E:22:BD:8A:93:3E:7E:61:37:F3:D4:B7:DE:C4:6F:68:65:79:95:AE:BF:C9