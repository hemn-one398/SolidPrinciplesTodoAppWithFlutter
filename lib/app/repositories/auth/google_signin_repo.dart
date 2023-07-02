import 'package:solidprinciplesproject/app/repositories/auth/authentication_repo.dart';

abstract class GoogleSignInAuthentication implements AuthenticationRepository {
  Future<bool> signInWithGoogle();
}
