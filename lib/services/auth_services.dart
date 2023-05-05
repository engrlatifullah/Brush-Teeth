
import 'package:brush_teeth/utils/flutter_toast.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {

  static Future<User?> createAccount(String email, String password) async {
    try {
      UserCredential Credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Credential.user;
    } on FirebaseAuthException catch (e) {
      Utils.errorToast(e.code);
    } catch (e) {
      Utils.errorToast(e.toString(),);
    }
  }

  static Future<User?> loginUser(String email, String password) async {
    try {
      UserCredential Credential =  await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return Credential.user;
    } on FirebaseAuthException catch (e) {
      Utils.errorToast(e.code);
    } catch (e) {
      Utils.errorToast(e.toString(),);
    }
  }
}
