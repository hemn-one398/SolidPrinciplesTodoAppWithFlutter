import 'package:solidprinciplesproject/app/repositories/auth/login_with_email_repo.dart';

class EmailPasswordAuthClient {
  final LoginWithEmailRepository authentication;

  EmailPasswordAuthClient(this.authentication);

  Future<void> signInWithEmail(String email, String password) async {
    final success =
        await authentication.signInWithEmailPassword(email, password);
    if (success) {
      // Perform actions after successful sign-in
    } else {
      // Handle sign-in failure
    }
  }

  // Other methods specific to email/password authentication
}
