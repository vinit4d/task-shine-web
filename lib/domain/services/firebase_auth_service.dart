abstract class FirebaseAuthService {
  Future<dynamic> callLogin(String email, String password);

  Future<dynamic> callSocialLogin();

  Future<dynamic> callSignUp(
    String name,
    String email,
    String password,
  );
}
