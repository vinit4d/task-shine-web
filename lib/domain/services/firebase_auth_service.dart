import 'package:the_apple_sign_in/scope.dart';

abstract class FirebaseAuthService {
  Future<dynamic> callLogin(String email, String password);

  Future<dynamic> callSocialLogin();
  Future<dynamic>  signInWithApple({List<Scope> scopes = const []});

  Future<dynamic> callSignUp(
    String name,
    String email,
    String password,
  );


}
