import 'package:solidprinciplesproject/app/repositories/auth/authentication_repo.dart';

abstract class LoginWithEmailRepository implements AuthenticationRepository {
  Future<bool> signInWithEmailPassword(String email, String password);
}
