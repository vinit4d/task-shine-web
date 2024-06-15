import 'dart:io';
import '../exception/exception_handler.dart';
import '../../domain/enums/app_state_enum.dart';
import 'package:demo/data/base/base_response_model.dart';
import 'package:demo/domain/repository/firebase_auth_repo.dart';
import '../../presentation/theme/theme_config.dart';
import '../remote_services/firebase_auth_services_imp.dart';

class FirebaseAuthRepoImp extends FirebaseAuthRepo {
  FirebaseAuthServiceImp service = FirebaseAuthServiceImp();

  @override
  Future<BaseResponseModel<dynamic>> setLogin(
      {required String email, required String password}) async {
    try {
      final res = await service.callLogin(email, password);

      if (res is String) {
        return BaseResponseModel<dynamic>(
            state: AppStateEnum.error, message: res, data: '');
      }
      {
        return BaseResponseModel<dynamic>(
            state: AppStateEnum.success,
            data: res,
            message: ThemeConfig.strings.successLoggedIn);
      }
    } on ValidationException catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.validationError, message: e.message, data: "");
    } on SocketException catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.socket, message: e.message, data: "");
    } catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.error,
          message: ThemeConfig.strings.somethingWentWrong,
          data: '');
      // rethrow;
    }
  }

  @override
  Future<BaseResponseModel<dynamic>> setSignup(
      {required String name, required String email, required password}) async {
    try {
      final res = await service.callSignUp(name, email, password);

      if (res is String) {
        return BaseResponseModel<dynamic>(
            state: AppStateEnum.error, message: res, data: '');
      } else {
        return BaseResponseModel<dynamic>(
            state: AppStateEnum.success,
            data: res,
            message: ThemeConfig.strings.successLoggedIn);
      }
    } on ValidationException catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.validationError, message: e.message, data: "");
    } on SocketException catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.socket, message: e.message, data: "");
    } catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.error,
          message: ThemeConfig.strings.somethingWentWrong,
          data: '');
      // rethrow;
    }
  }

  @override
  Future<BaseResponseModel<dynamic>> socialMediaLogin() async {
    try {
      final res = await service.callSocialLogin();

      return BaseResponseModel<dynamic>(
          state: AppStateEnum.success,
          data: res,
          message: ThemeConfig.strings.successLoggedIn);
    } on ValidationException catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.validationError, message: e.message, data: "");
    } on SocketException catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.socket, message: e.message, data: "");
    } catch (e) {
      return BaseResponseModel<dynamic>(
          state: AppStateEnum.error,
          message: ThemeConfig.strings.somethingWentWrong,
          data: '');
    }
  }
}
