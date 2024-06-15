import '../../data/base/base_response_model.dart';

abstract class FirebaseAuthRepo {
  Future<BaseResponseModel<dynamic>> setLogin(
      {required String email, required String password});

  Future<BaseResponseModel<dynamic>> socialMediaLogin();

  Future<BaseResponseModel<dynamic>> setSignup(
      {required String name, required String email, required password});
}
